package skillo.candidate

import grails.transaction.Transactional
import org.grails.datastore.mapping.query.api.Criteria
import skillo.PostCode
import skillo.filters.CandidateFilter
import skillo.filters.CandidateListFilter
import skillo.filters.CandidateMatch
import skillo.util.search.DistanceCalculatorUtil

@Transactional
class CandidateSearchService {

    def Collection<Candidate> search(CandidateListFilter filter) {

        Criteria cc = Candidate.createCriteria()

        def candidateList = cc.list(max: filter.max, offset: filter.offset) {
            if (filter.firstName) {
                ilike("firstName", new String("%$filter.firstName%"))
            }
            if (filter.lastName) {
                ilike("lastName", "%$filter.lastName%")
            }

            if (filter.telephoneNumber) {
                eq("telephoneNumber", filter.telephoneNumber)
            }

            /**
             * choose true or false depending on user settings/checkbox
             */
            eq("active", true)

            /*
            if(filter.qualification){
                sqlRestriction(" exists (" +
                        "select * " +
                        "from " +
                            "candidate_qualification cq, " +
                            "qualification q where " +
                            "cq.qualification_id = q.id " +
                            "and cq.candidate_id = this_.id " +
                            "and lower(q.name) like ? " +
                        ")",["%" + filter.qualification.toLowerCase() + "%"])
            }
            */

            if (filter.sort && filter.order) {
                order(filter.sort, filter.order)
            }

            order("lastUpdated", "desc")
        }

        return candidateList
    }

    def Collection<Candidate> search(CandidateMatch filter) {
        log.info("CandidateService.search")
        Criteria cc = Candidate.createCriteria()

        def candidateList = cc.list(max: filter.max, offset: filter.offset) {

            or {
                if (filter.firstName) {
                    ilike("firstName", "%$filter.firstName%")
                }
                if (filter.lastName) {
                    ilike("lastName", "%$filter.lastName%")
                }
                if (filter.telephoneNumber) {
                    ilike("telephoneNumber", "%$filter.telephoneNumber%")
                }
                if (filter.postCodeId) {
                    sqlRestriction(" exists (" +
                            "select id " +
                            "from " +
                            "address addr " +
                            "where " +
                            "addr.post_code_id = ? " +
                            ")", [filter.postCodeId])
                }
            }

            eq("active", true)

            order("firstName", "asc")
        }

        return candidateList;
    }

    /**
     * Method user by candidates advanced search to search for candidates with specific competences,
     * and not too far from the site location (if site postcode id and radius is specified from the interface)
     *
     * @param filter
     * @param sitePostCodeId
     * @param radius
     * @return
     */
    def search(CandidateFilter filter, Long sitePostCodeId, double radius) {
        List<Candidate> candidates = search(filter)
        return radiusSearch(candidates, sitePostCodeId, radius)
    }

    /**
     * Method used to removed candidates that has the competences required but are to far from the site location
     * Here we compare distance from candidate address postcode with the site postcode. If distance is bigger that the radius, the remove the candidate from
     * the list of candidates
     *
     * @param candidates
     *          list of candidates with required competences
     * @param sitePostCodeId
     *          site postcode id
     * @param radius
     *          max distance allowed from the candidate home address to the site address location
     * @return
     */
    def radiusSearch(List<Candidate> candidates, Long sitePostCodeId, double radius) {

        // do the radius filter only if are candidates to filter and if a site location was specified from the interface
        if (candidates && sitePostCodeId && radius) {
            Iterator<Candidate> iterator = candidates.iterator()
            while (iterator.hasNext()) {
                Candidate current = iterator.next()
                //current candidate address postcode
                PostCode candidatePostCode = current.address.postCode
                // site location postcode
                PostCode sitePostCode = PostCode.get(sitePostCodeId)

                if (candidatePostCode && sitePostCode) {
                    // distance in miles from current candidate address to the site address location
                    double distance = DistanceCalculatorUtil.haversine(sitePostCode.latitude, sitePostCode.longitude, candidatePostCode.latitude, candidatePostCode.longitude)
                    if (distance > radius) {
                        iterator.remove()
                    }
                }
            }
        }

        return candidates
    }

    /**
     * Method used to filter candidates by specific competences
     *
     * @param filter
     *          a wrapper that contains all the competences required for a candidate to be eligible for a job
     * @return
     *          a list of candidates that match the requirements
     */
    def search(CandidateFilter filter) {
        def criteria = Candidate.createCriteria()

        def result = criteria.list(max: filter.max, offset: filter.offset) {
            eq("active", true)
            and {
                if (filter.getQualificationsIds()) {
                    candidateQualifications {
                        inList("qualification.id", filter.getQualificationsIds().getAt(0))
                    }
                    if (filter.getOperators()) {
                        int iOp = 0;
                        for (String op : filter.getOperators()) {
                            if ("AND".equals(op)) {
                                if (filter.getQualificationsIds().size() > (iOp + 1) && filter.getQualificationsIds().getAt(iOp + 1)) {
                                    candidateQualifications {
                                        inList("qualification.id", filter.getQualificationsIds().getAt(iOp + 1))
                                    }
                                }
                            }
                            iOp++
                        }
                    }
                }
            }
            int iOp = 0;
            for (String op : filter.getOperators()) {
                if ("NOT".equals(op)) {
                    if (filter.getQualificationsIds().size() > (iOp + 1) && filter.getQualificationsIds().getAt(iOp + 1)) {
                        candidateQualifications {
                            not {
                                Long qId = filter.getQualificationsIds().getAt(iOp + 1);
                                if (qId) {
                                    inList("qualification.id", qId)
                                }
                            }
                        }
                    }
                }
                iOp++
            }
            if (filter.isRegistered) {
                payroll {
                    eq("registered", Boolean.TRUE)
                }
            }
            if (filter.isInducted) {
                payroll {
                    eq("inducted", Boolean.TRUE)
                }
            }
            if (filter.isSponsored) {
                eq("sponsored", Boolean.TRUE)
            }
            if (filter.isDriver) {
                eq("driver", Boolean.TRUE)
            }
            if (filter.isCarOwner) {
                eq("carOwner", Boolean.TRUE)
            }
        }

        return result
    }
}
