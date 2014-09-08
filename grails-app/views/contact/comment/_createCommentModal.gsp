<div class="modal fade" id="createContactCommentModal" role="dialog" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog">
        <g:form
                method="post"
                class="form-horizontal"
                id="createContactCommentForm"
                name="createContactCommentForm"
                url="[controller: 'client', action: 'addContactComment']"
        >
            <div class="modal-content">
                <div class="modal-body">
                    <legend>
                        <g:message code="clinet.form.contact.newComment" args="[clientContactShow?.getFullName()]" />
                    </legend>
                    <g:hiddenField name="newContactComment.contact.id" value="${clientContactShow?.id}" />
                    <div class="form-group">
                        <div class="col-md-12">
                            <g:textArea name="newContactComment.comment" class="form-control" rows="4" placeholder="Type Comment Here"></g:textArea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="text-left">
                        <g:submitButton class="btn btn-primary btn-sm" name="${message(code: 'default.button.save.label', default: 'Save')}" />
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </g:form>
    </div>

</div>