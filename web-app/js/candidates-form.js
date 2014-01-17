var candidateFormFunctions = {
    initDatePicker:function(elementId){
        $(elementId).datepicker({
              startView:"decade",
              autoclose: true
        });
    },

    setCandidateBirthdate18YearsAgo:function(elementId){
        var myDate=new Date();
        myDate.setYear(myDate.getYear() - 18);
        $(elementId).datepicker('setValue',myDate);
    },

    resetThisThing:function(formId){
        alert('some shit');
    }
}

$(document).ready(function() {

    $(".date").addClass("input-small");

    $("#newCandidateQualificationQualificationId").select2({
            placeholder: "Select a Qualification",
            allowClear:true
        }
    );

    candidateFormFunctions.initDatePicker("#candidateBirthDate");
    candidateFormFunctions.initDatePicker("#newCandidateQualificationExpiryDate");

    $("#candidateBirthDate").click(function(){
        if(this.value == null || this.value == ''){
            candidateFormFunctions.setCandidateBirthdate18YearsAgo("#candidateBirthDate");
        }
    });

});
