
<div class="form-group ${hasErrors(bean: candidateInstance, field: 'address.postCode', 'has-error')} ">
    <label for="postCode.id" class="col-sm-4 control-label">
        <g:message code="postCode.code.label" default="Post Code" />
    </label>
    <div class="col-sm-8">
        <g:hiddenField
                name="postCode.id"
                id="postCodeId"
                value="${postCodeId}"
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
                $("#postCodeId").select2({
                    placeholder: doWeHaveAPostCodeAlready,
//                                  VERY IMPORTANT
                    //minimumInputLength: 4,
                    ajax:{
                        url: '<g:createLink controller="postCode" action="getPostCodes" />',
                        dataType: 'json',
                        data: function(term, page){
                            return {inputCode: term};
                        },
                        results: function (data, page) {
                            return {results: data};
                        }
                    },
                    initSelection: function(element, callback) {
                        var id=$("#postCodeId").val();
                        if (id!=="") {
                            $("#s2id_postCodeId .select2-chosen").html($("#postCodeId").val());
                        }
                    },
                    formatSelection: formatPostCodeSelection,
                    formatResult: formatPostCodeResult,
                    escapeMarkup: function (m) { return m; }
                });

        </g:javascript>
    </div>
</div>
