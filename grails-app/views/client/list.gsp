<%@ page import="skillo.client.Client" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}"/>
    <title><g:message code="client.list.label"/></title>
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
                                 value="${clientListFilter?.name}"/>
                </div>

                <div class="col-xs-2">
                    <g:textField class="form-control" name="search.registrationNumber"
                                 placeholder="${message(code: 'client.search.registrationNumber.label', default: 'Registration Number')}"
                                 value="${clientListFilter?.registrationNumber}"/>
                </div>
%{--

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
--}%

                <div class="col-xs-2">
                    <g:submitButton name="list" class="btn btn-primary"
                                    value="${message(code: 'default.button.search.label')}"/>
                    <button type="submit" id="resetClientSearchForm" class="btn btn-info" name="reset" value="true">
                        <span class="glyphicon glyphicon-refresh"></span>
                    </button>
                    </button>
                </div>
            </div>

        </g:form>
    </div>
</div>

<div class="row top10">
    <div class="col-md-12">
        <g:if test="${clientList.size() == 0}">
            <div class="page-background-info">
                <h2><g:message code="candidate.search.notFound.label"/></h2>
            </div>
        </g:if>

        <g:if test="${clientList.size() > 0}">
            <div class="box box-solid">
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <g:sortableColumn property="name"
                                                          title="${message(code: 'client.name.label', default: 'Name')}"/>
                                        <g:sortableColumn property="registrationNumber"
                                                          title="${message(code: 'client.registrationNumber.label', default: 'Registration Number')}"/>
                                        <g:sortableColumn property="address.postCode.code"
                                                          title="${message(code: 'client.telephoneNumber.label', default: 'Telephone Number')}"/>
                                        <g:sortableColumn property="address.details"
                                                          title="${message(code: 'address.details.label', default: 'Address')}"/>
                                        <g:sortableColumn property="address.postCode.code"
                                                          title="${message(code: 'postCode.label', default: 'Post Code')}"/>
                                        <th><g:message code="default.actions.label" default="Actions"/></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${clientList}" status="i" var="clientInstance">
                                        <tr>
                                            <td>
                                                <g:link controller="client" action="details" id="${clientInstance.id}">${clientInstance?.name}</g:link>
                                            </td>
                                            <td>
                                                ${clientInstance?.registrationNumber}
                                            </td>
                                            <td>
                                                ${clientInstance?.telephoneNumber}
                                            </td>
                                            <td>
                                                ${clientInstance?.address?.details}
                                            </td>
                                            <td>
                                                ${clientInstance?.address?.postCode?.code}
                                            </td>
                                            <td>
                                                <g:link controller="client" action="edit" id="${clientInstance?.id}"><g:message
                                                        code="default.edit.label"
                                                        args=" "/></g:link>
                                            </td>
                                        </tr>
                                    </g:each>
                                    </tbody>
                                </table>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="dataTables_paginate paging_bootstrap">
                                        <div class="pagination">
                                            <g:paginate total="${clientTotal}"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div><!-- /row -->
                </div><!-- /box body -->
            </div><!-- /box -->

        </g:if>

    </div>
</div>

</body>
</html>