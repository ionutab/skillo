<html>

<head>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="page_title" value="${message(code: 'dashboard.welcome.label')}" scope="request"/>
    <g:set var="layout_nocontextbar" value="false" scope="request"/>
</head>

<body>
<div class="row">
    <div class="col-md-4">
        <g:render template="/candidate/latestActivities" />
    </div>
</div>
</body>

</html>
	