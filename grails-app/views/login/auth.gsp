<html>
<head>
	<title><g:message code="springSecurity.login.title"/></title>
	<meta name="layout" content="admin_lte_layout_basic" />

	<g:set var="layout_nosidebar"		value="${true}" scope="request"/>
	<g:set var="layout_nonavbar"		value="${true}" scope="request"/>
	<g:set var="layout_nocontextbar"	value="${true}" scope="request"/>
	<g:set var="layout_full_width"	    value="${true}" scope="request"/>
</head>

<body class="bg-blue">

<div class="form-box" id="login-box">
    <div class="header">Sign In</div>
    <form action="${postUrl}" method="post" autocomplete="off" >
        <div class="body bg-gray">
            <div class="form-group">
                <g:textField class="form-control" name="j_username" id="username" placeholder="${message(code: "springSecurity.login.username.label" )}" autofocus="true" />
            </div>
            <div class="form-group">
                <g:passwordField class="form-control" name="j_password" id="password" placeholder="${message(code: "springSecurity.login.password.label")}"  />
            </div>
            <div class="form-group">
                <g:checkBox name="${rememberMeParameter}" value="${hasCookie}" /> <g:message code="springSecurity.login.remember.me.label"/>
            </div>
        </div>
        <div class="footer">
            <button type="submit" class="btn bg-blue btn-block"><g:message code="springSecurity.login.button" /></button>
            <p><g:link url="#" ><g:message code="springSecurity.forgotPassword.question" /></g:link></p>
        </div>
    </form>

    %{--
    <div class="margin text-center">
        <span>Sign in using social networks</span>
        <br>
        <button class="btn bg-light-blue btn-circle"><i class="fa fa-facebook"></i></button>
        <button class="btn bg-aqua btn-circle"><i class="fa fa-twitter"></i></button>
        <button class="btn bg-red btn-circle"><i class="fa fa-google-plus"></i></button>

    </div>
    --}%

</div>

</body>
</html>
