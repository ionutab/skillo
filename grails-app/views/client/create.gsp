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

    <g:form action="save" role="form" class="form-horizontal" method="POST" >
        <div class="row">
            <div class="content-container col-lg-4" >
                <g:render template="form" />
            </div>
        </div>
        <div class="row">
            <div class="content-container col-lg-4">
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-3">
                        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.save.label', default: 'Save')}" />
                    </div>
                </div>
            </div>
        </div>
    </g:form>

</body>
</html>