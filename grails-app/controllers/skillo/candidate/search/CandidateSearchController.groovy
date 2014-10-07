package skillo.candidate.search

import grails.converters.JSON
import skillo.BaseController
import skillo.candidate.Candidate
import skillo.filters.CandidateFilter

/**
 * CandidateSearchController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class CandidateSearchController extends BaseController{

    static scope = "session"

    def candidateSearchService

    def CandidateFilter filter = new CandidateFilter()

    def index(){
        log.info("INDEX")

        render(view: "/candidate/search/search")
    }

    def search(){
        log.info("SEARCH ")
        log.info(params)

        ArrayList<String> inputQualificationSets = new ArrayList<String>()
        ArrayList<HashMap<Long,String>> qualificationSets = new ArrayList<HashMap<Long, String>>()

        /*
        if(session['qualificationSets']){
            qualificationSets = session['qualificationSets']
        }
        */

        if(params.advancedSearch) {
            inputQualificationSets = params.advancedSearch.list('qualifications')
            qualificationSets = splitAdvancedSearchArrayToHashMap(inputQualificationSets)
            filter.qualifications = getIdsFromHashMapArray(qualificationSets)
        }

//        session['qualificationSets'] = qualificationSets
        render(view: "/candidate/search/search", model:[candidateFilter:filter, qualificationSets:qualificationSets as grails.converters.JSON, candidateList:Candidate.list()])
    }

    def displayQualificationSetWidget(){
        log.info("GET NEW SEARCH WIDGET")
        render(view: "/candidate/search/_qualificationSetWidget")
    }

    def Collection<Collection<Long>> splitAdvancedSearchArray(ArrayList<String> inputArray){

        Collection<Collection<Long>> ret = new ArrayList<ArrayList<Long>>()

        for (String unexploded : inputArray){
            if(unexploded.trim().length() > 0){
                ArrayList<String> valS = Arrays.asList(unexploded.split(","))
                ArrayList<Long> val = new ArrayList<Long>()

                for(String id: valS){
                    String[] valSId = id.split(":")
                    val.add(Long.parseLong(valSId[0]))
                }

                ret.add(val)
            }
        }

        return ret
    }

    def Collection<HashMap<Long, String>> splitAdvancedSearchArrayToHashMap(ArrayList<String> inputArray){
        Collection<HashMap<Long, String>> ret = new ArrayList<ArrayList<Long>>()

        for (String unexploded : inputArray){
            if(unexploded.trim().length() > 0){
                ArrayList<String> valUnsplit = Arrays.asList(unexploded.split(","))
                HashMap<Long, String> vals = new HashMap<Integer, String>()

                for(String section: valUnsplit){
                    String[] sectionSplit = section.split(":")
                    if(sectionSplit.length > 1){
                        if(sectionSplit[0].matches("\\d+")){
                            vals.put(Long.parseLong(sectionSplit[0]), sectionSplit[1])
                        }
                    }
                }
                ret.add(vals)
            }
        }

        return ret
    }

    def Collection<Collection<Long>> getIdsFromHashMapArray(ArrayList<HashMap<Long, String>> inputMap){
        Collection<Collection<Long>> ret

        if(inputMap.size() > 0){
            ret =  new ArrayList<ArrayList<Long>>()
        } else {
            return null
        }
        for(HashMap<Long,String> map:inputMap){
            ret.add(map.keySet())
        }

        return ret
    }
}
