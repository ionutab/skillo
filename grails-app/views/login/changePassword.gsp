<head>
    <title><g:message code="springSecurity.login.title"/></title>
    <meta name="layout" content="admin_lte_layout_basic"/>
</head>

<div class="form-box" id="change-password-box">
    <div class="header">Change password</div>
    <g:form controller="login" action="updateUserPassword" method="post" autocomplete="off">
        <div class="body bg-gray">
            <div class="form-group">
                <g:textField class="form-control" name="j_username" id="username" placeholder="${message(code: "springSecurity.login.username.label" )}" autofocus="true" />
            </div>

            <div class="form-group">
                <g:passwordField class="form-control" name="j_password" id="password" placeholder="${message(code: "springSecurity.login.password.label")}"  />
            </div>

            <div class="form-group">
                <g:passwordField class="form-control" name="j_password_new" id="password_new" placeholder="New"  />
            </div>

            <div class="form-group">
                <g:passwordField class="form-control" name="j_password_new_2" id="password_new_2" placeholder="Re-type new"  />
            </div>
        </div>

        <div class="footer">
            <button type="submit"  class="btn bg-blue btn-block"><g:message
                    code="springSecurity.change.password.title"/></button>
        </div>
    </g:form>
</div>