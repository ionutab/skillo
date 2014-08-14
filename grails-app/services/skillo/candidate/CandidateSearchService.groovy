package skillo.candidate

import grails.transaction.Transactional
import org.grails.datastore.mapping.query.api.Criteria
import skillo.Qualification
import skillo.candidate.Candidate
import skillo.enums.SearchOperator
import skillo.filters.CandidateListSearch
import skillo.filters.CandidateMatch

import java.util.concurrent.ArrayBlockingQueue

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

        String query="SELECT DISTINCT cq.candidate FROM CandidateQualification cq "

            if(qualification1){
                    if(qualification2){
                        if(op1==SearchOperator.AND) {
                            query += "where cq.qualification.id IN (:list)"
                            return Candidate.executeQuery(query, [list: Arrays.asList(qualification1, qualification2)])
                        }else if(op1 == SearchOperator.OR){
                            query += "where cq.qualification.id=:firstQualificationId OR where cq.qualification.id=:secondQualificationId"
                            return Candidate.executeQuery(query, [firstQualificationId:qualification1, secondQualificationId:qualification2])
                        }
                    }else{
                        query += "where cq.qualification.id=?"
                        return Candidate.executeQuery(query, [qualification1])
                    }
            }



        return null
    }

}
