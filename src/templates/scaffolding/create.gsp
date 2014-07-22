<%=packageName%>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="admin_lte_layout" />
	<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>

<body>

<section id="create-${domainClass.propertyName}" class="first">

	<g:hasErrors bean="\${${propertyName}}">
	<div class="alert alert-error">
        <g:hasErrors bean="\${${propertyName}}">
            <ul class="errors" role="alert">
                <g:eachError bean="\${${propertyName}}" var="error">
                    <li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<g:submitButton name="create" class="btn btn-primary" value="\${message(code: 'default.button.create.label', default: 'Create')}" />
        <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
	</g:form>
	
</section>
		
</body>

</html>
