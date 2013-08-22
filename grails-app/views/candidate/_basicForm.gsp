<%@ page import="skilloo.Candidate"%>
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
            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'birthDate', 'error')} ">
                <label for="birthDate" class="control-label">
                    <g:message code="candidate.birthDate.label" default="Birth Date" />
                </label>
                <div class="controls">
                    <bs:datePicker name="birthDate" id="birthDate" precision="year" value="${candidateInstance?.birthDate}" default="none" noSelection="['':' ']" />

                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'birthDate', 'error')}
                    </span>
                </div>
            </div>
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
            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'address', 'error')} ">
                <label for="addressPostCode" class="control-label">
                    <g:message code="address.postcode.label" default="Post Code" />
                </label>
                <div class="controls">
                    <g:textField name="addressPostCode" id="addressPostCode" class="input-small" value="${candidateInstance?.address?.postCode?.code}" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'postCode', 'error')}
                    </span>
                </div>
            </div>
            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'email', 'error')} ">
                <label for="email" class="control-label">
                    <g:message code="candidate.email.label" default="Email" />
                </label>
                <div class="controls">
                    <g:field type="email" name="email" class="input-xlarge" value="${candidateInstance?.email}" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'email', 'error')}
                    </span>
                </div>
            </div>

            <% if(params.action == 'edit'){ %>
                <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'mainTrade', 'error')} ">
                    <label for="owningConsultantId" class="control-label">
                        <g:message code="candidate.owningConsultant.label" default="Owning Consultant" />
                    </label>
                    <div class="controls">
                        <g:textField name="owningConsultantId" class="input-xlarge" value="${candidateInstance?.consultant?.firstName + ' ' + candidateInstance?.consultant?.lastName}" disabled="disabled" />
                        <span class="help-inline">
                            ${hasErrors(bean: candidateInstance, field: 'consultant', 'error')}
                        </span>
                    </div>
                </div>
            <% } %>

            <% if(params.action == 'create') {%>
                <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'mainTrade', 'error')} ">
                    <label for="mainTradeId" class="control-label">
                        <g:message code="candidate.mainTrade.label" default="Main Trade" />
                    </label>
                    <div class="controls">
                        <%--
                            TODO:add most used qualifications list on the right so that the user can select the qualification if not typing it
                        --%>
                        <g:select
                            name="mainTradeId"
                            id="mainTradeId"
                            from="${AvailableMainTrades}"
                            value=""
                            optionKey="id"
                            optionValue="name"
                            class="input-xlarge"
                            noSelection="${['null':'']}"
                            />
                        <span class="help-inline">
                            ${hasErrors(bean: candidateInstance, field: 'mainTrade', 'error')}
                        </span>
                    </div>
                </div>
            <% } %>

    <div class="row-fluid">
        <div class="span4">
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
        <div class="span4">
            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'carOwner', 'error')} ">
                <label for="carOwner" class="control-label">
                   <g:message code="candidate.carOwner.label" default="Car Owner" />
                </label>
                <div class="controls">
                    <bs:checkBox name="carOwner" value="${candidateInstance?.carOwner}" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'carOwner', 'error')}
                    </span>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span4">
            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'sponsored', 'error')} ">
                <label for="sponsored" class="control-label">
                  <g:message code="candidate.sponsored.label" default="Sponsored" />
                </label>
                <div class="controls">
                    <bs:checkBox name="sponsored" value="${candidateInstance?.sponsored}" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'sponsored', 'error')}
                    </span>
                </div>
            </div>
        </div>
    </div>
