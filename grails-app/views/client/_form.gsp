<!@ page import="skillo.Client %>
<legend><g:message code="client.form.basicInfo" /></legend>
<div class="form-group">
    <label for="client.name" class="col-sm-4 control-label" >
        <g:message code="client.name.label" default="Name" />
    </label>
    <div class="col-sm-8">
        <g:textField name="client.name" class="form-control" value="${clientInstance?.name}" />
    </div>
</div>
<div class="form-group">
    <label for="client.registrationNumber" class="col-sm-4 control-label" >
        <g:message code="client.registrationNumber.label" default="Name" />
    </label>
    <div class="col-sm-8">
        <g:textField name="client.registrationNumber" class="form-control" value="${clientInstance?.registrationNumber}" />
    </div>
</div>
<div class="form-group">
    <label for="address.details" class="col-sm-4 control-label">
        <g:message code="client.address.label" default="Address" />
    </label>
    <div class="col-sm-8">
        <g:textArea name="address.details" class="form-control" value="${clientInstance?.address?.details}" />
    </div>
</div>

%{--<g:render contextPath="/address" template="/postCodeAutocompleteInput" model="${['postCodeId':clientInstance?.address?.postCode?.id]}"/>--}%



<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.postCode', 'has-error')} ">
    <label for="postCode.id" class="col-sm-4 control-label">
        <g:message code="postCode.code.label" default="Post Code" />
    </label>
    <div class="col-sm-8">
        <g:hiddenField
                name="postCode.id"
                id="postCodeId"
                value="${clientInstance?.address?.postCode?.id}"
        />
        <g:hiddenField
                name="postCode.previousCode"
                id="postCodePlaceholder"
                value="${clientInstance?.address?.postCode?.code} - ${clientInstance?.address?.postCode?.country}"
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
                    formatSelection: formatPostCodeSelection,
                    formatResult: formatPostCodeResult,
                    initSelection: function(element, callback) {
                        var id=$("#postCodeId").val();
                        if (id!=="") {
                            $("#s2id_postCodeId .select2-chosen").html($("#postCodePlaceholder").val());
                        }
                    },
                    escapeMarkup: function (m) { return m; }

                });

        </g:javascript>
    </div>
</div>

