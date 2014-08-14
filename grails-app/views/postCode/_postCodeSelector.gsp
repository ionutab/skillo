

<g:hiddenField
        name="${attributeName}"
        id="${attributeId}"
        value="${postCode?.id}"
/>
<g:hiddenField
        name="postCode.previousCode"
        id="${attributeId}Placeholder"
        value="${postCode?.code} - ${postCode?.country}"
/>

<g:javascript>
    function formatPostCodeSelection(item) {
        return item.code + ' - ' + item.country;
    };

    function formatPostCodeResult(item) {
        return item.code + ' - ' + item.country;
    };
    function doWeHaveAPostCodeAlready(){
        return "Search for a Post Code";
    }
    $("#${attributeId}").select2({
        placeholder: doWeHaveAPostCodeAlready,
        allowClear: true,
        // VERY IMPORTANT
        minimumInputLength: 4,
        ajax:{
            url: '<g:createLink controller="postCode" action="getPostCodesByName" />',
            dataType: 'json',
            data: function(term, page){
                return {inputCode: term};
            },
            results: function (data, page) {
                return {results: data};
            }
        },
        initSelection: function(element, callback) {
            var id=$("${attributeId}").val();
            if (id!=="") {
                $("#s2id_${attributeId} .select2-chosen").html($("#${attributeId}Placeholder").val());
            }
        },
        formatSelection: formatPostCodeSelection,
        formatResult: formatPostCodeResult,
        escapeMarkup: function (m) { return m; }
    });
</g:javascript>