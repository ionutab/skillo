
<div class="modal fade" id="editCandidateQualificationModal" role="dialog" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog">
        <g:form
                method="post"
                class="form-horizontal"
                id="newCandidateQualificationForm"
                name="newCandidateQualificationForm"
                url="[controller: 'candidate', action: 'updateCandidateQualification']"
                after="">
            <g:hiddenField name="id" value="${cqe?.id}"/>
            <div class="modal-content">
                <div class="modal-header text-center">
                    <span>Edit <b>${cqe?.qualification?.name}</b> for <b>${cqe?.candidate?.getFullName()}</b></span>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  ${hasErrors(bean: cqe, field: 'expiryDate', 'has-error')} ">
                            <label for="editCandidateQualification.expiryDate" class="col-sm-4 control-label">
                                <g:message code="candidateQualification.expiryDate.label" default="Expiry Date" />
                            </label>
                            <div class="col-sm-6">
                                <g:field type="expiryDate" name="editCandidateQualification.expiryDate" id="editCandidateQualificationExpiryDate" class="datepicker form-control" value="${formatDate(date: cqe?.expiryDate)}" default="none" precision="day" />
                            </div>
                        </div>
                        <div class="form-group  ${hasErrors(bean: cqe, field: 'number', 'has-error')} ">
                            <label for="editCandidateQualification.number" class="col-sm-4 control-label">
                                <g:message code="candidateQualification.number.label" default="Qualification Number" />
                            </label>
                            <div class="col-sm-6">
                                <g:textField name="editCandidateQualification.number" id="editCandidateQualificationNumber" class="form-control" value="${cqe?.number}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="editCandidateQualification.isMainTrade" class="col-sm-4 control-label">
                                <g:message code="candidateQualification.isMainTrade.label" default="Is Main Trade" />
                            </label>
                            <div class="col-sm-6">
                                <g:radioGroup name="editCandidateQualification.isMainTrade"
                                              values="[true, false]" labels="['yes','no']"
                                              value="${cqe?.isMainTrade}" id="editCandidateQualificationIsMainTrade">
                                    <label class="control-label">
                                        ${it.radio}&nbsp;${it.label}
                                    </label>
                                    &nbsp;
                                </g:radioGroup>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <div class="text-left">
                        <g:submitButton class="btn btn-primary btn-sm" name="${message(code: 'default.button.save.label', default: 'Save')}" />
                        <g:actionSubmit class="btn btn-danger btn-sm" action="deleteCandidateQualification" id="${cqe?.id}" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" formmethod="post" />
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </g:form>
    </div>
</div>