<%@ page import="skillo.CandidateNote; skillo.Candidate" %>

<g:set var="editable" value="${params.action == 'edit' || params.action == 'updateMainDetails' || params.action == 'updatePaymentDetails'}"/>
<g:set var="cn" value="${candidateInstance.candidateNotes}" />

<div class="col-md-12">
    <div class="box box-solid">
        <div class="box-body">
            <div class="row">
                <div class="col-md-12 col-sm-12">

                    <g:if test="${cn == null || cn.size() <= 0}">

                        <div class="col-md-12 col-lg-offset-2 page-background-info">
                            <h2><g:message code="candidateNotes.display.notFound.label"/></h2>
                        </div>

                    </g:if>
                    <g:else>
                        <g:each in="${candidateInstance.candidateNotes}" var="cnote" status="i">
                            <div class="callout callout-main-details callout-info" >
                                <p><b><g:formatDate date="${cnote.note.date}" />&nbsp;${cnote.consultant.firstName + " " + cnote.consultant.lastName}</b></p>
                                <p>${cnote.note.note}</p>
                            </div>
                        </g:each>
                    </g:else>

                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <g:if test="${editable}">
                        <button class="btn btn-info btn-sm" data-toggle="modal"
                                data-target="#createCandidateNoteModal" id="addCandidateNote"><i
                                class="fa fa-plus "></i>&nbsp;Add Candidate Note</button>
                        <g:javascript>
                            $("#addQualification").click(function (event) {
                                event.preventDefault();
                            });
                        </g:javascript>
                    </g:if>
                </div>
            </div>

        </div>
    </div>
</div>

fa
<div class="modal fade" id="createCandidateNoteModal" role="dialog" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog">
        <g:form
                method="post"
                class="form-horizontal"
                id="createCandidateNoteForm"
                name="createCandidateNoteForm"
                url="[controller: 'candidate', action: 'addCandidateNote']"
                after="">

            <g:hiddenField name="id" value="${candidateInstance?.id}"/>
            <div class="modal-content">
                <div class="modal-body">
                    <div id="createCandidateNoteFormContainer">
                        <g:render template="createCandidateNoteForm" />
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
