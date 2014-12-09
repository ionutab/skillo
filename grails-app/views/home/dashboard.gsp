<html>

<head>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="pageTitle" value="${message(code: 'dashboard.welcome.label')}" scope="request"/>
    <g:set var="layout_nocontextbar" value="false" scope="request"/>
</head>

<body>
<div class="row">
    <div class="col-md-12">
        <div class="col-md-6">

            <g:render template="template/dashboardInformation" />
        </div>
        <div class="col-md-6" id="activityTemplateDivId">
            <g:render template="template/latestActivities" model="[showLinks:true]"  />
        </div>
    </div>
</div>
</body>

</html>
	