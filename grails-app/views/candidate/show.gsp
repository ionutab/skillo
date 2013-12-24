<%@ page import="skillo.Candidate" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="admin_light" />
	<g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-candidate" class="first">

	<table class="table">
		<tbody>
		
            <tr class="prop">
                <td valign="top" class="name"><g:message code="candidate.firstName.label" default="First Name" /></td>
                
                <td valign="top" class="value">${fieldValue(bean: candidateInstance, field: "firstName")}</td>
                
            </tr>
        
            <tr class="prop">
                <td valign="top" class="name"><g:message code="candidate.lastName.label" default="Last Name" /></td>
                
                <td valign="top" class="value">${fieldValue(bean: candidateInstance, field: "lastName")}</td>
                
            </tr>
        
			<tr class="prop">
				<td valign="top" class="name"><g:message code="candidate.consultant.label" default="Consultant" /></td>
				
				<td valign="top" class="value"><g:link controller="consultant" action="show" id="${candidateInstance?.consultant?.id}">${candidateInstance?.consultant?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="candidate.birthDate.label" default="Birth Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${candidateInstance?.birthDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="candidate.driver.label" default="Driver" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${candidateInstance?.driver}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="candidate.sponsored.label" default="Sponsored" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${candidateInstance?.sponsored}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="candidate.carOwner.label" default="Car Owner" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${candidateInstance?.carOwner}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="candidate.active.label" default="Active" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${candidateInstance?.active}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="candidate.telephoneNumber.label" default="Telephone Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: candidateInstance, field: "telephoneNumber")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="candidate.emails.label" default="Emails" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: candidateInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="candidate.address.label" default="Address" /></td>
				
				<td valign="top" class="value"><g:link controller="address" action="show" id="${candidateInstance?.address?.id}">${candidateInstance?.address?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		    <g:if test="${candidateInstance.candidateNotes} != null">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="candidate.candidateNotes.label" default="Candidate Notes" /></td>
					
					<td valign="top" style="text-align: left;" class="value">
						<ul>
						<g:each in="${candidateInstance.candidateNotes}" var="c">
							<li><g:link controller="candidateNote" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
						</g:each>
						</ul>
					</td>
					
				</tr>
		    </g:if>
		    
            <g:if test="${candidateInstance.payroll} != null">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="candidate.payroll.label" default="Payroll" /></td>
					
					<td valign="top" style="text-align: left;" class="value">
						<ul>
						<g:each in="${candidateInstance.payroll}" var="p">
							<li><g:link controller="payroll" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
						</g:each>
						</ul>
					</td>
				</tr>
			</g:if>
		
		    <g:if test="${candidateInstance.candidateQualifications} != null">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="candidate.candidateQualifications.label" default="Candidate Qualifications" /></td>
					
					<td valign="top" style="text-align: left;" class="value">
						<ul>
						<g:each in="${candidateInstance.candidateQualifications}" var="c">
							<li><g:link controller="candidateQualification" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
						</g:each>
						</ul>
					</td>
					
				</tr>
			</g:if>
		
		    <g:if test="${candidateInstance.jobs} != null" >
				<tr class="prop">
					<td valign="top" class="name"><g:message code="candidate.jobs.label" default="Jobs" /></td>
					
					<td valign="top" style="text-align: left;" class="value">
						<ul>
						<g:each in="${candidateInstance.jobs}" var="j">
							<li><g:link controller="job" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
						</g:each>
						</ul>
					</td>
					
				</tr>
			</g:if>
		
            <g:if test="${candidateInstance.placements} != null" >		
				<tr class="prop">
					<td valign="top" class="name"><g:message code="candidate.placements.label" default="Placements" /></td>
					
					<td valign="top" style="text-align: left;" class="value">
						<ul>
						<g:each in="${candidateInstance.placements}" var="p">
							<li><g:link controller="placement" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
						</g:each>
						</ul>
					</td>
					
				</tr>
			</g:if>
		
		</tbody>
	</table>
</section>

</body>

</html>
