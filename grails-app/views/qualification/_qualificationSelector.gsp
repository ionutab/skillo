%{-- candidateMainTrade.id --}%
%{-- mainTradeId --}%
%{-- candidateInstance?.getMainTrade()?.qualification?.id --}%

<g:hiddenField
        name="${attributeName}"
        id="${attributeId}"
        value="${qualification?.id}"
/>
<g:hiddenField
        name="candidateMainTrade.previousName"
        id="${attributeId}Placeholder"
        value="${qualification?.name}"
/>

<g:javascript>
        function formatQualificationSelection(item) {
            return item.name;
        };

        function formatQualificationResult(item) {
            return item.name;
        };
        function doWeHaveAQualificationAlready(){
            return "Search for a Qualification";
        }
        $("#${attributeId}").select2({
            placeholder: doWeHaveAQualificationAlready,
            allowClear: true,
            ajax:{
                url: '<g:createLink controller="qualification" action="getQualificationsByName" />',
                dataType: 'json',
                data: function(term, page){
                    return {inputCode: term};
                },
                results: function (data, page) {
                    return {results: data};
                }
            },
            initSelection: function(element, callback) {
                var id=$("#${attributeId}").val();
                if (id!=="") {
                    $("#s2id_${attributeId} .select2-chosen").html($("#${attributeId}Placeholder").val());
                }
            },
            formatSelection: formatQualificationSelection,
            formatResult: formatQualificationResult,
            escapeMarkup: function (m) { return m; }
        });
</g:javascript>