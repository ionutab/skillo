package skillo.filters

class CandidateFilter extends BasicSearchFilter implements Serializable {

    protected Collection<Collection<Long>> qualifications

    Collection<Collection<Long>> getQualifications() {
        return qualifications
    }

    void setQualifications(Collection<Collection<Long>> qualifications) {
        this.qualifications = qualifications
    }

    @Override
    public String toString() {
        String qualificationsString = new String("\n")
        for(Collection<Long> c : qualifications){

            for(Long l : c){
                qualificationsString += l + ","
            }
            qualificationsString += "\n"
        }

        return "CandidateFilter{" +
                "qualifications=" + qualifications.size() + ":"+ qualificationsString +
                '}';
    }
}
