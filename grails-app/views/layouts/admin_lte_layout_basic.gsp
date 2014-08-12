<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="${meta(name:'app.name')}" /></title>

    <meta charset="utf-8">
    <meta name="viewport"		content="width=device-width, initial-scale=1.0">
    <meta name="description"	content="">
    <meta name="author"			content="">

    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />

    <%-- Manual switch for the skin can be found in /view/_menu/_config.gsp --%>
    <r:require modules="skillo_admin_lte_basic"/>

    <r:layoutResources />
    <g:layoutHead />

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

    <%-- For Javascript see end of body --%>
</head>

<body class="skin-blue bg-black" >
    <g:layoutBody />
    <r:layoutResources/>
</body>
</html>