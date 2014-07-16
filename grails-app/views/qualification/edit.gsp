<%@ page import="skillo.Qualification" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="entityName" value="${message(code: 'qualification.label', default: 'Qualification')}"/>
    <g:set var="entityNaturalName" value="${qualificationInstance.name}"/>
    <g:set var="page_title" value="${entityNaturalName}" scope="request"/>
    <title><g:message code="default.edit.label" args="[entityNaturalName]"/></title>
</head>

<body>
<g:form method="post" class="form-horizontal">
    <div class="row">
        <div class="content-container col-lg-4">
            <g:hiddenField name="id" value="${qualificationInstance?.id}" />
            <g:hiddenField name="version" value="${qualificationInstance?.version}" />
            <g:render template="template/form"/>
            <g:actionSubmit class="btn btn-primary" action="update"
                            value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            <g:actionSubmit class="btn btn-danger" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset"/></button>
        </div>
    </div>
</g:form>

</body>
</html>