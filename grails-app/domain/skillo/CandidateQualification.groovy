package skillo

class CandidateQualification {

    Qualification qualification
    Date expiryDate
    String number
    Boolean isMainTrade

    Boolean active = Boolean.TRUE

    static belongsTo = [candidate:Candidate]

    static constraints = {
        expiryDate nullable: true
        number nullable: true, blank: false
    }


    def Boolean isExpired(){
        return expiryDate == null ? null : new Date().after(expiryDate)
    }

    def Boolean willExpireSoonerThan(int days){
        if (expiryDate == null){
            return null
        }

        Date newDate = new Date();

        GregorianCalendar calendar = new GregorianCalendar();
        calendar.setTime(newDate);
        calendar.add(Calendar.DATE, days);
        newDate.setTime(calendar.getTime().getTime());

        return newDate.after(expiryDate)
    }

    def Boolean isMoreThenTwoMonthsValid(){
        return !willExpireSoonerThan(60)
    }
}
