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
                        %{--
                            <div class="col-xs-2">
                                <g:textField class="form-control" name="qualification"
                                             placeholder="${message(code: 'candidate.search.candidateQualification.label', default: 'Trade')}"
                                             value="${candidateListFilter?.qualification}"/>
                            </div>
                        --}%
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
        <g:link controller="candidateSearch" action="index" class="btn btn-primary">${message(code: 'default.button.advanced.search.label')}</g:link>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <g:if test="${candidateList.size() == 0}">
            <div class="page-background-info">
                <h2>There are currently no candidates that match your criteria.</h2>
            </div>
        </g:if>
        <g:if test="${candidateList.size() > 0}">
            <div class="box box-solid">
                <div class="box-body">
                    <div class="row">
                        <div class="col-md-7 col-sm-7">
                            <div class="table-responsive">
                                <!-- THE MESSAGES -->
                                <table class="table">
                                    <thead>
                                    <tr>

                                        <g:sortableColumn property="firstName" title="Firts Name" />
                                        %{--<th>Telephone</th>--}%
                                        <th>Address</th>
                                        <th class="fixed-80">Post Code</th>
                                        <th>Trade</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${candidateList}" status="i" var="Candidate">
                                        <tr>
                                            <td>
                                                <g:remoteLink action="display" id="${Candidate.id}"
                                                              elementId="${Candidate.id}"
                                                              update="infoContainer">${Candidate.firstName} ${Candidate.lastName}</g:remoteLink>
                                            </td>
                                            <td>
                                                ${Candidate?.address?.details}
                                            </td>
                                            <td>
                                                ${Candidate?.address?.postCode?.code}
                                            </td>
                                            <td>
                                                ${Candidate?.getMainTrade()?.qualification?.name}
                                            </td>
                                        </tr>
                                    </g:each>
                                    </tbody>
                                </table>
                            </div><!-- /.table-responsive -->
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="dataTables_paginate paging_bootstrap">
                                        <div class="pagination">
                                            <g:paginate total="${candidateTotal}"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.col (RIGHT) -->
                        <div class="col-md-5 col-sm-5">
                        <div id="infoContainer">
                            <g:render template="info" />
                        </div>
                        </div>
                    </div><!-- /.row -->
                </div><!-- /.box-body -->
            </div><!-- /.box -->



        </g:if>
    </div><!-- /.box -->
</div>

</body>
</html>
    