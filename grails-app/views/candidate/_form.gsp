<%@ page import="skilloo.Candidate" %>

            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'firstName', 'error')} ">
                <label for="firstName" class="control-label"><g:message code="candidate.firstName.label" default="First Name" /></label>
                <div class="controls">
                    <g:textField name="firstName" value="${candidateInstance?.firstName}"/>
                    <span class="help-inline">${hasErrors(bean: candidateInstance, field: 'firstName', 'error')}</span>
                </div>
            </div>

            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'lastName', 'error')} ">
                <label for="lastName" class="control-label"><g:message code="candidate.lastName.label" default="Last Name" /></label>
                <div class="controls">
                    <g:textField name="lastName" value="${candidateInstance?.lastName}"/>
                    <span class="help-inline">${hasErrors(bean: candidateInstance, field: 'lastName', 'error')}</span>
                </div>
            </div>

			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'birthDate', 'error')} ">
				<label for="birthDate" class="control-label"><g:message code="candidate.birthDate.label" default="Birth Date" /></label>
				<div class="controls">
					<bs:datePicker name="birthDate" precision="day"  value="${candidateInstance?.birthDate}" default="none" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: candidateInstance, field: 'birthDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'driver', 'error')} ">
				<label for="driver" class="control-label"><g:message code="candidate.driver.label" default="Driver" /></label>
				<div class="controls">
					<g:checkBox name="driver" value="${candidateInstance?.driver}" />
					<span class="help-inline">${hasErrors(bean: candidateInstance, field: 'driver', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'sponsored', 'error')} ">
				<label for="sponsored" class="control-label"><g:message code="candidate.sponsored.label" default="Sponsored" /></label>
				<div class="controls">
					<g:checkBox name="sponsored" value="${candidateInstance?.sponsored}" />
					<span class="help-inline">${hasErrors(bean: candidateInstance, field: 'sponsored', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'carOwner', 'error')} ">
				<label for="carOwner" class="control-label"><g:message code="candidate.carOwner.label" default="Car Owner" /></label>
				<div class="controls">
					<g:checkBox name="carOwner" value="${candidateInstance?.carOwner}" />
					<span class="help-inline">${hasErrors(bean: candidateInstance, field: 'carOwner', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'active', 'error')} ">
				<label for="active" class="control-label"><g:message code="candidate.active.label" default="Active" /></label>
				<div class="controls">
					<g:checkBox name="active" value="${candidateInstance?.active}" />
					<span class="help-inline">${hasErrors(bean: candidateInstance, field: 'active', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'telephoneNumber', 'error')} ">
				<label for="telephoneNumber" class="control-label"><g:message code="candidate.telephoneNumber.label" default="Telephone Number" /></label>
				<div class="controls">
					<g:textField name="telephoneNumber" value="${candidateInstance?.telephoneNumber}"/>
					<span class="help-inline">${hasErrors(bean: candidateInstance, field: 'telephoneNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'emails', 'error')} ">
				<label for="emails" class="control-label"><g:message code="candidate.emails.label" default="Emails" /></label>
				<div class="controls">
					<g:field type="email" name="emails" value="${candidateInstance?.emails}"/>
					<span class="help-inline">${hasErrors(bean: candidateInstance, field: 'emails', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'address', 'error')} ">
				<label for="address" class="control-label"><g:message code="candidate.address.label" default="Address" /></label>
				<div class="controls">
					<g:select id="address" name="address.id" from="${skilloo.Address.list()}" optionKey="id" value="${candidateInstance?.address?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: candidateInstance, field: 'address', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'mainTrade', 'error')} ">
				<label for="mainTrade" class="control-label"><g:message code="candidate.mainTrade.label" default="Main Trade" /></label>
				<div class="controls">
					<g:select id="mainTrade" name="mainTrade.id" from="${skilloo.Qualification.list()}" optionKey="id" value="${candidateInstance?.mainTrade?.id}" class="many-to-one" noSelection="['null': '']"/>
					<span class="help-inline">${hasErrors(bean: candidateInstance, field: 'mainTrade', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'candidateNotes', 'error')} ">
				<label for="candidateNotes" class="control-label"><g:message code="candidate.candidateNotes.label" default="Candidate Notes" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${candidateInstance?.candidateNotes?}" var="c">
    <li><g:link controller="candidateNote" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="candidateNote" action="create" params="['candidate.id': candidateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'candidateNote.label', default: 'CandidateNote')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: candidateInstance, field: 'candidateNotes', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'payrolls', 'error')} ">
				<label for="payrolls" class="control-label"><g:message code="candidate.payrolls.label" default="Payrolls" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${candidateInstance?.payrolls?}" var="p">
    <li><g:link controller="payroll" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="payroll" action="create" params="['candidate.id': candidateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'payroll.label', default: 'Payroll')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: candidateInstance, field: 'payrolls', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'candidateQualifications', 'error')} ">
				<label for="candidateQualifications" class="control-label"><g:message code="candidate.candidateQualifications.label" default="Candidate Qualifications" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${candidateInstance?.candidateQualifications?}" var="c">
    <li><g:link controller="candidateQualification" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="candidateQualification" action="create" params="['candidate.id': candidateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'candidateQualification.label', default: 'CandidateQualification')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: candidateInstance, field: 'candidateQualifications', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'jobs', 'error')} ">
				<label for="jobs" class="control-label"><g:message code="candidate.jobs.label" default="Jobs" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${candidateInstance?.jobs?}" var="j">
    <li><g:link controller="job" action="show" id="${j.id}">${j?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="job" action="create" params="['candidate.id': candidateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'job.label', default: 'Job')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: candidateInstance, field: 'jobs', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'placements', 'error')} ">
				<label for="placements" class="control-label"><g:message code="candidate.placements.label" default="Placements" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${candidateInstance?.placements?}" var="p">
    <li><g:link controller="placement" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="placement" action="create" params="['candidate.id': candidateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'placement.label', default: 'Placement')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: candidateInstance, field: 'placements', 'error')}</span>
				</div>
			</div>

