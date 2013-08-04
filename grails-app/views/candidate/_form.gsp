<%@ page import="skilloo.Candidate"%>
<g:javascript library="application" />
<modalbox:modalIncludes />


<fieldset>
	<legend>
		<g:message code="candidate.form.basicInfo" />
	</legend>
	<div class="row-fluid">
		<div class="span4">
			<div class="control-group fieldcontain ${hasErrors(bean: candidate, field: 'firstName', 'error')} ">
				<label for="firstName" class="control-label">
				    <g:message code="candidate.firstName.label" default="First Name" />
			    </label>
				<div class="controls">
					<g:textField name="firstName" class="input-xlarge" value="${candidateInstance?.firstName}" />
					<span class="help-inline">
						${hasErrors(bean: candidateInstance, field: 'firstName', 'error')}
					</span>
				</div>
			</div>
		</div>
		<div class="span4">
			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'lastName', 'error')} ">
				<label for="lastName" class="control-label">
				    <g:message code="candidate.lastName.label" default="Last Name" />
				</label>
				<div class="controls">
					<g:textField name="lastName" class="input-xlarge" value="${candidateInstance?.lastName}" />
					<span class="help-inline">
						${hasErrors(bean: candidateInstance, field: 'lastName', 'error')}
					</span>
				</div>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span4">
			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'birthDate', 'error')} ">
				<label for="birthDate" class="control-label">
				    <g:message code="candidate.birthDate.label" default="Birth Date" />
				</label>
				<div class="controls">
					<bs:datePicker name="birthDate" id="birthDate" precision="day" value="${candidateInstance?.birthDate}" default="none" noSelection="['':' ']"  />
					<span class="help-inline">
						${hasErrors(bean: candidateInstance, field: 'birthDate', 'error')}
					</span>
				</div>
			</div>
		</div>

		<div class="span4">
			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'telephoneNumber', 'error')} ">
				<label for="telephoneNumber" class="control-label">
				    <g:message code="candidate.telephoneNumber.label" default="Telephone Number" />
				</label>
				<div class="controls">
					<g:textField name="telephoneNumber" class="input-small" value="${candidateInstance?.telephoneNumber}" />
					<span class="help-inline">
						${hasErrors(bean: candidateInstance, field: 'telephoneNumber', 'error')}
                    </span>
                    <g:textField name="otherTelephoneNumber" class="input-small" value="${candidateInstance?.otherTelephoneNumber}" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'otherTelephoneNumber', 'error')}
                    </span>
                </div>
            </div>
        </div>
	</div>
	<div class="row-fluid">
		<div class="span4">
			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'address', 'error')} ">
				<label for="address.details" class="control-label">
				    <g:message code="candidate.address.label" default="Address" />
				</label>
				<div class="controls">
					<g:textField name="address.details" class="input-xlarge" value="${candidateInstance?.address?.details}" />
					<span class="help-inline">
						${hasErrors(bean: candidateInstance, field: 'address', 'error')}
					</span>
				</div>
			</div>
		</div>
		<div class="span4">
			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'address', 'error')} ">
				<label for="address.postcode" class="control-label">
				    <g:message code="address.postcode.label" default="Post Code" />
				</label>
				<div class="controls">
					<g:textField name="address.postcode" id="address.postcode" class="input-small" value="${candidateInstance?.address?.postCode}" />
					<span class="help-inline">
						${hasErrors(bean: candidateInstance, field: 'address', 'error')}
					</span>
				</div>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span4">
			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label">
				<g:message code="candidate.email.label" default="Email" /></label>
				<div class="controls">
					<g:field type="email" name="email" class="input-xlarge" value="${candidateInstance?.email}" />
					<span class="help-inline">
						${hasErrors(bean: candidateInstance, field: 'email', 'error')}
					</span>
				</div>
			</div>
		</div>
		<div class="span4">
			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'mainTrade', 'error')} ">
				<label for="mainTrade.name" class="control-label">
				    <g:message code="candidate.mainTrade.label" default="Main Trade" />
				</label>
				<div class="controls">
					<%--
                        TODO:add most used qualifications list on the right so that the user can select the qualification if not typing it 
                    --%>
					<g:textField name="mainTradeName" class="input-xlarge" value="${candidateInstance?.mainTrade?.name}" />
					<span class="help-inline">
						${hasErrors(bean: candidateInstance, field: 'mainTrade', 'error')}
					</span>
                    <g:hiddenField name="mainTradeId" id="mainTradeId" value="${candidateInstance?.mainTrade?.name}" />
                    <modalbox:createLink controller="qualification" action="listModal" title="${message(code: 'qualification.list.label', default: 'Qualification List', args: ' ')}" width="600" >
                        <i class="icon-th-list"></i>
                    </modalbox:createLink>
                </div>
            </div>
		</div>
	</div>
</fieldset>
<fieldset>
	<legend>
		<g:message code="candidate.form.extraInfo" />
	</legend>
	<div class="row-fluid">
		<div class="span2">
			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'driver', 'error')} ">
				<label for="driver" class="control-label">
				    <g:message code="candidate.driver.label" default="Driver" />
                </label>
				<div class="controls">
					<bs:checkBox name="driver" value="${candidateInstance?.driver}" />
					<span class="help-inline">
						${hasErrors(bean: candidateInstance, field: 'driver', 'error')}
					</span>
				</div>
			</div>
		</div>
		<div class="span2">
			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'carOwner', 'error')} ">
	            <label for="carOwner" class="control-label">
	               <g:message code="candidate.carOwner.label" default="Car Owner" />
	            </label>
	            <div class="controls">
	                <bs:checkBox name="carOwner" value="${candidateInstance?.carOwner}" checked="${true}" />
	                <span class="help-inline">
	                    ${hasErrors(bean: candidateInstance, field: 'carOwner', 'error')}
	                </span>
	            </div>
	        </div>
		</div>
	</div>
    <div  class="row-fluid">
        <div class="span2">
			<div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'sponsored', 'error')} ">
			    <label for="sponsored" class="control-label">
			      <g:message code="candidate.sponsored.label" default="Sponsored" />
			    </label>
			    <div class="controls">
			        <bs:checkBox name="sponsored" value="${candidateInstance?.sponsored}" checked="${true}" />
			        <span class="help-inline">
			            ${hasErrors(bean: candidateInstance, field: 'sponsored', 'error')}
			        </span>
			    </div>
			</div>
		</div>
	</div>

</fieldset>
<fieldset>
    <legend>
        <g:message code="candidate.form.competencesPayment" />
    </legend>
    <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'payrolls', 'error')} ">
        <label for="payrolls" class="control-label">
            <g:message code="candidate.payrolls.label" default="Payrolls" />
        </label>
        <div class="controls">
            <ul class="one-to-many">
                <g:each in="${candidateInstance?.payrolls?}" var="p">
                    <li>
                        <g:link controller="payroll" action="show" id="${p.id}">
                            ${p?.encodeAsHTML()}
                        </g:link></li>
                </g:each>
                <li class="add">
                    <g:link controller="payroll" action="create" params="['candidate.id': candidateInstance?.id]">
                        ${message(code: 'default.add.label', args: [message(code: 'payroll.label', default: 'Payroll')])}
                    </g:link>
                </li>
            </ul>

            <span class="help-inline">
                ${hasErrors(bean: candidateInstance, field: 'payrolls', 'error')}
            </span>
        </div>
    </div>    
</fieldset>
<fieldset>
    <legend>
        <g:message code="candidate.form.workHistory" />
    </legend>
    <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'jobs', 'error')} ">
        <label for="jobs" class="control-label">
            <g:message code="candidate.jobs.label" default="Jobs" />
        </label>
        <div class="controls">
            <ul class="one-to-many">
                <g:each in="${candidateInstance?.jobs?}" var="j">
                    <li>
                        <g:link controller="job" action="show" id="${j.id}">
                            ${j?.encodeAsHTML()}
                        </g:link>
                    </li>
                </g:each>
                <li class="add">
                    <g:link controller="job" action="create" params="['candidate.id': candidateInstance?.id]">
                        ${message(code: 'default.add.label', args: [message(code: 'job.label', default: 'Job')])}
                    </g:link>
                </li>
            </ul>
            <span class="help-inline">
                ${hasErrors(bean: candidateInstance, field: 'jobs', 'error')}
            </span>
        </div>
    </div>
</fieldset>
<fieldset>
    <legend>
        <g:message code="candidate.form.notes" />
    </legend>
</fieldset>