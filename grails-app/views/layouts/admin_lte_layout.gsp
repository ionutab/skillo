<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="${meta(name:'app.name')}" /></title>

    <meta charset="utf-8">
    <meta name="viewport"		content="width=device-width, initial-scale=1.0">
    <meta name="description"	content="">
    <meta name="author"			content="">

    <link rel="shortcut icon" href="${resource(file: 'favicon.ico')}" type="image/x-icon" />

    <%-- Manual switch for the skin can be found in /view/_menu/_config.gsp --%>
    <r:require modules="skillo_admin_lte"/>

    <r:layoutResources />
    <g:layoutHead />

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

    <%-- For Javascript see end of body --%>
</head>

<body class="skin-blue wysihtml5-supported fixed" >

    <g:render template="/_menu/header" />

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <g:render template="/_menu/sidebar" />

        <g:if test="${!layout_full_width}">
            <g:render template="/layouts/workspace_lte"/>
        </g:if>
    </div>


    <r:layoutResources/>
</body>
</html>