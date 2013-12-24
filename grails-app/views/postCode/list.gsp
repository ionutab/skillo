
<%@ page import="skillo.PostCode" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 	<meta name="layout" content="admin_light" />
	<g:set var="entityName" value="${message(code: 'postCode.label', default: 'PostCode')}" />
	<title><g:meta name="app.title.short" /> <g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-postCode" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="code" title="${message(code: 'postCode.code.label', default: 'Code')}" />
			
				<g:sortableColumn property="latitude" title="${message(code: 'postCode.latitude.label', default: 'Latitude')}" />
			
				<g:sortableColumn property="longitude" title="${message(code: 'postCode.longitude.label', default: 'Longitude')}" />
			
				<g:sortableColumn property="easting" title="${message(code: 'postCode.easting.label', default: 'Easting')}" />
			
				<g:sortableColumn property="northing" title="${message(code: 'postCode.northing.label', default: 'Northing')}" />
			
				<g:sortableColumn property="grindRef" title="${message(code: 'postCode.grindRef.label', default: 'Grind Ref')}" />
			
			<th><g:message code="actions" default="Actions" /></th>
			</tr>
		</thead>
		<tbody>
		<g:each in="${postCodeInstanceList}" status="i" var="postCodeInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${postCodeInstance.id}">${fieldValue(bean: postCodeInstance, field: "code")}</g:link></td>
			
				<td>${fieldValue(bean: postCodeInstance, field: "latitude")}</td>
			
				<td>${fieldValue(bean: postCodeInstance, field: "longitude")}</td>
			
				<td>${fieldValue(bean: postCodeInstance, field: "easting")}</td>
			
				<td>${fieldValue(bean: postCodeInstance, field: "northing")}</td>
			
				<td>${fieldValue(bean: postCodeInstance, field: "grindRef")}</td>
			
			<td><g:link action="edit" id="${postCodeInstance.id}" class="btn btn-small btn-inverse">Edit</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${postCodeInstanceTotal}" />
	</div>
</section>

</body>

</html>
