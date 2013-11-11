<%@ page import="skillo.PostCode" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="admin" />
	<g:set var="entityName" value="${message(code: 'postCode.label', default: 'PostCode')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create-postCode" class="first">

	<g:hasErrors bean="${postCodeInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${postCodeInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
	</g:form>
	
</section>
		
</body>

</html>
