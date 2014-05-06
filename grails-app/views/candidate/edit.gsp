<%@ page import="skillo.Candidate" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="admin_light" />
	<g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
	<g:set var="entityNaturalName" value="${candidateInstance.firstName + ' ' + candidateInstance.lastName}" />
    <g:set var="page_title" value="${entityNaturalName}" scope="request"/>
	<title><g:message code="default.edit.label" args="[entityNaturalName]" /></title>
    <r:require modules="forms"/>
    <r:require modules="candidates"/>
</head>

<body>
<g:form method="post" class="form-horizontal" >
    <div class="row">
        <div class="content-container col-lg-4">
            <g:hiddenField name="id" value="${candidateInstance?.id}" />
            <g:hiddenField name="version" value="${candidateInstance?.version}" />
            <g:render template="form"/>
        </div>
        <div class="content-container col-lg-4">
            <legend><g:message code="candidate.form.competences" /> - <g:message code="candidate.info.mainTradeFirst" /></legend>
            <g:if test="${candidateInstance.candidateQualifications != null && candidateInstance.candidateQualifications.size() > 0}" >
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th><g:message code="candidateQualification.name.label" /></th>
                        <th><g:message code="candidateQualification.number.label" /></th>
                        <th><g:message code="candidateQualification.expiryDate.label" /></th>
                        <th><g:message code="default.actions.label" default="Actions" /></th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${candidateInstance.candidateQualifications}" var="cq">
                        <g:if test="${cq.isMainTrade == true}">
                            <tr class="success">
                                <td>
                                    <g:if test="${cq.qualification} != null">
                                        ${cq.qualification.name}&nbsp;
                                    </g:if>
                                </td>
                                <td>
                                    <g:if test="${cq.number} != null">
                                        ${cq.number}
                                    </g:if>
                                </td>
                                <td>
                                    <g:if test="${cq.expiryDate} != null">
                                        <g:formatDate format="yyyy-MM-dd" date="${cq.expiryDate}"/>
                                    </g:if>
                                </td>
                                <td>
                                    <g:link controller="candidateQualification" action="edit" id="${cq.id}" class="btn btn-link"><g:message code="default.edit.label" args=" " /></g:link>
                                </td>
                            </tr>
                        </g:if>
                    </g:each>
                    <g:each in="${candidateInstance.candidateQualifications}" var="cq">
                        <g:if test="${cq.isMainTrade == false}">
                            <tr class="">
                                <td>
                                    <g:if test="${cq.qualification} != null">
                                        ${cq.qualification.name}
                                    </g:if>
                                </td>
                                <td>
                                    <g:if test="${cq.number} != null">
                                        ${cq.number}
                                    </g:if>
                                </td>
                                <td>
                                    <g:if test="${cq.expiryDate} != null">
                                        <g:formatDate format="yyyy-MM-dd" date="${cq.expiryDate}"/>
                                    </g:if>
                                </td>
                                <td>
                                    <g:link controller="candidateQualification" action="edit" id="${cq.id}" class="btn btn-link"><g:message code="default.edit.label" args=" " /></g:link>
                                </td>
                            </tr>
                        </g:if>
                    </g:each>
                    </tbody>
                </table>
            </g:if>

            <button class="btn btn-info" data-toggle="modal" data-target="#newCandidateQualificationModal"><span class="glyphicon glyphicon-plus"></span></button>
            <legend><g:message code="candidate.form.candidateNotes" /></legend>
            <button class="btn btn-info" data-toggle="modal" data-target="#newCandidateQualificationModal"><span class="glyphicon glyphicon-plus"></span></button>
        </div>
        <div class="content-container col-lg-4">
            <legend><g:message code="candidate.form.payment" /></legend>
            <div class="form-group ${hasErrors(bean: candidateInstance, field: 'payroll.payrollCompany', 'has-error')} ">
                <label for="payrollCompanyId" class="col-sm-4 control-label">
                    <g:message code="payroll.payrollCompany.label" default="Payroll Company" />
                </label>
                <div class="col-sm-8">
                    <g:hiddenField
                            name="payroll.payrollCompany.id"
                            id="payrollCompanyId"
                            class="input-xlarge"
                            value="${candidateInstance?.payroll?.payrollCompany?.id}"
                    />

                    <g:javascript>
                        function formatPayrollCompanies(item) { return item.name; };
                        $("#payrollCompanyId").select2({
                                data: {results:${AvailablePayrollCompanies}, text:'name'},
                                formatSelection: formatPayrollCompanies,
                                formatResult: formatPayrollCompanies,
                                placeholder: "Select a Payroll Company",
                                allowClear:true
                            }
                        );
                    </g:javascript>
                </div>
            </div>

            <div class="form-group ${hasErrors(bean: candidateInstance, field: 'payroll.referenceNumber', 'has-error')} ">
                <label for="payroll.referenceNumber" class="col-sm-4 control-label">
                    <g:message code="payroll.referenceNumber.label" default="Reference Nr." />
                </label>
                <div class="col-sm-8">
                    <g:textField id="payrollReferenceNumber" name="payroll.referenceNumber" class="form-control" value="${candidateInstance?.payroll?.referenceNumber}" />
                </div>
            </div>
            <div class="form-group ${hasErrors(bean: candidateInstance, field: 'payroll.registrationNumber', 'has-error')} ">
                <label for="payroll.registrationNumber" class="col-sm-4 control-label">
                    <g:message code="payroll.registrationNumber.label" default="Registration Nr." />
                </label>
                <div class="col-sm-8">
                    <g:textField id="payrollRegistrationNumber" name="payroll.registrationNumber" class="form-control" value="${candidateInstance?.payroll?.registrationNumber}" />
                </div>
            </div>
            <div class="form-group ${hasErrors(bean: candidateInstance, field: 'payroll.unqiueTaxReferenceNumber', 'has-error')} ">
                <label for="payroll.unqiueTaxReferenceNumber" class="col-sm-4 control-label">
                    <g:message code="payroll.unqiueTaxReferenceNumber.label" default="Unique Tax Reference Nr." />
                </label>
                <div class="col-sm-8">
                    <g:textField id="payrollUnqiueTaxReferenceNumber" name="payroll.unqiueTaxReferenceNumber" class="form-control" value="${candidateInstance?.payroll?.unqiueTaxReferenceNumber}" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance.payroll, field: 'unqiueTaxReferenceNumber', 'error')}
                    </span>
                </div>
            </div>
            <div class="form-group ${hasErrors(bean: candidateInstance, field: 'payroll.nationalInsuranceNumber', 'has-error')} ">
                <label for="payroll.nationalInsuranceNumber" class="col-sm-4 control-label">
                    <g:message code="payroll.nationalInsuranceNumber.label" default="National Insurance Nr." />
                </label>
                <div class="col-sm-8">
                    <g:textField id="payrollNationalInsuranceNumber" name="payroll.nationalInsuranceNumber" class="form-control" value="${candidateInstance?.payroll?.nationalInsuranceNumber}" />
                </div>
            </div>
            <div class="form-group ">
                <label for="payroll.registered" class="col-sm-4 control-label">
                    <g:message code="payroll.registered.label" default="Registered" />
                </label>
                <div class="col-sm-8">
                    <g:checkBox class="checkbox" name="payroll.registered" id="candidatePayrollRegistered" value="${candidateInstance?.payroll?.registered}" data-on-label="Yes" data-off-label="No" />
                </div>
            </div>
            <div class="form-group ">
                <label for="payroll.inducted" class="col-sm-4 control-label">
                    <g:message code="payroll.inducted.label" default="Inducted" />
                </label>
                <div class="col-sm-8">
                    <g:checkBox class="checkbox" name="payroll.inducted" id="candidatePayrollInducted" value="${candidateInstance?.payroll?.inducted}"  data-on-label="Yes" data-off-label="No" />
                </div>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="content-container col-lg-4">
            <div class="form-group">
                <div class="col-sm-offset-4 col-lg-8">

                    <g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    <g:actionSubmit class="btn btn-danger"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>

                </div>
            </div>
        </div>
    </div>
</g:form>

<div class="modal fade" id="newCandidateQualificationModal" role="dialog" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog" >
        %{--<g:form method="post" class="form-horizontal" id="newCandidateQualificationForm" controller="candidateQualification">--}%
        <g:formRemote
                method="post"
                class="form-horizontal"
                id="newCandidateQualificationForm"
                name="newCandidateQualificationForm"
                url="[controller: 'candidateQualification',action: 'addCandidateQualification']"
                after="">
            <div class="modal-content">
                <div class="modal-body">
                    <g:render template="candidateQualificationsForm" bean="${newCandidateQualification}"/>
                </div>
                <div class="modal-footer">
                    <g:submitButton class="btn btn-primary" name="${message(code: 'default.button.save.label', default: 'Save')}" update="newCandidateQualificationForm" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </g:formRemote>
    %{--</g:form>--}%
    </div>
</div>



%{--

<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
        </div>
        <div class="modal-body">
            ...
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
        </div>
    </div>
</div>
--}%


</body>

</html>
