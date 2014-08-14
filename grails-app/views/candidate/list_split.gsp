<%@ page import="skillo.Qualification; skillo.candidate.Candidate" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}"/>
    <title><g:message code="candidate.list.label" args=" "/></title>
    <g:set var="page_title" value="${message(code: 'candidate.list.label')}" scope="request"/>
    <r:require modules="search" />
</head>

<body>

<div class="col-md-12">
    <div class="col-xs-10">
        <div class="row" id="searchContent">
            <div class="col-md-12">
                <g:form action="list" controller="candidate" name="searchForm" id="candidateSearchForm" role="form">
                    <div class="row">
                        <div class="col-xs-3">
                            <g:textField class="form-control" name="firstName"
                                         placeholder="${message(code: 'candidate.search.firstName.label', default: 'First Name')}"
                                         value="${candidateListFilter?.firstName}"/>
                        </div>

                        <div class="col-xs-3">
                            <g:textField class="form-control" name="lastName"
                                         placeholder="${message(code: 'candidate.search.lastName.label', default: 'Last Name')}"
                                         value="${candidateListFilter?.lastName}"/>
                        </div>

                        <div class="col-xs-2">
                            <g:textField class="form-control" name="telephoneNumber"
                                         placeholder="${message(code: 'candidate.search.telephoneNumber.label', default: 'Telephone Nr')}"
                                         value="${candidateListFilter?.telephoneNumber}"/>
                        </div>

                        <div class="col-xs-2">
                            <g:textField class="form-control" name="qualification"
                                         placeholder="${message(code: 'candidate.search.candidateQualification.label', default: 'Trade')}"
                                         value="${candidateListFilter?.qualification}"/>
                        </div>

                        <div class="col-xs-2">
                            <g:submitButton name="list" class="btn btn-primary"
                                            value="${message(code: 'default.button.search.label')}"/>
                            <button type="submit" id="resetCandidateSearchForm" class="btn btn-info" name="reset"
                                    value="true">
                                <span class="glyphicon glyphicon-refresh"></span>
                            </button>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>

    <div class="col-xs-2">
        <button type="button" id="advancedSearchButton" onclick="showhide()"
                class="btn btn-primary advancedSearchButton"
                data-toggle="button">${message(code: 'default.button.advanced.search.label')}</button>
        <script>
            function showhide() {
                var advancedSearchDiv = document.getElementById("advancedSearchContent");
                var searchDiv = document.getElementById("searchContent");
                if (advancedSearchDiv.style.display !== "none") {
                    advancedSearchDiv.style.display = "none";
                    searchDiv.style.display= "block";
                }
                else {
                    advancedSearchDiv.style.display = "block";
                    searchDiv.style.display= "none";
                }
            }
        </script>
    </div>

</div>

<div class="row" id="advancedSearchContent" style="display: none"  >
    <div class="col-md-12 top10">
        <div class="box-body" >
            <g:form controller="candidate" action="advancedSearch" class="form-horizontal">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="">
                                    <i class="fa fa-filter"></i>&nbsp;Filter
                                </a>
                            </h4>
                        </div>
                        <div class="row">
                            <div id="collapseOne" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="form-group ">
                                                <label for="qualification"
                                                       class="col-sm-2 control-label">Where qualification</label>

                                                <div class="col-md-2">
                                                    <g:render template="../qualification/qualificationSelector"
                                                              model="['attributeName':'qualification1',
                                                                      'attributeId':'qualification1' ,
                                                                      'qualification':null]"/>
                                                </div>

                                                <g:if test="${operators != null && operators.size() > 0}">
                                                    <div class="col-md-1">
                                                        <select class="form-control" name="selectQ1">
                                                            <g:each in="${operators}" status="i" var="op">
                                                                <option value=${op}>${op}</option>
                                                            </g:each>
                                                        </select>
                                                    </div>
                                                </g:if>

                                                <div class="col-md-2">
                                                    <g:render template="../qualification/qualificationSelector"
                                                              model="['attributeName':'qualification2',
                                                                      'attributeId':'qualification2' ,
                                                                      'qualification':null]"/>
                                                </div>

                                                <g:if test="${operators != null && operators.size() > 0}">
                                                    <div class="col-md-1">
                                                        <select class="form-control" name="selectQ2">
                                                            <g:each in="${operators}" status="i" var="op">
                                                                <option value=${op}>${op}</option>
                                                            </g:each>
                                                        </select>
                                                    </div>
                                                </g:if>

                                                <div class="col-md-2">
                                                    <g:render template="../qualification/qualificationSelector"
                                                              model="['attributeName':'qualification3',
                                                                      'attributeId':'qualification3' ,
                                                                      'qualification':null]"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group ">
                                                <label for="postcode"
                                                       class="col-sm-2 control-label">Where postcode</label>

                                                <div class="col-md-2">

                                                    <g:render template="../postCode/postCodeSelector"
                                                              model="['attributeName': 'postcode1',
                                                                      'attributeId'  : 'postcode1',
                                                                      'postCode'     : null]"/>
                                                </div>

                                            </div>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-8">
                                                <input type="submit" name="search" class="btn btn-primary btn" value="Search" id="Update">
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>


<div class="row top10">
    <div class="col-md-12">
        <g:if test="${candidateList.size() == 0}">
            <div class="text-center">
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
    