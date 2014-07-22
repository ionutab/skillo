package skillo.filters

class CandidateListSearch extends CandidateMatch implements Serializable {

    private String qualification

    String getQualification() {
        return qualification
    }

    void setQualification(String qualification) {
        this.qualification = qualification
    }
}
