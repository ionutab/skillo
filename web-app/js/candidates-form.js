$(document).ready(function() {

    $(".date").addClass("input-small");

    $("#mainTradeId").select2({
            placeholder: "Select a Qualification",
            allowClear:true
        }
    );
    $("#newQualificationId").select2({
            placeholder: "Select a Qualification",
            allowClear:true
        }
    );

    $("#birthDate").datepicker({
        viewMode:'years'
    });

});
