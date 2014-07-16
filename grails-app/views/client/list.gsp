<%@ page import="skillo.Client" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="admin_lte_layout" />
    <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
    <title><g:message code="client.list.label" /></title>
    <g:set var="page_title" value="${message(code: 'client.list.label')}" scope="request"/>
</head>

<body>

<div class="row">
    <div class="col-md-12">
    <g:form action="list" controller="client" name="searchForm" role="form" method="GET">
        <div class="row">
            <div class="col-xs-2">
                <g:textField class="form-control" name="search.name"
                            placeholder="${message(code: 'client.search.name.label', default: 'Name')}"
                            value="${params.search?.name}" />
            </div>

            <div class="col-xs-2">
                <g:textField class="form-control" name="search.registrationNumber"
                             placeholder="${message(code: 'client.search.registrationNumber.label', default: 'Registration Number')}"
                             value="${params.search?.registrationNumber}"/>
            </div>

            <div class="col-xs-2">
                <g:textField class="form-control" name="search.address.details"
                             placeholder="${message(code: 'client.search.address.details.label', default: 'Address Details')}"
                             value="${params.search?.postCode}"/>
            </div>

            <div class="col-xs-2">
                <g:textField class="form-control" name="search.address.postCode"
                             placeholder="${message(code: 'client.search.address.postCode.label', default: 'Post Code')}"
                             value="${params.search?.postCode}"/>
            </div>
            <div class="col-xs-2">
                <g:submitButton name="list" class="btn btn-primary" value="${message(code: 'default.button.search.label')}"/>
                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-refresh"></span></button>
            </div>
        </div>


    </g:form>
    </div>
</div>
<div class="row">
    <g:if test="${ClientList.size() == 0}">

        <div class="col-lg-6 col-lg-offset-3 page-background-info" >
            <h2><g:message code="candidate.search.notFound.label" /></h2>
        </div>

    </g:if>

    <g:if test="${ClientList.size() > 0}">
        <div class="content-container col-lg-12">

            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <g:sortableColumn property="name" title="${message(code: 'client.name.label', default: 'Name')}" />
                            <g:sortableColumn property="registrationNumber" title="${message(code: 'client.registrationNumber.label', default: 'Registration Number')}" />
                            <g:sortableColumn property="address.details" title="${message(code: 'address.details.label', default: 'Address')}" />
                            <g:sortableColumn property="address.postCode.code" title="${message(code: 'postCode.label', default: 'Post Code')}" />
                            <th><g:message code="default.actions.label" default="Actions" /></th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${ClientList}" status="i" var="Client">
                            <tr>
                                <td>
                                    ${Client?.name}
                                </td>
                                <td>
                                    ${Client?.registrationNumber}
                                </td>
                                <td>
                                    ${Client?.address?.details}
                                </td>
                                <td>
                                    ${Client?.address?.postCode?.code}
                                </td>
                                <td>
                                    <g:link controller="client" action="edit" id="${Client?.id}" class="btn btn-small"><g:message code="default.edit.label" args=" " /></g:link>
                                </td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            <div class="container">
                <div class="center-block text-center">
                    <div class="pagination">
                        <g:paginate total="${ClientTotal}"/>
                    </div>
                </div>
            </div>
        </div>
    </g:if>
</div>

</body>
</html>