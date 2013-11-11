
<%@ page import="skillo.Address" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 	<meta name="layout" content="admin" />
	<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>

<section id="list-address" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="details" title="${message(code: 'address.details.label', default: 'Details')}" />
			
				<g:sortableColumn property="active" title="${message(code: 'address.active.label', default: 'Active')}" />
			
				<th><g:message code="address.candidate.label" default="Candidate" /></th>
			
				<th><g:message code="address.postCode.label" default="Post Code" /></th>
			
				<th><g:message code="address.workSite.label" default="Work Site" /></th>
			
			<th><g:message code="actions" default="Actions" /></th>
			</tr>
		</thead>
		<tbody>
		<g:each in="${addressInstanceList}" status="i" var="addressInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${addressInstance.id}">${fieldValue(bean: addressInstance, field: "details")}</g:link></td>
			
				<td><g:formatBoolean boolean="${addressInstance.active}" /></td>
			
				<td>${fieldValue(bean: addressInstance, field: "candidate")}</td>
			
				<td>${fieldValue(bean: addressInstance, field: "postCode")}</td>
			
				<td>${fieldValue(bean: addressInstance, field: "workSite")}</td>
			
			<td><g:link action="edit" id="${addressInstance.id}" class="btn btn-small btn-inverse">Edit</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${addressInstanceTotal}" />
	</div>
</section>

</body>

</html>
