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
                <div class="modal-footer text-left">
                    %{--

                    <g:javascript>
                        function renderEditCandidateQualification(){

                            function formatCandidateQualification(item) { return item.name; };
                            $("#newCandidateQualificationId").select2({
                                    data: {results:${availableQualifications}, text:'name'},
                                    formatSelection: formatCandidateQualification,
                                    formatResult: formatCandidateQualification,
                                    placeholder: "Select a Qualification",
                                    allowClear:true
                                }
                            );
                            $("#newCandidateQualificationExpiryDate").inputmask("d/m/y", { "placeholder": "dd/mm/yyyy" });
                            $('#createCandidateQualificationFormContainer').find('input').iCheck({
                                checkboxClass: 'icheckbox_flat-blue',
                                radioClass: 'iradio_flat-blue'
                            });
                        }
                    </g:javascript>

                    <g:submitToRemote
                            url="[controller: 'candidate', action: 'addCandidateQualification']"
                            class="btn btn-primary btn-sm"
                            name="${message(code: 'default.button.save.label', default: 'Save')}"
                            value="${message(code: 'default.button.save.label', default: 'Save')}"
                            update="createCandidateQualificationFormContainer" onComplete="renderEditCandidateQualification()" />
                    --}%
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
