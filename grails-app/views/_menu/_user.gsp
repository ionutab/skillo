<%@ page import="org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils" %>
<sec:ifNotLoggedIn>

		<a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#" tabindex="-1">
			<!-- TODO: integrate Springsource Security etc. and show User's name ... -->
            <span class="glyphicon glyphicon-user"></span>
    		<g:message code="springSecurity.login.title"/><b class="caret"></b>
		</a>

		<ul class="dropdown-menu" role="menu">
			<li class="form-container">
				<form action="${request.contextPath}${SpringSecurityUtils.securityConfig.apf.filterProcessesUrl}" method="post" accept-charset="UTF-8">
					<input style="margin-bottom: 15px;" type="text" placeholder="Username" id="username" name="j_username">
					<input style="margin-bottom: 15px;" type="password" placeholder="Password" id="password" name="j_password">
					<input style="float: left; margin-right: 10px;" type="checkbox" name="${SpringSecurityUtils.securityConfig.rememberMe.parameter}" id="remember-me" value="1">
					<label class="string optional" for="remember-me"> Remember me</label>
					<input class="btn btn-primary btn-block" type="submit" id="sign-in" value="Sign In">
				</form>
			</li>
			<li class="divider"></li>
			<li class="button-container">
				<!-- NOTE: the renderDialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
				<g:render template="/_common/modals/registerTextLink"/>
			</li>
		</ul>

</sec:ifNotLoggedIn>
<sec:ifLoggedIn>
        <div class="btn-group">
            <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
                <span class="glyphicon glyphicon-user"></span>
                <sec:loggedInUserInfo field="username" />
                <span class="caret"></span>
            </a>

            <ul class="dropdown-menu pull-right">
                <li class="">
                    <a href="${createLink(controller: 'userSetting', action: 'index')}">
                        <span class="glyphicon glyphicon-cog"></span>
                        <g:message code="userSetting.multiple.label"/>
                    </a>
                </li>
                <li class="">
                    <a href="${createLink(controller: 'logout')}">
                        <span class="glyphicon glyphicon-off"></span>
                        <g:message code="springSecurity.logout.label"/>
                    </a>
                </li>
            </ul>
        </div>
</sec:ifLoggedIn>

<noscript>
<ul class="nav pull-right">
	<li class="">
		<g:link controller="user" action="show"><g:message code="default.user.unknown.label"/></g:link>
	</li>
</ul>
</noscript>
