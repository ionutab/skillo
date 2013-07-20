<!DOCTYPE html>
<html lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
	<title><g:layoutTitle default="${meta(name:'app.name')}" /></title>
	
    <meta charset="utf-8">
    <meta name="viewport"		content="width=device-width, initial-scale=1.0">
    <meta name="description"	content="">
    <meta name="author"			content="">
    
	<link rel="shortcut icon"		href="${resource(plugin: 'kickstart-with-bootstrap', dir:'images',file:'favicon.ico')}" type="image/x-icon" />
	
	<link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon.png">
    <link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon-72x72.png"	sizes="72x72">
    <link rel="apple-touch-icon"	href="assets/ico/apple-touch-icon-114x114.png"	sizes="114x114">


	<%-- Manual switch for the skin can be found in /view/_menu/_config.gsp --%>
	<r:require modules="jquery"/>
	<r:require modules="bootstrap"/>
	<r:require modules="bootstrap_utils"/>
    <r:require modules="another"/>

	<r:layoutResources />

    <g:layoutHead />
	<%-- For Javascript see end of body --%>
</head>

<body class="body-navbar-fixed">
	<g:render template="/_anothermenu/navbar"/>

    <g:render template="/_anothermenu/sidebar"/>

    <div class="content-container">
        <g:render template="/layouts/anothercontent"/>

        <!-- Enable to overwrite Footer by individual page -->
        <g:if test="${ pageProperty(name:'page.footer') }">
            <g:pageProperty name="page.footer" />
        </g:if>
        <g:else>
            <g:render template="/layouts/anotherfooter"/>
        </g:else>

        <!-- Enable to insert additional components (e.g., modals, javascript, etc.) by any individual page -->
        <g:if test="${ pageProperty(name:'page.include.bottom') }">
            <g:pageProperty name="page.include.bottom" />
        </g:if>
        <g:else>
            <!-- Insert a modal dialog for registering (for an open site registering is possible on any page) -->
            <g:render template="/_common/modals/registerDialog" model="[item: item]"/>
        </g:else>
    </div>

	<!-- Included Javascript files and other resources -->
	<r:layoutResources />
</body>

</html>