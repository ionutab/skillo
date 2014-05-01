var candidateFormFunctions = {
    initDatePicker:function(elementId){
        $(elementId).datepicker({
            startView:"decade",
            orientation: "top auto",
            autoclose: true
        });
    },

    initDatePickerOnAll:function(className){
        $("."+className).datepicker({
            startView:"decade",
            orientation: "top auto",
            autoclose: true
        });
    },

    initSwitchOnAll:function(className){

        $("."+className).bootstrapSwitch();
    },

    setCandidateBirthdate18YearsAgo:function(elementId){
        var myDate=new Date();
        myDate.setYear(myDate.getYear() - 18);

        var myMonth =myDate.getMonth()+1 < 10 ? myDate.getMonth()+1 : "0" + myDate.getMonth()+1;
        $(elementId).val(new String( myMonth + "/" + myDate.getDate() + "/" + myDate.getFullYear()));
    }
}

$(document).ready(function() {

    candidateFormFunctions.initDatePickerOnAll("datepicker");
    candidateFormFunctions.initSwitchOnAll("checkbox");

    $("#newCandidateQualificationQualificationId").select2({
            placeholder: "Select a Qualification",
            allowClear:true
        }
    );

    //TODO: make sure this is working fine

    if($("#candidateBirthDate") != null && ($("#candidateBirthDate").val() == null ||  "" == $("#candidateBirthDate").val())){
        candidateFormFunctions.setCandidateBirthdate18YearsAgo("#candidateBirthDate");
    }

});
