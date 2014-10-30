<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="skillo.Qualification; skillo.candidate.Candidate" %>
<!doctype html>
<html>

<head>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}"/>
    <title><g:message code="candidate.list.label" args=" "/></title>
    <g:set var="pageTitle" value="${message(code: 'candidate.list.label')}" scope="request"/>
    <r:require modules="search" />
</head>

<body>

<div class="row">
    <div class="col-xs-10">
        <div id="searchContent">
                <g:form action="list" controller="candidate" name="searchForm" role="form">
                    <div class="row">
                        <div class="col-xs-4">
                            <g:textField class="form-control" name="firstName"
                                         placeholder="${message(code: 'candidate.search.firstName.label', default: 'First Name')}"
                                         value="${candidateListFilter?.firstName}"/>
                        </div>

                        <div class="col-xs-4">
                            <g:textField class="form-control" name="lastName"
                                         placeholder="${message(code: 'candidate.search.lastName.label', default: 'Last Name')}"
                                         value="${candidateListFilter?.lastName}"/>
                        </div>

                        <div class="col-xs-2">
                            <g:textField class="form-control" name="telephoneNumber" id="searchTelephoneNumber"
                                         placeholder="${message(code: 'candidate.search.telephoneNumber.label', default: 'Telephone Nr')}"
                                         value="${candidateListFilter?.telephoneNumber}"/>
                            <g:javascript>
                                $("#searchTelephoneNumber").inputmask("${message(code: 'default.telephoneNumber.inputmask')}", {"placeholder":"${message(code: 'default.telephoneNumber.placeholder')}"});
                            </g:javascript>

                        </div>
                        <div class="col-xs-2">
                            <g:submitButton name="list" class="btn btn-primary" value="${message(code: 'default.button.search.label')}"/>
                            <button type="submit" id="resetCandidateSearchForm" class="btn btn-info" name="reset" value="true">
                                <i class="fa fa-refresh"></i>
                            </button>
                        </div>
                    </div>
                </g:form>
        </div>
    </div>
    <div class="col-xs-2">
        <g:link mapping="candidateSearch" class="btn btn-primary">${message(code: 'default.button.advanced.search.label')}</g:link>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
		<g:render template="candidateList" model="['candidateList':candidateList]"/>
    </div><!-- /.box -->
</div>

</body>
</html>
    