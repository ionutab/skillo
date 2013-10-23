var candidateFormFunctions = {
    initDatePicker:function(){
        $("#candidateBirthDate").datepicker({
            viewMode:'years'
        });
    },

    setCandidateBirthdate18YearsAgo:function(){

        var myDate=new Date();
        myDate.setYear(myDate.getYear() - 18);
        $("#candidateBirthDate").datepicker('setValue',myDate);

    }
}

$(document).ready(function() {

    $(".date").addClass("input-small");

    $("#newQualificationId").select2({
            placeholder: "Select a Qualification",
            allowClear:true
        }
    );

    candidateFormFunctions.initDatePicker();

    $("#candidateBirthDate").click(function(){
        if(this.value == null || this.value == ''){
            candidateFormFunctions.setCandidateBirthdate18YearsAgo();
        }
    });

});
