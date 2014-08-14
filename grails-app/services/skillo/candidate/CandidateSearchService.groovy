package skillo.candidate

import grails.transaction.Transactional
import org.grails.datastore.mapping.query.api.Criteria
import skillo.Qualification
import skillo.candidate.Candidate
import skillo.enums.SearchOperator
import skillo.filters.CandidateListSearch
import skillo.filters.CandidateMatch

@Transactional
class CandidateSearchService {

    def Collection<Candidate> search(CandidateListSearch filter){

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
            if(filter.sort && filter.order){
                order(filter.sort, filter.order)
            }
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

    def Collection<Candidate> advancedSearch(Long qualification1, SearchOperator op1, Long qualification2, SearchOperator op2, Long qualification3, Long postcode){


        Criteria cc = Candidate.createCriteria()

        def candidateList =  cc.list() {

                Qualification c1 = null
                Qualification c2 = null

                if(qualification1){
                    c1 = Qualification.get(qualification1)
                }

                if(qualification2) {
                    c2 = Qualification.get(qualification2)
                }

                if(op1 == SearchOperator.AND){
                    and {
                        if(c1){
                            sqlRestriction(" exists (" +
                                    "select * " +
                                    "from " +
                                    "candidate_qualification cq, " +
                                    "qualification q where " +
                                    "cq.qualification_id = q.id " +
                                    "and cq.candidate_id = this_.id " +
                                    "and lower(q.name) like ? " +
                                    ")",["%" + c1.name.toLowerCase() + "%"])
                        }
                        if(c2){
                            sqlRestriction(" exists (" +
                                    "select * " +
                                    "from " +
                                    "candidate_qualification cq, " +
                                    "qualification q where " +
                                    "cq.qualification_id = q.id " +
                                    "and cq.candidate_id = this_.id " +
                                    "and lower(q.name) like ? " +
                                    ")", ["%" + c2.name.toLowerCase() + "%"])
                        }
                    }
                } else if (op1 == SearchOperator.OR){
                    or {
                        if(c1){
                            sqlRestriction(" exists (" +
                                    "select * " +
                                    "from " +
                                    "candidate_qualification cq, " +
                                    "qualification q where " +
                                    "cq.qualification_id = q.id " +
                                    "and cq.candidate_id = this_.id " +
                                    "and lower(q.name) like ? " +
                                    ")",["%" + c1.name.toLowerCase() + "%"])
                        }
                        if(c2){
                            sqlRestriction(" exists (" +
                                    "select * " +
                                    "from " +
                                    "candidate_qualification cq, " +
                                    "qualification q where " +
                                    "cq.qualification_id = q.id " +
                                    "and cq.candidate_id = this_.id " +
                                    "and lower(q.name) like ? " +
                                    ")", ["%" + c2.name.toLowerCase() + "%"])
                        }
                    }
                }

        }

        return candidateList;

    }

}
