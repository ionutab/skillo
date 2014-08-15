<g:hiddenField name="client.id" value="${clientInstance?.id}"/>
<div class="col-sm-6 col-md-6">
    <div class="form-group ${hasErrors(bean: newClientContact, field: 'firstName', 'has-error')}">
        <label for="newClientContact.firstName" class="col-md-3 control-label">
            <g:message code="contact.firstName.label" default="First Name"/>
        </label>
        <div class="col-md-9">
            <g:textField name="newClientContact.firstName" id="newContactFirstName" class="form-control" value="${newClientContact?.firstName}" tabindex="20"/>
            <g:eachError var="err" bean="${newClientContact}" field="firstName">
                <g:if test="${err.code == 'matches.invalid'}">
                    <span class="control-label"><g:message code="custom.invalid.name.message"/></span>
                </g:if>
                <g:if test="${err.code == 'nullable'}">
                    <span class="control-label"><g:message code="custom.null.message"/></span>
                </g:if>
            </g:eachError>
        </div>
    </div>
    <div class="form-group ${hasErrors(bean: newClientContact, field: 'telephoneNumber', 'has-error')}">
        <label for="newClientContact.telephoneNumber" class="col-md-3 control-label">
            <g:message code="contact.telephoneNumber.label" default="Telephone nr"/>
        </label>
        <div class="col-md-9">
            <g:textField name="newClientContact.telephoneNumber" id="newContactTelephoneNumber" class="form-control" value="${newClientContact?.telephoneNumber}" tabindex="22" />
            <g:hasErrors bean="${newClientContact}" field="telephoneNumber">
                <g:eachError var="err" bean="${consultant}" field="telephoneNumber">
                    <g:if test="${err.code == 'matches.invalid'}">
                        <span class="control-label"><g:message
                                code="custom.invalid.telephone.message"/></span>
                    </g:if>
                    <g:if test="${err.code == 'blank'}">
                        <span class="control-label"><g:message code="custom.null.message"/></span>
                    </g:if>
                </g:eachError>
            </g:hasErrors>
            <g:javascript>
                $("#newContactTelephoneNumber").inputmask("${message(code: 'default.telephoneNumber.inputmask')}", {"placeholder":"${message(code: 'default.telephoneNumber.placeholder')}"});
            </g:javascript>
        </div>
    </div>
    <div class="form-group ${hasErrors(bean: newClientContact, field: 'email', 'has-error')}">
        <label for="newClientContact.email" class="col-md-3 control-label">
            <g:message code="contact.email.label" default="Email"/>
        </label>
        <div class="col-md-9">
            <g:textField name="newClientContact.email" id="newContactRole" class="form-control" value="${newClientContact?.email}" tabindex="24" />
            <g:eachError var="err" bean="${newClientContact}" field="email">
                <g:if test="${err.code == 'email.invalid'}">
                    <span class="control-label" >
                    <g:message code="custom.invalid.email.message"/>
                    <span>
                </g:if>
            </g:eachError>
        </div>
    </div>
</div>
<div class="col-sm-6 col-md-6">
    <div class="form-group ${hasErrors(bean: newClientContact, field: 'firstName', 'has-error')}">
        <label for="newClientContact.lastName" class="col-md-3 control-label">
            <g:message code="contact.lastName.label" default="Last Name"/>
        </label>
        <div class="col-md-9">
            <g:textField name="newClientContact.lastName" id="newContactLastName" class="form-control" value="${newClientContact?.lastName}" tabindex="21"/>
            <g:eachError var="err" bean="${newClientContact}" field="lastName">
                <g:if test="${err.code == 'matches.invalid'}">
                    <span class="control-label"><g:message code="custom.invalid.name.message"/></span>
                </g:if>
                <g:if test="${err.code == 'nullable'}">
                    <span class="control-label"><g:message code="custom.null.message"/></span>
                </g:if>
            </g:eachError>
        </div>
    </div>
    <div class="form-group ${hasErrors(bean: newClientContact, field: 'landlineNumber', 'has-error')}">
        <label for="newClientContact.landlineNumber" class="col-md-3 control-label">
            <g:message code="contact.landlineNumber.label" default="Landline nr"/>
        </label>
        <div class="col-md-9">
            <g:textField name="newClientContact.landlineNumber" id="newContactLandlineNumber" class="form-control" value="${newClientContact?.landlineNumber}" tabindex="23"/>
            <g:hasErrors bean="${newClientContact}" field="landlineNumber">
                <g:eachError var="err" bean="${consultant}" field="landlineNumber">
                    <g:if test="${err.code == 'matches.invalid'}">
                        <span class="control-label"><g:message
                                code="custom.invalid.telephone.message"/></span>
                    </g:if>
                    <g:if test="${err.code == 'blank'}">
                        <span class="control-label"><g:message code="custom.null.message"/></span>
                    </g:if>
                </g:eachError>
            </g:hasErrors>
            <g:javascript>
                $("#newContactLandlineNumber").inputmask("${message(code: 'default.telephoneNumber.inputmask')}", {"placeholder":"${message(code: 'default.telephoneNumber.placeholder')}"});
            </g:javascript>
        </div>
    </div>
    <div class="form-group ">
        <label for="newClientContact.role" class="col-md-3 control-label">
            <g:message code="contact.role.label" default="Role"/>
        </label>
        <div class="col-md-9">
            <g:textField name="newClientContact.role" id="newContactRole" class="form-control" value="${newClientContact?.role}" tabindex="25"/>
        </div>
    </div>
</div>