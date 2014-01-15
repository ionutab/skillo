<%@ page import="skillo.Candidate" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="admin_light" />
	<g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
    <r:require modules="forms"/>
    <r:require modules="candidates"/>
</head>

<body>

<section id="create-candidate" class="first">

    %{--
	<g:hasErrors bean="${candidateInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${candidateInstance}" as="list" />
	</div>
	</g:hasErrors>
    --}%

    <div class="row">
        <div class="span6">
            <g:form action="save" class="form-horizontal" >
                <g:render template="form"/>
                <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.save.label', default: 'Save')}" />
                <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
            </g:form>
        </div>
    </div>


    %{--TODO create special template for these , or form--}%

</section>
		
</body>

</html>
