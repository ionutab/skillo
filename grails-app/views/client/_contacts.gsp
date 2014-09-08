<div id="displayContacts">
    <g:each in="${clientInstance?.contacts}" var="contact">
        <div class="box box-solid">
            <div class="box-header">
                <g:form method="post" url="[controller: 'client']" >
                    <g:hiddenField name="clientContact.id" value="${contact.id}" />
                    <h3 class="box-title">
                        ${contact.getFullName()}
                    </h3>
                </g:form>
	            <div class="box-tools pull-right">
                                <g:remoteLink
                                    class="btn btn-sm"
									controller="client"
									action="displayContactComments"
									id="${contact.id}"
									elementId="${contact.id}"
									update="contactCommentsContainer"
									onLoaded="slimClientList()">
									&nbsp;${contact?.contactComments?.size()}&nbsp;comments&nbsp;
								</g:remoteLink>
								&nbsp;
								<g:remoteLink class="btn btn-sm"
								              controller="client"
								              action="getClientContactModal"
                                              id="${contact.id}"
								              elementId="${contact.id}"
								              update="clientContactDetailsContainer"
                                              onComplete="assertModalAndOpen()">
									<i class="fa fa-pencil"></i>
								</g:remoteLink>
								%{--<button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>--}%
	            </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-sm-6">
                        <g:if test="${contact.telephoneNumber != null}">
                            <span><g:message code="contact.telephoneNumber.short.label" default="Telephone nr"/>:&nbsp;</span>
                            <span>${contact.telephoneNumber}</span>
                            <br/>
                        </g:if>
                        <g:if test="${contact.email != null}">
                            <span><g:message code="contact.email.label" default="Email"/>:&nbsp;</span>
                            <span>${contact.email}</span>
                            <br/>
                        </g:if>
                    </div>
                    <div class="col-sm-6">
                        <g:if test="${contact.landlineNumber != null}">
                            <span><g:message code="contact.landlineNumber.short.label" default="Landline nr"/>:&nbsp;</span>
                            <span>${contact.landlineNumber}</span>
                            <br/>
                        </g:if>
                        <g:if test="${contact.role != null}">
                            <span><g:message code="contact.role.label" default="Role"/>:&nbsp;</span>
                            <span>${contact.role}</span>
                            <br/>
                        </g:if>
                    </div>
                </div>
            </div>
        </div>
    </g:each>
</div>

<div id="newClientContactDetailsContainer">
	<g:render template="../contact/createContactModal" model="['clientInstance':clientInstance]"/>
</div>
<div id="clientContactDetailsContainer">

</div>
<g:javascript>
			function assertSaveSuccessAndClose(){
			var createClientContactForm = $('form[name="createClientContactForm"]');
			var createSuccess = createClientContactForm.find('input[name="contactModalSuccess"]').val();
				if(createSuccess == 'true'){
					$('#createClientContactDetailsModal').modal('hide');
					window.location.href = "${createLink(controller: 'client', action: 'list', id: clientInstance?.id)}";
				} else {
				    Skillo.applyTelephoneInputStates()
				}
			};

            function assertUpdateSuccessAndClose(){
                var updateClientContactForm = $('form[name="updateClientContactForm"]');
                var updateSuccess = updateClientContactForm.find('input[name="contactModalSuccess"]').val();
				if(updateSuccess === 'true' ){
					$('#editClientContactDetailsModal').modal('hide');
					window.location.href = "${createLink(controller: 'client', action: 'list', id: clientInstance?.id)}";
				} else {
				    Skillo.applyTelephoneInputStates()
				}
			};

			function assertModalAndOpen(){
			    $('#editClientContactDetailsModal').modal('show');
			    Skillo.applyTelephoneInputStates('${message(code: 'default.telephoneNumber.inputmask')}','${message(code: 'default.telephoneNumber.placeholder')}')
			};

</g:javascript>