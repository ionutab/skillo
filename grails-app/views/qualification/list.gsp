<%--
  Created by IntelliJ IDEA.
  User: Andrei-Home
  Date: 4/27/2014
  Time: 11:57 PM
--%>
<%@ page import="skillo.Qualification" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="admin_light"/>
    <g:set var="entityName" value="${message(code: 'qualification.label', default: 'Qualification')}"/>
    <title><g:message code="qualification.list.label" args=" "/></title>
</head>

<body>
<div class="row">
    <div class="content-container col-lg-12">
        <g:form action="list" controller="candidateQualification" name="searchForm" role="form">
            <legend><g:message code="candidateQualification.search.label"/></legend>

            <div class="form-group row">
                <div class="col-lg-2">
                    <g:textField class="form-control" name="name"
                                 placeholder="${message(code: 'candidateQualification.search.name.label', default: 'Name')}"
                                 value="${params.name}"/>
                </div>

                <div class="col-lg-2">
                    <g:textField class="form-control" name="canBeMainTrade"
                                 placeholder="${message(code: 'candidateQualification.search.Qualification.label', default: 'Trade')}"
                                 value="${params.canBeMainTrade}"/>
                </div>
            </div>

            <div class="form-group">
                <g:submitButton name="list" class="btn btn-primary"
                                value="${message(code: 'default.button.search.label')}"/>
                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-refresh"></span></button>
                <button type="button" class="btn btn-info pull-right" data-toggle="button"><span
                        class="glyphicon glyphicon-arrow-down"></span></button>
            </div>
        </g:form>
    </div>
</div>

<div class="content-container col-lg-12">

    <g:if test="${Qualification.count() > 0}">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>

                    <g:sortableColumn property="code"
                                      title="${message(code: 'qualification.code.label', default: 'Code ')}"/>
                    <g:sortableColumn property="name"
                                      title="${message(code: 'qualification.name.label', default: 'Name')}"/>
                    <th><g:message code="qualification.description.label" default="Description"/></th>
                    <th><g:message code="qualification.mainTrade.label" default="Main Trade"/></th>
                    <th><g:message code="default.actions.label" default="Actions"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${QualificationList}" status="i" var="Qualification">
                    <tr>
                        <td>
                            ${Qualification.code}
                        </td>
                        <td>
                            <!-- If the user click the qualification name, the will be redirected to the show view of that qualification -->
                            <g:link action="show" data-placement="right" data-trigger="click" id="${Qualification.id}"
                                    elementId="${Qualification.id}">${Qualification.name}</g:link>
                        </td>
                        <td>
                            ${Qualification.description}
                        </td>
                        <td>
                            ${Qualification.canBeMainTrade}
                        </td>
                        <td>
                            <g:link action="edit" id="${Qualification.id}" class="btn btn-small"><g:message
                                    code="default.edit.label" args=" "/></g:link>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

    </g:if>
    <div class="pagination">
        <g:paginate total="${QualificationTotal}"/>
    </div>
</div>

</body>
</html>