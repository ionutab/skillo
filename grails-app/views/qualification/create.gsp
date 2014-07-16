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
<g:form action="save" role="form" class="form-horizontal">
    <div class="row">
        <div class="content-container col-lg-4">
            <g:render template="template/form"/>
        </div>
    </div>
    <div class="row">
        <div class="content-container col-lg-4">
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-3">
                    <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.save.label', default: 'Save')}" />
                </div>
            </div>
        </div>
    </div>
</g:form>
</body>
</html>