<html>
<head>
	<title><g:message code="springSecurity.login.title"/></title>
	<meta name="layout" content="admin" />

	<g:set var="layout_nosidebar"		value="${true}" scope="request"/>
	<g:set var="layout_nonavbar"		value="${true}" scope="request"/>
	<g:set var="layout_nocontextbar"	value="${true}" scope="request"/>
</head>

<body>

<section id="login" class="first">
		<form id='loginForm' class='form-horizontal' action='${postUrl}' method='POST' autocomplete='off'>
            <h2 style="text-align: center"></h2>
            <h2> <g:message code="springSecurity.login.header"/> </h2>
            <fieldset class="form">
				<div class="control-group fieldcontain ${hasErrors(bean: _DemoPageInstance, field: 'name', 'error')} ">
					<div class="controls">
                        <g:textField name="j_username" id="username" placeholder="${message(code: "springSecurity.login.username.label" )}" />

					</div>
				</div>

				<div class="control-group fieldcontain ${hasErrors(bean: _DemoPageInstance, field: 'name', 'error')} ">
					<div class="controls">
                        <g:passwordField name="j_password" id="password" placeholder="${message(code: "springSecurity.login.password.label")}"  />
					</div>
				</div>

					<label for='${rememberMeParameter}' class="checkbox">
                        <g:message code="springSecurity.login.remember.me.label"/>
                        <g:checkBox name="${rememberMeParameter}" value="${hasCookie}" />
                    </label>
			</fieldset>
			<div class="controls">
				<input type='submit' id="submit" class="btn btn-success" value='${message(code: "springSecurity.login.button")}'/>
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
