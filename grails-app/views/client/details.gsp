<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="admin_lte_layout" />
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
    <g:set var="entityNaturalName" value="${clientInstance.name}" />
    <g:set var="pageTitle" value="${entityNaturalName}" scope="request"/>
    <title>
        <g:message code="default.show.label" args="[entityNaturalName]" />
    </title>
    <r:require modules="forms"/>
</head>
<body>

<div class="row">
    <div class="col-md-6">
        <div class="box box-solid">
            <div class="box-body">
                <div class="row">
                    <g:render template="/client/basicInformation" model="[clientInstance: clientInstance]" />
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="box box-solid">
            <div class="box-body">
                <div class="row">
                    <g:render template="/client/chargeRate/chargeRates" model="[clientInstance: clientInstance]" />
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>