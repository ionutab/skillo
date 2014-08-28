<div class="modal fade" id="editClientContactDetailsModal" role="dialog" aria-hidden="true" tabindex="-1">
	<div class="modal-dialog">
		<g:form
				method="post"
				class="form-horizontal"
				name="updateClientContactForm">
			<div class="modal-content">
				<div class="modal-body">
                    <legend>
                        <g:message code="client.form.contact.editContact" args="[contextClientContact?.getFullName()]" />
                    </legend>
					<div id="updateClientContactFormContainer">
						<g:render template="../contact/contactForm" model="['contextClientContact':contextClientContact]" />
					</div>
				</div>
				<div class="modal-footer">
					<div class="text-left">
						<g:submitToRemote class="btn btn-primary btn-sm" url="[controller: 'client', action: 'updateClientContact']" update="updateClientContactFormContainer" onComplete="assertUpdateSuccessAndClose()" value="Update" />
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</g:form>
	</div>
</div>