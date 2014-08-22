<%@ page import="skillo.Qualification" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="entityName" value="${message(code: 'qualification.label', default: 'Qualification')}"/>
    <g:set var="entityNaturalName" value="${qualificationInstance.name}"/>
    <g:set var="pageTitle" value="${entityNaturalName}" scope="request"/>
    <title><g:message code="default.edit.label" args="[entityNaturalName]"/></title>
</head>

<body>
<div class="col-md-12">
    <div class="box box-solid">
        <g:form action="save" role="form" class="form-horizontal">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-4">
                        <g:render template="template/form"/>
                        <g:submitButton name="create" class="btn btn-success" value="${message(code: 'default.button.save.label', default: 'Save')}"/>
                        <g:link controller="qualification" action="list" class="btn" name="Cancel">Cancel</g:link>
                    </div>
                </div>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>