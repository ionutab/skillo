<%@ page import="skillo.PostCode" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="admin" />
	<g:set var="entityName" value="${message(code: 'postCode.label', default: 'PostCode')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-postCode" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="postCode.code.label" default="Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postCodeInstance, field: "code")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="postCode.latitude.label" default="Latitude" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postCodeInstance, field: "latitude")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="postCode.longitude.label" default="Longitude" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postCodeInstance, field: "longitude")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="postCode.easting.label" default="Easting" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postCodeInstance, field: "easting")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="postCode.northing.label" default="Northing" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postCodeInstance, field: "northing")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="postCode.grindRef.label" default="Grind Ref" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postCodeInstance, field: "grindRef")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="postCode.district.label" default="District" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postCodeInstance, field: "district")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="postCode.ward.label" default="Ward" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postCodeInstance, field: "ward")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="postCode.districtCode.label" default="District Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postCodeInstance, field: "districtCode")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="postCode.wardCode.label" default="Ward Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postCodeInstance, field: "wardCode")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="postCode.county.label" default="County" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postCodeInstance, field: "county")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="postCode.country.label" default="Country" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postCodeInstance, field: "country")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="postCode.countryCode.label" default="Country Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: postCodeInstance, field: "countryCode")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="postCode.address.label" default="Address" /></td>
				
				<td valign="top" class="value"><g:link controller="address" action="show" id="${postCodeInstance?.address?.id}">${postCodeInstance?.address?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
