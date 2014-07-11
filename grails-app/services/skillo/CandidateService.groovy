package skillo

import grails.transaction.Transactional
import org.grails.datastore.mapping.query.api.Criteria
import skillo.filters.CandidateListSearch
import skillo.filters.CandidateMatch

@Transactional
class CandidateService {

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
        }

        return candidateList
    }

    def Collection<Candidate> search(CandidateMatch filter){

        Criteria cc = Candidate.createCriteria()

        def candidateList =  cc.list() {
            or {
                if(filter.firstName){
                    ilike("firstName", "%$filter.firstName%")
                }

                if(filter.lastName){
                    ilike("lastName", "%$filter.lastName%")
                }
            }

            or {if(filter.telephoneNumber){
                ilike("telephoneNumber", "%$filter.telephoneNumber%")
            }}

            eq ("active", true)

            order("firstName", "asc")

        }

        return candidateList;
    }

}
