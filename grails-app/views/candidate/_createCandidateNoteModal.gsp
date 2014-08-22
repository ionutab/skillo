<div class="modal fade" id="createCandidateNoteModal" role="dialog" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog">
        <g:form
                method="post"
                class="form-horizontal"
                id="createCandidateNoteForm"
                name="createCandidateNoteForm"
                url="[controller: 'candidate', action: 'addCandidateNote']"
                after="">

            <g:hiddenField name="candidate.id" value="${candidateInstance?.id}"/>
            <g:hiddenField name="redirect" value="${redirect}" />

            <div class="modal-content">
                <div class="modal-body">
                    <div id="createCandidateNoteFormContainer">
                        <g:render template="createCandidateNoteForm" model="['newCandidateNote':newCandidateNote]"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="text-left">
                        <g:submitButton class="btn btn-primary btn-sm"
                                        name="${message(code: 'default.button.save.label', default: 'Save')}"
                                        update="newCandidateQualificationForm" />
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </g:form>
    </div>
</div>
