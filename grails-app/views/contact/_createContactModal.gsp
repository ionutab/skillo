<div class="modal fade" id="createClientContactModal" role="dialog" aria-hidden="true" tabindex="-1">
	<div class="modal-dialog">
		<g:form
				method="post"
				class="form-horizontal"
				id="createClientContactForm"
				name="createClientContactForm">
			<div class="modal-content">
				<div class="modal-body">
					<div id="createClientContactFormContainer">
						<g:render template="../contact/contactForm" model="['clientInstance':clientInstance]" />
					</div>
				</div>
				<div class="modal-footer">
					<div class="text-left">
						<g:submitToRemote class="btn btn-primary btn-sm" url="[controller: 'client', action: 'addClientContact']" update="createClientContactFormContainer" onComplete="assertSuccessAndClose()" value="Save" />
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</g:form>
		<g:javascript>
			function assertSuccessAndClose(){
				if($('#newClientContactId').val()){
					$('#createClientContactModal').modal('hide');
					window.location.href = "${createLink(controller: 'client', action: 'list', id: clientInstance?.id)}";
				}
			}
		</g:javascript>
	</div>
</div>