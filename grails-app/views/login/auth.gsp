<html>
<head>
	<title><g:message code="springSecurity.login.title"/></title>
	<meta name="layout" content="admin_light" />

	<g:set var="layout_nosidebar"		value="${true}" scope="request"/>
	<g:set var="layout_nonavbar"		value="${true}" scope="request"/>
	<g:set var="layout_nocontextbar"	value="${true}" scope="request"/>
	<g:set var="layout_full_width"	    value="${true}" scope="request"/>
</head>

<body>

<section id="login" class="first">

    <form role="form" id="login-form" action='${postUrl}' method='POST' autocomplete='off' >

        <div class="form-group fieldcontain ">
            <g:textField class="form-control" name="j_username" id="username" placeholder="${message(code: "springSecurity.login.username.label" )}" />
        </div>

        <div class="form-group fieldcontain ">
            <g:passwordField class="form-control" name="j_password" id="password" placeholder="${message(code: "springSecurity.login.password.label")}"  />
        </div>
        <div class="form-group checkbox" >
            <label for='${rememberMeParameter}' >
                <g:checkBox name="${rememberMeParameter}" value="${hasCookie}" /><g:message code="springSecurity.login.remember.me.label"/>
            </label>
        </div>

        <g:if test="${flash.message}">
            <div class="alert alert-danger">${flash.message}</div>
        </g:if>

        <div class="form-group" >
            <button type="submit" class="btn btn-default btn-success">Submit</button>
        </div>

        <div class="form-group" >
            <g:link url="#" ><g:message code="springSecurity.forgotPassword.question" /></g:link>
        </div>
    </form>

</section>

<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>

</body>
</html>
