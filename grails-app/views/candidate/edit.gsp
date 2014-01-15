<%@ page import="skillo.Candidate" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="admin_light" />
	<g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
    <r:require modules="forms"/>
    <r:require modules="candidates"/>
</head>

<body>

<section id="edit-candidate" class="first">

    %{--
	<g:hasErrors bean="${candidateInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${candidateInstance}" as="list" />
	</div>
	</g:hasErrors>
    --}%

    <g:form method="post" class="form-horizontal" >
        <div class="row-fluid">
                <div class="span6">
                <g:hiddenField name="id" value="${candidateInstance?.id}" />
                <g:hiddenField name="version" value="${candidateInstance?.version}" />
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
            </div>
            <div class="span6">
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
                                    <g:link controller="candidateQualification" action="edit" id="${cq.id}" class="btn btn-small"><g:message code="default.edit.label" args=" " /></g:link>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </g:if>

                <a href="#newCandidateQualification" role="button" class="btn btn-info" data-toggle="modal"><i class="icon-plus"></i></a>

            </div>
        </div>
        <div class="row-fluid">
            <div class="span6">
                <div class="control-group fieldcontain  ${hasErrors(bean: candidateInstance, field: 'payroll.payrollCompany', 'error')} ">
                    <label for="payrollCompanyId" class="control-label">
                        <g:message code="payroll.payrollCompany.label" default="Payroll Company" />
                    </label>
                    <div class="controls">

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
                        <span class="help-inline">
                            ${hasErrors(bean: candidateInstance, field: 'payroll.payrollCompany', 'error')}
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="row-fluid">
            <div class="span3">
                <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'payroll.referenceNumber', 'error')} ">
                    <label for="payroll.referenceNumber" class="control-label">
                        <g:message code="payroll.referenceNumber.label" default="Reference Nr." />
                    </label>
                    <div class="controls">
                        <g:textField id="payrollReferenceNumber" name="candidate.payroll.referenceNumber" class="input-medium" value="${candidateInstance?.payroll?.referenceNumber}" />
                        <span class="help-inline">
                            ${hasErrors(bean: candidateInstance.payroll, field: 'referenceNumber', 'error')}
                        </span>
                    </div>
                </div>
            </div>
            <div class="span3">
                <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'payroll.registrationNumber', 'error')} ">
                    <label for="payroll.registrationNumber" class="control-label">
                        <g:message code="payroll.registrationNumber.label" default="Registration Nr." />
                    </label>
                    <div class="controls">
                        <g:textField id="payrollRegistrationNumber" name="candidate.payroll.registrationNumber" class="input-medium" value="${candidateInstance?.payroll?.registrationNumber}" />
                        <span class="help-inline">
                            ${hasErrors(bean: candidateInstance.payroll, field: 'registrationNumber', 'error')}
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-fluid">

            <div class="span3">
                <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'payroll.unqiueTaxReferenceNumber', 'error')} ">
                    <label for="payroll.unqiueTaxReferenceNumber" class="control-label">
                        <g:message code="payroll.unqiueTaxReferenceNumber.label" default="Unique Tax Reference Nr." />
                    </label>
                    <div class="controls">
                        <g:textField id="payrollUnqiueTaxReferenceNumber" name="candidate.payroll.unqiueTaxReferenceNumber" class="input-medium" value="${candidateInstance?.payroll?.unqiueTaxReferenceNumber}" />
                        <span class="help-inline">
                            ${hasErrors(bean: candidateInstance.payroll, field: 'unqiueTaxReferenceNumber', 'error')}
                        </span>
                    </div>
                </div>
            </div>
            <div class="span3">
                <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'payroll.nationalInsuranceNumber', 'error')} ">
                    <label for="payroll.nationalInsuranceNumber" class="control-label">
                        <g:message code="payroll.nationalInsuranceNumber.label" default="National Insurance Nr." />
                    </label>
                    <div class="controls">
                        <g:textField id="payrollNationalInsuranceNumber" name="candidate.payroll.nationalInsuranceNumber" class="input-medium" value="${candidateInstance?.payroll?.nationalInsuranceNumber}" />
                        <span class="help-inline">
                            ${hasErrors(bean: candidateInstance.payroll, field: 'nationalInsuranceNumber', 'error')}
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3">
                <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'payroll.registered', 'error')} ">
                    <label for="payroll.registered" class="control-label">
                        <g:message code="payroll.registered.label" default="Registered" />
                    </label>
                    <div class="controls">
                        <g:checkBox name="payroll.registered" value="${candidateInstance?.payroll?.registered}" />
                        <span class="help-inline">
                            ${hasErrors(bean: candidateInstance.payroll, field: 'registered', 'error')}
                        </span>
                    </div>
                </div>
            </div>
            <div class="span3">
                <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'payroll.inducted', 'error')} ">
                    <label for="payroll.inducted" class="control-label">
                        <g:message code="payroll.inducted.label" default="Inducted" />
                    </label>
                    <div class="controls">
                        <g:checkBox name="payroll.inducted" value="${candidateInstance?.payroll?.inducted}" />
                        <span class="help-inline">
                            ${hasErrors(bean: candidateInstance.payroll, field: 'inducted', 'error')}
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
        <g:actionSubmit class="btn btn-danger"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
    </g:form>

    <div id="newCandidateQualification" class="modal hide fade" role="dialog">
        <div class="modal-body">
%{--

            <g:form method="post" class="form-horizontal" id="candidateQualificationsForm" >

                <g:hiddenField name="candidateId" value="${newCandidateQualification?.candidate?.id}" />
                <fieldset class="form">
                    <g:render template="candidateQualificationsForm"/>
                </fieldset>
                <g:actionSubmit class="btn btn-primary" action="addCandidateQualification"  value="${message(code: 'default.button.save.label', default: 'Save')}" />
            </g:form>
--}%

        </div>
    </div>

</section>
			
</body>

</html>
