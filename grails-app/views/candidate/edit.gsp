<%@ page import="skilloo.Candidate" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="admin" />
	<g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>
    <r:require modules="candidates"/>
    <r:require modules="select2"/>
</head>

<body>

<section id="edit-candidate" class="first">

	<g:hasErrors bean="${candidateInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${candidateInstance}" as="list" />
	</div>
	</g:hasErrors>

    <div class="row-fluid">
        <div class="span6">
            <g:form method="post" class="form-horizontal" >
                <g:hiddenField name="id" value="${candidateInstance?.id}" />
                <g:hiddenField name="version" value="${candidateInstance?.version}" />
                <fieldset class="form">
                    <g:render template="basicForm"/>
                </fieldset>
                <g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                <g:actionSubmit class="btn btn-danger"  action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
            </g:form>
        </div>
        <div class="span6">

            <g:form method="post" class="form-horizontal" id="candidateQualificationsForm" >
                <legend>
                    <g:message code="candidate.candidateQualification.label" />
                </legend>

                <g:if test="${candidateInstance.candidateQualifications != null && candidateInstance.candidateQualifications.size() > 0}" >
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th><g:message code="qualification.name.label" /></th>
                                <th><g:message code="candidateQualification.number.label" /></th>
                                <th><g:message code="candidateQualification.expiryDate.label" /></th>
                                <th><g:message code="default.actions.label" default="Actions" /></th>
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${candidateInstance.candidateQualifications}" var="cq">
                                <tr class="${(cq.isMainTrade)? 'success' : ''}">
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

                <g:hiddenField name="candidateId" value="${newCandidateQualification?.candidate?.id}" />
                <fieldset class="form">
                    <g:render template="candidateQualificationsForm"/>
                </fieldset>
                <g:actionSubmit class="btn btn-primary" action="addCandidateQualification"  value="${message(code: 'default.button.save.label', default: 'Save')}" />
            </g:form>
        </div>
    </div>

</section>
			
</body>

</html>
