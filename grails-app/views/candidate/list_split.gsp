<%@ page import="skillo.Candidate" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="admin_light" />
    <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
    <title><g:message code="candidate.list.label" args=" " /></title>
    <g:set var="page_title" value="${message(code: 'candidate.list.label')}" scope="request"/>
    <r:require modules="candidates"/>
</head>

<body>

<div class="row">
    <div class="content-container col-lg-12">
    <g:form action="list" controller="candidate" name="searchForm" id="candidateSearchForm" role="form">
        <g:render template="search_form" />
    </g:form>
    </div>
</div>


<div class="row">

        <g:if test="${CandidateList.size() == 0}">
            <div class="col-lg-6 col-lg-offset-3 page-background-info" >
                <h2 class="center-block">There are currently no candidates that match your criteria.</h2>
            </div>
        </g:if>

        <g:if test="${CandidateList.size() > 0}">
            <div class="col-lg-7">
                <g:render template="list_table"/>
                <div class="pagination">
                    <g:paginate total="${CandidateTotal}" />
                </div>
            </div>
            <div class="col-lg-5">

                   <g:render template="info" />

            </div>
        </g:if>
</div>

</body>
</html>
    