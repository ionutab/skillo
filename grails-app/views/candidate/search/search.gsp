<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>

<head>
    <meta name="layout" content="admin_lte_layout"/>
    <title><g:message code="candidate.list.label" args=" "/></title>
    <g:set var="pageTitle" value="${message(code: 'candidate.search.label')}" scope="request"/>
    <g:set var="layout_nocontextbar" value="${true}" scope="request" />
    <r:require modules="jquery,select2,application" />
</head>
<body>

    <g:render template="/candidate/search/searchForm" model="['candidateFilter':candidateFilter,'qualificationSets':qualificationSets]" />

</body>
</html>