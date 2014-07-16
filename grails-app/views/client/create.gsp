<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="admin_lte_layout" />
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <r:require modules="forms"/>
</head>
<body>
<div class="row">
    <div class="col-md-5">
        <div class="box box-solid">
            <div class="box-body">
                <g:form controller="client" action="save" autocomplete="off" role="form" class="form-horizontal" method="POST" id="clientCreateForm" >
                    <div class="row">
                        <div class="col-md-12 col-sm-12" >
                            <g:render template="form" />
                            <div class="col-md-offset-3">
                                <g:submitButton name="create" class="btn btn-success" value="${message(code: 'default.button.save.label', default: 'Save')}" />
                            </div>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>