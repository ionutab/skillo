<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="admin_light" />
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <r:require modules="forms"/>
</head>

<body>
<g:form method="post" class="form-horizontal">

    <div class="row">
        <div class="content-container col-lg-4">
            <g:hiddenField name="id" value="${clientInstance?.id}" />
            <g:hiddenField name="version" value="${clientInstance?.version}" />
            <g:render template="form" />
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

</body>
</html>