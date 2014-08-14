<!@ page import="skillo.client.Client %>
<div class="form-group ${hasErrors(bean: clientInstance, field: 'name', 'has-error')}"">
    <label for="client.name" class="col-md-3 control-label" >
        <g:message code="client.name.label" default="Name" />
    </label>
    <div class="col-md-9">
        <g:textField name="client.name" class="form-control" value="${clientInstance?.name}" />
        <g:eachError var="err" bean="${clientInstance}" field="name">
            <g:if test="${err.code == 'matches.invalid'}">
                <span class="control-label"><g:message code="custom.invalid.name.message"/></span>
            </g:if>
            <g:if test="${err.code == 'nullable'}">
                <span class="control-label"><g:message code="custom.null.message"/></span>
            </g:if>
        </g:eachError>
    </div>
</div>
<div class="form-group ${hasErrors(bean: clientInstance, field: 'registrationNumber', 'has-error')}">
    <label for="client.registrationNumber" class="col-md-3 control-label" >
        <g:message code="client.registrationNumber.short.label" default="Registration No" />
    </label>
    <div class="col-md-9">
        <g:textField name="client.registrationNumber" class="form-control" value="${clientInstance?.registrationNumber}" />
        <g:eachError var="err" bean="${clientInstance}" field="registrationNumber">
            <g:if test="${err.code == 'matches.invalid'}">
                <span class="control-label"><g:message code="custom.invalid.match.lettersAndNumbers1"/></span>
            </g:if>
            <g:if test="${err.code == 'nullable'}">
                <span class="control-label"><g:message code="custom.null.message"/></span>
            </g:if>
        </g:eachError>
    </div>
</div>
<div class="form-group ${hasErrors(bean: clientInstance, field: 'telephoneNumber', 'has-error')}">
    <label for="client.telephoneNumber" class="col-md-3 control-label" >
        <g:message code="client.telephoneNumber.short.label" default="Telephone Nr" />
    </label>
    <div class="col-md-9">
        <g:textField name="client.telephoneNumber" id="telephoneNumber" class="form-control" value="${clientInstance?.telephoneNumber}" />
        <g:eachError var="err" bean="${clientInstance}" field="telephoneNumber">
            <g:if test="${err.code == 'nullable'}">
                <span class="control-label"><g:message code="custom.null.message"/></span>
            </g:if>
        </g:eachError>
        <g:javascript>
            $("#telephoneNumber").inputmask("${message(code: 'default.telephoneNumber.inputmask')}", {"placeholder":"${message( code: 'default.telephoneNumber.placeholder')}"});
        </g:javascript>
    </div>
</div>
<div class="form-group ${hasErrors(bean: clientInstance, field: 'faxNumber', 'has-error')}">
    <label for="client.faxNumber" class="col-md-3 control-label" >
        <g:message code="client.faxNumber.short.label" default="Fax Number" />
    </label>
    <div class="col-md-9">
        <g:textField name="client.faxNumber" id="faxNumber" class="form-control" value="${clientInstance?.faxNumber}" />
        <g:eachError var="err" bean="${clientInstance}" field="faxNumber">
            <g:if test="${err.code == 'nullable'}">
                <span class="control-label"><g:message code="custom.null.message"/></span>
            </g:if>
        </g:eachError>
        <g:javascript>
            $("#faxNumber").inputmask("${message(code: 'default.faxNumber.inputmask')}", {"placeholder":"${message( code: 'default.faxNumber.placeholder')}"});
        </g:javascript>
    </div>
</div>
<div class="form-group ${hasErrors(bean: clientInstance, field: 'address.details', 'has-error')}">
    <label for="address.details" class="col-md-3 control-label">
        <g:message code="client.address.label" default="Address" />
    </label>
    <div class="col-md-9">
        <g:textArea name="address.details" class="form-control" value="${clientInstance?.address?.details}" />
        <g:eachError var="err" bean="${clientInstance}" field="address.details">
            <g:if test="${err.code == 'nullable'}">
                <span class="control-label"><g:message code="custom.null.message"/></span>
            </g:if>
            <g:if test="${err.code == 'custom.dependency.postCode'}">
                <span class="control-label"><g:message code="custom.null.message"/> ( This is because you have filled in a Post Code ) </span>
            </g:if>
        </g:eachError>
    </div>
</div>
%{--<g:render contextPath="/address" template="/postCodeAutocompleteInput" model="${['postCodeId':clientInstance?.address?.postCode?.id]}"/>--}%

<div class="form-group">
    <label for="postCode.id" class="col-md-3 control-label">
        <g:message code="postCode.code.label" default="Post Code" />
    </label>
    <div class="col-md-9">

        <g:render template="../postCode/postCodeSelector"
                  model="['attributeName':'postCode.id',
                          'attributeId':'postCodeId' ,
                          'postCode':clientInstance?.address?.postCode]"/>
    </div>
</div>
<div class="form-group ${hasErrors(bean: clientInstance, field: 'website', 'has-error')}">
    <label for="client.website" class="col-md-3 control-label" >
        <g:message code="client.website.label" default="Website" />
    </label>
    <div class="col-md-9">
        <g:textField name="client.website" id="website" class="form-control" value="${clientInstance?.website}" />
        <g:eachError var="err" bean="${clientInstance}" field="website">
            <g:if test="${err.code == 'nullable'}">
                <span class="control-label"><g:message code="custom.null.message"/></span>
            </g:if>
        </g:eachError>
    </div>
</div>