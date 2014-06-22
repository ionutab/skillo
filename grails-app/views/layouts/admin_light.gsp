<!DOCTYPE html>
<%-- The name of this file might be subject to change as development goes on. --%>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
	<title><g:layoutTitle default="${meta(name:'app.name')}" /></title>
	
    <meta charset="utf-8">
    <meta name="viewport"		content="width=device-width, initial-scale=1.0">
    <meta name="description"	content="">
    <meta name="author"			content="">
    
	<link rel="shortcut icon" href="${resource(plugin: 'kickstart-with-bootstrap', dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	
	<r:require modules="admin_light"/>

	<r:layoutResources />
	<g:layoutHead />

	<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<%-- For Javascript see end of body --%>
</head>

<body data-spy="scroll">

    <g:render template="/layouts/navbar_and_sidebar" />

	<%--workcontent --%>
    <div id="main-content-container">

        <g:if test="${!layout_full_width}">
            <g:render template="/layouts/workspace_light"/>
        </g:if>
        <g:if test="${layout_full_width}">
            <g:render template="/layouts/landing"/>
        </g:if>
	
	</div>
	
	<!-- Included Javascript files and other resources -->
	<r:layoutResources />
</body>

</html>