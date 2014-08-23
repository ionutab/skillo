<g:set var="editable" value="${params.action == 'edit' || params.action == 'updateMainDetails' || params.action == 'updatePaymentDetails'}"/>

<div class="col-md-12">
    <div class="box box-solid">
        <div class="box-header">
            <div class="box-header">
                <div class="col-md-12 col-sm-12">
                    <span>Next of kin details</span>
                </div>
            </div>
        </div>
        <div class="box-body">
            <g:form controller="candidate" action="updateMainDetails" class="form-horizontal" autocomplete="off">
                <g:hiddenField name="id" value="${candidateInstance?.id}"/>
                <g:hiddenField name="nok.currentVersion" value="${candidateInstance?.version}"/>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="nok.nokName" class="col-md-3 control-label">
                                <g:message code="candidate.nokName.label" default="Name"/>
                            </label>
                            <div class="col-sm-9">
                                <g:textField name="nok.nokName" class="form-control" value="${candidateInstance?.nokName}" disabled="${!editable}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nok.nokRelationship" class="col-md-3 control-label">
                                <g:message code="candidate.nokRelationship.label" default="Relationship"/>
                            </label>
                            <div class="col-sm-9">
                                <g:textField name="nok.nokRelationship" class="form-control" value="${candidateInstance?.nokRelationship}" disabled="${!editable}"/>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="nok.nokTelephone" class="col-md-3 control-label">
                                <g:message code="candidate.nokTelephone.label" default="Telephone Nr."/>
                            </label>
                            <div class="col-sm-9">
                                <g:textField name="nok.nokTelephone" id="nokTelephone" class="form-control" value="${candidateInstance?.nokTelephone}" disabled="${!editable}"/>
                            </div>
                            <g:javascript>
                                $("#nokTelephone").inputmask("${message(code:'default.telephoneNumber.inputmask')}", {"placeholder": "${message(code:'default.telephoneNumber.placeholder')}"});
                            </g:javascript>
                        </div>
                        <div class="form-group ">
                            <label for="nok.nokAddress" class="col-md-3 control-label">
                                <g:message code="candidate.nokAddress.label" default="Address"/>
                            </label>
                            <div class="col-md-9">
                                <g:textArea rows="2" name="nok.nokAddress" class="form-control" value="${candidateInstance?.nokAddress}" disabled="${!editable}"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <g:if test="${editable}">
                            <g:actionSubmit class="btn btn-primary" action="updateNextOfKinDetails" value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                            <g:link controller="candidate" action="list" class="btn btn-default"
                                    name="Cancel">Cancel</g:link>
                        </g:if>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>