package skillo.candidate

import grails.transaction.Transactional
import org.grails.datastore.mapping.query.api.Criteria
import org.hibernate.annotations.FetchMode
import skillo.Qualification
import skillo.filters.CandidateFilter
import skillo.filters.CandidateListFilter
import skillo.filters.CandidateMatch

@Transactional
class CandidateSearchService {

    def Collection<Candidate> search(CandidateListFilter filter){

        Criteria cc = Candidate.createCriteria()

        def candidateList =  cc.list(max:filter.max, offset:filter.offset) {
            if(filter.firstName){
                ilike("firstName", new String("%$filter.firstName%"))
            }
            if(filter.lastName){
                ilike("lastName", "%$filter.lastName%")
            }

            if(filter.telephoneNumber){
                eq("telephoneNumber", filter.telephoneNumber)
            }

            /**
             * choose true or false depending on user settings/checkbox
             */
            eq ("active", true)

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

            if(filter.sort && filter.order){
                order(filter.sort, filter.order)
            }

            order("lastUpdated", "desc")
        }

        return candidateList
    }

    def Collection<Candidate> search(CandidateMatch filter){
        log.info("CandidateService.search")
        Criteria cc = Candidate.createCriteria()

        def candidateList =  cc.list() {

            or {
                if(filter.firstName){
                    ilike("firstName", "%$filter.firstName%")
                }
                if(filter.lastName){
                    ilike("lastName", "%$filter.lastName%")
                }
                if(filter.telephoneNumber){
                    ilike("telephoneNumber", "%$filter.telephoneNumber%")
                }
                if(filter.postCodeId){
                    sqlRestriction(" exists (" +
                            "select id " +
                            "from " +
                            "address addr " +
                            "where " +
                            "addr.post_code_id = ? " +
                            ")",[filter.postCodeId])
                }
            }

            eq ("active", true)

            order("firstName", "asc")
        }

        return candidateList;
    }

    def search(CandidateFilter filter){
        def criteria = Candidate.createCriteria()
        def result = criteria.list(){
            eq("active", true)
            and {
                if(filter.getQualificationsIds()){
                    candidateQualifications {
                        inList("qualification.id", filter.getQualificationsIds().getAt(0))
                    }
                }
                if(filter.getOperators()){
                    int iOp = 0;
                    for(String op : filter.getOperators()){
                        if("AND".equals(op)){
                            if(filter.getQualificationsIds().size() > (iOp+1) && filter.getQualificationsIds().getAt(iOp+1)){
                                candidateQualifications {
                                    inList("qualification.id", filter.getQualificationsIds().getAt(iOp+1))
                                }
                            }
                        }
                        iOp++
                    }
                }
            }
            int iOp = 0;
            for(String op : filter.getOperators()){
                if("NOT".equals(op)){
                    if(filter.getQualificationsIds().size() > (iOp+1) && filter.getQualificationsIds().getAt(iOp+1)){
                        candidateQualifications {
                            not{
                                inList("qualification.id", filter.getQualificationsIds().getAt(iOp+1))
                            }
                        }
                    }
                }
                iOp++
            }
        }

        return result
    }
}
