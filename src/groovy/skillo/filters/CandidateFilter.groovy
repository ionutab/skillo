package skillo.filters

import grails.validation.Validateable

@Validateable
class CandidateFilter extends BasicSearchFilter implements Serializable {

    protected ArrayList<HashMap<Long,String>> qualifications

    protected Collection<Collection<Long>> qualificationsIds

    protected ArrayList<String> operators

    protected Boolean isRegistered

    protected Boolean isSponsored

    protected Boolean isInducted

    protected Boolean isDriver

    protected Boolean isCarOwner

    Boolean getIsRegistered() {
        return isRegistered
    }

    void setIsRegistered(Boolean isRegistered) {
        this.isRegistered = isRegistered
    }

    Boolean getIsSponsored() {
        return isSponsored
    }

    void setIsSponsored(Boolean isSponsored) {
        this.isSponsored = isSponsored
    }

    Boolean getIsInducted() {
        return isInducted
    }

    void setIsInducted(Boolean isInducted) {
        this.isInducted = isInducted
    }

    Boolean getIsDriver() {
        return isDriver
    }

    void setIsDriver(Boolean isDriver) {
        this.isDriver = isDriver
    }

    Boolean getIsCarOwner() {
        return isCarOwner
    }

    void setIsCarOwner(Boolean isCarOwner) {
        this.isCarOwner = isCarOwner
    }

    Collection<Collection<Long>> getQualificationsIds() {
        return qualificationsIds
    }

    void setQualificationsIds(Collection<Collection<Long>> qualificationsIds) {
        this.qualificationsIds = qualificationsIds
    }

    ArrayList<HashMap<Long, String>> getQualifications() {
        return qualifications
    }

    void setQualifications(ArrayList<HashMap<Long, String>> qualifications) {
        this.qualifications = qualifications
    }

    ArrayList<String> getOperators() {
        return operators
    }

    void setOperators(ArrayList<String> operators) {
        this.operators = operators
    }

    public translateIntoQualificationIds(){
        if(this.qualifications){
            this.qualificationsIds = new ArrayList<ArrayList<Long>>()
            for(HashMap<Long,String> hmq : this.qualifications){
                this.qualificationsIds.add(hmq.keySet())
            }
        }
    }

    @Override
    public String toString() {
        String qualificationsString = new String("\n")
        for(HashMap<Long,String> c : qualifications){

            for(Long l : c.keySet()){
                qualificationsString += l + ","
            }
            qualificationsString += "\n"
        }

        return "CandidateFilter{" +
                "qualifications=" + qualifications.size() + ":"+ qualificationsString +
                '}';
    }
}
