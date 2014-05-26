<%@ page import="skillo.Candidate" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="admin_light" />
    <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
    <title><g:message code="candidate.list.label" args=" " /></title>
    <g:set var="page_title" value="${message(code: 'candidate.list.label')}" scope="request"/>
</head>

<body>

<div class="row">
    <div class="content-container col-lg-12">
    <g:form action="list" controller="candidate" name="searchForm" role="form">
        <legend><g:message code="candidate.search.label" /></legend>
            <div class="form-group row">
                <div class="col-sm-2">
                    <g:textField class="form-control" name="firstName" placeholder="${message(code: 'candidate.search.firstName.label', default: 'First Name')}" value="${params.firstName}"/>
                </div>
                <div class="col-sm-2">
                    <g:textField class="form-control" name="lastName" placeholder="${message(code: 'candidate.search.lastName.label', default: 'Last Name')}" value="${params.lastName}" />
                </div>
                <div class="col-sm-2">
                    <g:textField class="form-control" name="telephoneNumber" placeholder="${message(code: 'candidate.search.telephoneNumber.label', default: 'Telephone Nr')}" />
                </div>
                <div class="col-sm-2">
                    <g:textField class="form-control" name="qualification" placeholder="${message(code: 'candidate.search.qualification.label', default: 'Trade')}" />
                </div>
            </div>
        <div class="form-group">
                <g:submitButton name="list" class="btn btn-primary" value="${message(code: 'default.button.search.label')}" />
                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-refresh"></span></button>
                %{--<button type="button" class="btn btn-info pull-right" data-toggle="button"><span class="glyphicon glyphicon-arrow-down"></span></button>--}%
        </div>
    </g:form>
    </div>
</div>


<div class="row">

    <g:if test="${CandidateList.size() == 0}">
        <div class="col-lg-6 col-lg-offset-3 page-background-info" >
            <h2>There are currently no candidates that match your criteria.</h2>
        </div>
    </g:if>

    <g:if test="${CandidateList.size() > 0}">
        <div class="content-container col-lg-12">

            <g:render template="list_table"/>

            <div class="pagination">
                <g:paginate total="${CandidateTotal}" />
            </div>
        </div>
    </g:if>
</div>

</body>

</html>
    