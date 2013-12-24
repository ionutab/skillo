<%@ page import="skillo.Address" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="admin_light" />
	<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-address" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.details.label" default="Details" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: addressInstance, field: "details")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.active.label" default="Active" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${addressInstance?.active}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.candidate.label" default="Candidate" /></td>
				
				<td valign="top" class="value"><g:link controller="candidate" action="show" id="${addressInstance?.candidate?.id}">${addressInstance?.candidate?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.postCode.label" default="Post Code" /></td>
				
				<td valign="top" class="value"><g:link controller="postCode" action="show" id="${addressInstance?.postCode?.id}">${addressInstance?.postCode?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.workSite.label" default="Work Site" /></td>
				
				<td valign="top" class="value"><g:link controller="workSite" action="show" id="${addressInstance?.workSite?.id}">${addressInstance?.workSite?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
