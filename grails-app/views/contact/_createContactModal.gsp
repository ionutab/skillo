<div class="modal fade" id="createClientContactDetailsModal" role="dialog" aria-hidden="true" tabindex="-1">
	<div class="modal-dialog">
		<g:form
				method="post"
				class="form-horizontal"
				name="createClientContactForm">
			<div class="modal-content">
				<div class="modal-body">
					<div id="createClientContactFormContainer">
                        <legend>
                            <g:message code="client.form.contact.newContact" args="[clientInstance?.name]" />
                        </legend>
						<g:render template="../contact/contactForm" model="['clientInstance':clientInstance]" />
					</div>
				</div>
				<div class="modal-footer">
					<div class="text-left">
						<g:submitToRemote class="btn btn-primary btn-sm" url="[controller: 'client', action: 'addClientContact']" update="createClientContactFormContainer" onComplete="assertSaveSuccessAndClose()" value="Save" />
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</g:form>
	</div>
</div>