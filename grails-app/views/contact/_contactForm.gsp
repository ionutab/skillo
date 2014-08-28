<g:hiddenField name="contactModalSuccess" id="contactModalSuccess" value="${contactModalSuccess}"/>

<g:hiddenField name="client.id" value="${clientInstance?.id}"/>
<g:hiddenField name="contextClientContact.client.id" value="${contextClientContact?.client?.id}"/>
<g:hiddenField name="contextClientContact.id" id="contextClientContactId" value="${contextClientContact?.id}"/>
<div class="row">
	<div class="col-sm-12 col-md-12">
		<div class="form-group ${hasErrors(bean: contextClientContact, field: 'firstName', 'has-error')}">
			<label for="contextClientContact.firstName" class="col-md-3 control-label">
				<g:message code="contact.firstName.label" default="First Name"/>
			</label>
			<div class="col-md-9">
				<g:textField name="contextClientContact.firstName" id="newContactFirstName" class="form-control" value="${contextClientContact?.firstName}" />
				<g:eachError var="err" bean="${contextClientContact}" field="firstName">
					<g:if test="${err.code == 'matches.invalid'}">
						<span class="control-label"><g:message code="custom.invalid.name.message"/></span>
					</g:if>
					<g:if test="${err.code == 'nullable'}">
						<span class="control-label"><g:message code="custom.null.message"/></span>
					</g:if>
				</g:eachError>
			</div>
		</div>

		<div class="form-group ${hasErrors(bean: contextClientContact, field: 'lastName', 'has-error')}">
			<label for="contextClientContact.lastName" class="col-md-3 control-label">
				<g:message code="contact.lastName.label" default="Last Name"/>
			</label>
			<div class="col-md-9">
				<g:textField name="contextClientContact.lastName" id="newContactLastName" class="form-control" value="${contextClientContact?.lastName}" />
				<g:eachError var="err" bean="${contextClientContact}" field="lastName">
					<g:if test="${err.code == 'matches.invalid'}">
						<span class="control-label"><g:message code="custom.invalid.name.message"/></span>
					</g:if>
					<g:if test="${err.code == 'nullable'}">
						<span class="control-label"><g:message code="custom.null.message"/></span>
					</g:if>
				</g:eachError>
			</div>
		</div>
		<div class="form-group ${hasErrors(bean: contextClientContact, field: 'telephoneNumber', 'has-error')}">
			<label for="contextClientContact.telephoneNumber" class="col-md-3 control-label">
				<g:message code="contact.telephoneNumber.label" default="Telephone nr"/>
			</label>
			<div class="col-md-9">
				<g:textField name="contextClientContact.telephoneNumber" id="newContactTelephoneNumber" class="form-control telIM" value="${contextClientContact?.telephoneNumber}"  />
				<g:hasErrors bean="${contextClientContact}" field="telephoneNumber">
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
		<div class="form-group ${hasErrors(bean: contextClientContact, field: 'landlineNumber', 'has-error')}">
			<label for="contextClientContact.landlineNumber" class="col-md-3 control-label">
				<g:message code="contact.landlineNumber.label" default="Landline nr"/>
			</label>
			<div class="col-md-9">
				<g:textField name="contextClientContact.landlineNumber" id="newContactLandlineNumber" class="form-control telIM" value="${contextClientContact?.landlineNumber}" />
				<g:hasErrors bean="${contextClientContact}" field="landlineNumber">
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
		<div class="form-group ${hasErrors(bean: contextClientContact, field: 'email', 'has-error')}">
			<label for="contextClientContact.email" class="col-md-3 control-label">
				<g:message code="contact.email.label" default="Email"/>
			</label>
			<div class="col-md-9">
				<g:textField name="contextClientContact.email" id="newContactRole" class="form-control" value="${contextClientContact?.email}" />
				<g:eachError var="err" bean="${contextClientContact}" field="email">
					<g:if test="${err.code == 'email.invalid'}">
						<span class="control-label" >
						<g:message code="custom.invalid.email.message"/>
						<span>
					</g:if>
				</g:eachError>
			</div>
		</div>
		<div class="form-group ">
			<label for="contextClientContact.role" class="col-md-3 control-label">
				<g:message code="contact.role.label" default="Role"/>
			</label>
			<div class="col-md-9">
				<g:textField name="contextClientContact.role" id="newContactRole" class="form-control" value="${contextClientContact?.role}" />
			</div>
		</div>
	</div>
</div>
