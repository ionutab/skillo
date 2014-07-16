<%@ page import="skillo.Qualification" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="entityName" value="${message(code: 'qualification.label', default: 'Qualification')}"/>
    <title><g:message code="qualification.list.label" args=" "/></title>
</head>

<body>
<div class="row">
    <div class="content-container col-lg-12">
        <g:form action="search" method="post">
            <legend><g:message code="candidateQualification.search.label"/></legend>

            <div class="form-group row">
                <div class="col-lg-2">
                    <g:textField class="form-control" name="name"
                                 placeholder="${message(code: 'candidateQualification.search.name.label', default: 'Name')}"
                                 value="${params.name}"/>
                </div>
            </div>

            <div class="form-group">
                <g:submitButton name="searchButton" class="btn btn-primary"
                                value="${message(code: 'default.button.search.label')}"/>
                <g:link action="list">
                    <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-refresh"></span></button>
                </g:link>
            </div>
        </g:form>
    </div>
</div>

<div class="row">
    <div class="content-container col-lg-12">
        <g:if test="${QualificationList}">
            <g:render template="template/list"/>
        </g:if>
        <g:else>
            <g:render template="template/qualificationList"/>
        </g:else>
    </div>
</div>

</body>
</html>