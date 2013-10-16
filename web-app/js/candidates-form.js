$(document).ready(function() {

    $(".date").addClass("input-small");

    $("#newQualificationId").select2({
            placeholder: "Select a Qualification",
            allowClear:true
        }
    );

    $(".datepicker").datepicker({
        viewMode:'years'
    });

});
