<%@ page import="skillo.Candidate" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}"/>
    <title><g:message code="candidate.list.label" args=" "/></title>
    <g:set var="page_title" value="${message(code: 'candidate.list.label')}" scope="request"/>
</head>

<body>

<div class="row">
    <div class="col-md-12">
        <g:form action="list" controller="candidate" name="searchForm" id="candidateSearchForm" role="form">
            <div class="row">
                <div class="col-xs-3">
                    <g:textField class="form-control" name="firstName"
                                 placeholder="${message(code: 'candidate.search.firstName.label', default: 'First Name')}"
                                 value="${CandidateListFilter?.firstName}"/>
                </div>

                <div class="col-xs-3">
                    <g:textField class="form-control" name="lastName"
                                 placeholder="${message(code: 'candidate.search.lastName.label', default: 'Last Name')}"
                                 value="${CandidateListFilter?.lastName}"/>
                </div>

                <div class="col-xs-2">
                    <g:textField class="form-control" name="telephoneNumber"
                                 placeholder="${message(code: 'candidate.search.telephoneNumber.label', default: 'Telephone Nr')}"
                                 value="${CandidateListFilter?.telephoneNumber}"/>
                </div>

                <div class="col-xs-2">
                    <g:textField class="form-control" name="qualification"
                                 placeholder="${message(code: 'candidate.search.candidateQualification.label', default: 'Trade')}"
                                 value="${CandidateListFilter?.qualification}"/>
                </div>

                <div class="col-xs-2">
                    <g:submitButton name="list" class="btn btn-primary"
                                    value="${message(code: 'default.button.search.label')}"/>
                    <button onclick="resetForm(this);" type="reset"
                            class="btn btn-info"><span class="glyphicon glyphicon-refresh"></span>
                    </button>
                    %{--<button type="button" class="btn btn-info input-sm" data-toggle="button"><span class="glyphicon glyphicon-arrow-down"></span></button>--}%
                </div>
            </div>
        </g:form>
    </div>
</div>


<div class="row top10">
<div class="col-md-12">
<g:if test="${CandidateList.size() == 0}">
    <div class="text-center">
        <h2>There are currently no candidates that match your criteria.</h2>
    </div>
</g:if>
<g:if test="${CandidateList.size() > 0}">

<div class="box box-solid">
<div class="box-body">
<div class="row">
<div class="col-md-7 col-sm-7">
<div class="table-responsive">
<!-- THE MESSAGES -->
<table class="table">
<thead>
    <tr>

        <th class="sortable"><a
                href="/skillo/candidate/list?sort=firstName&amp;order=asc">Full Name</a>
        </th>
        %{--<th>Telephone</th>--}%
        <th>Address</th>
        <th>Post Code</th>
        <th>Trade</th>

    </tr>
</thead>
<tbody>
<g:each in="${CandidateList}" status="i" var="Candidate">
<tr>
    <td>
        <g:remoteLink action="display" id="${Candidate.id}" elementId="${Candidate.id}" update="displayCandidate">${Candidate.firstName} ${Candidate.lastName}</g:remoteLink>
    </td>
    %{--<td>--}%
    %{--40745763293--}%
    %{--</td>--}%
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
</div><!-- /.col (RIGHT) -->

<div class="col-md-5 col-sm-5" >
    <g:render template="info" />
</div>

</div><!-- /.row -->
</div><!-- /.box-body -->
<div class="box-footer clearfix">
    <div class="pull-right">
        <small>Showing 1-12/1,240</small>
        <button class="btn btn-xs btn-primary"><i class="fa fa-caret-left"></i></button>
        <button class="btn btn-xs btn-primary"><i class="fa fa-caret-right"></i></button>
    </div>
</div><!-- box-footer -->
</div><!-- /.box -->
</g:if>
</div><!-- /.box -->
</div>

</body>
</html>
    