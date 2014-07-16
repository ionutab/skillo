<!@ page import="skillo.Client %>
<div class="form-group ${hasErrors(bean: clientInstance, field: 'name', 'has-error')}"">
    <label for="client.name" class="col-md-3 control-label" >
        <g:message code="client.name.label" default="Name" />
    </label>
    <div class="col-md-9">
        <g:textField name="client.name" class="form-control" value="${clientInstance?.name}" />
        <g:eachError var="err" bean="${clientInstance}" field="name">
            <g:if test="${err.code == 'matches.invalid'}">
                <span class="control-label"><g:message code="custom.invalid.nonHumanName.message"/></span>
            </g:if>
            <g:if test="${err.code == 'nullable'}">
                <span class="control-label"><g:message code="custom.null.message"/></span>
            </g:if>
        </g:eachError>
    </div>
</div>
<div class="form-group ${hasErrors(bean: clientInstance, field: 'registrationNumber', 'has-error')}">
    <label for="client.registrationNumber" class="col-md-3 control-label" >
        <g:message code="client.registrationNumber.label" default="Name" />
    </label>
    <div class="col-md-9">
        <g:textField name="client.registrationNumber" class="form-control" value="${clientInstance?.registrationNumber}" />
        <g:eachError var="err" bean="${clientInstance}" field="registrationNumber">
            <g:if test="${err.code == 'matches.invalid'}">
                <span class="control-label"><g:message code="custom.invalid.fiscalNumber.message"/></span>
            </g:if>
            <g:if test="${err.code == 'nullable'}">
                <span class="control-label"><g:message code="custom.null.message"/></span>
            </g:if>
        </g:eachError>
    </div>
</div>
<div class="form-group ${hasErrors(bean: clientInstance, field: 'telephoneNumber', 'has-error')}">
    <label for="client.telephoneNumber" class="col-md-3 control-label" >
        <g:message code="client.telephoneNumber.label" default="Name" />
    </label>
    <div class="col-md-9">
        <g:textField name="client.telephoneNumber" id="telephoneNumber" class="form-control" value="${clientInstance?.telephoneNumber}" />
        <g:eachError var="err" bean="${clientInstance}" field="telephoneNumber">
            <g:if test="${err.code == 'nullable'}">
                <span class="control-label"><g:message code="custom.null.message"/></span>
            </g:if>
        </g:eachError>
        <g:javascript>
            $("#telephoneNumber").inputmask("99999-999-999", {"placeholder":"_____-___-___"});
        </g:javascript>
    </div>
</div>
<div class="form-group">
    <label for="address.details" class="col-md-3 control-label">
        <g:message code="client.address.label" default="Address" />
    </label>
    <div class="col-md-9">
        <g:textArea name="address.details" class="form-control" value="${clientInstance?.address?.details}" />
    </div>
</div>
%{--<g:render contextPath="/address" template="/postCodeAutocompleteInput" model="${['postCodeId':clientInstance?.address?.postCode?.id]}"/>--}%

<div class="form-group">
    <label for="postCode.id" class="col-md-3 control-label">
        <g:message code="postCode.code.label" default="Post Code" />
    </label>
    <div class="col-md-9">
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
                    minimumInputLength: 4,
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

