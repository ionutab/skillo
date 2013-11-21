<%@ page import="skillo.Candidate"%>
            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'firstName', 'error')} ">
                <label for="candidate.firstName" class="control-label">
                    <g:message code="candidate.firstName.label" default="First Name" />
                </label>
                <div class="controls">
                    <g:textField name="candidate.firstName" class="input-xlarge" value="${candidateInstance?.firstName}" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'firstName', 'error')}
                    </span>
                </div>
            </div>
            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'lastName', 'error')} ">
                <label for="candidate.lastName" class="control-label">
                    <g:message code="candidate.lastName.label" default="Last Name" />
                </label>
                <div class="controls">
                    <g:textField name="candidate.lastName" class="input-xlarge" value="${candidateInstance?.lastName}" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'lastName', 'error')}
                    </span>
                </div>
            </div>
            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'birthDate', 'error')} ">
                <label for="candidate.birthDate" class="control-label">
                    <g:message code="candidate.birthDate.label" default="Birth Date" />
                </label>
                <div class="controls">
                    <g:field type="textField" name="candidate.birthDate" id="candidateBirthDate" class="datepicker" value="${formatDate(date: candidateInstance?.birthDate)}" default="none" precision="day" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'birthDate', 'error')}
                    </span>
                </div>
            </div>
            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'telephoneNumber', 'error')} ">
                <label for="candidate.telephoneNumber" class="control-label">
                    <g:message code="candidate.telephoneNumber.label" default="Telephone Number" />
                </label>
                <div class="controls">
                    <g:textField name="candidate.telephoneNumber" class="input-small" value="${candidateInstance?.telephoneNumber}" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'telephoneNumber', 'error')}
                    </span>
                    <g:textField name="candidate.otherTelephoneNumber" class="input-small" value="${candidateInstance?.otherTelephoneNumber}" />
                </div>
            </div>
            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'address.details', 'error')} ">
                <label for="address.details" class="control-label">
                    <g:message code="candidate.address.label" default="Address" />
                </label>
                <div class="controls">
                    <g:textField name="address.details" id="address.details" class="input-xlarge" value="${candidateInstance?.address?.details}" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'address.details', 'error')}
                    </span>
                </div>
            </div>
            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'address.postCode', 'error')} ">
                <label for="postCode.code" class="control-label">
                    <g:message code="postCode.code.label" default="Post Code" />
                </label>
                <div class="controls">
                    <g:textField name="postCode.code" id="postCode.code" class="input-small" value="${candidateInstance?.address?.postCode?.code}" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'address.postCode', 'error')}
                    </span>
                </div>
            </div>
            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'email', 'error')} ">
                <label for="candidate.email" class="control-label">
                    <g:message code="candidate.email.label" default="Email" />
                </label>
                <div class="controls">
                    <g:field type="email" name="candidate.email" class="input-xlarge" value="${candidateInstance?.email}" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'email', 'error')}
                    </span>
                </div>
            </div>

            <% if(params.action == 'edit'){ %>
                <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'consultant', 'error')} ">
                    <label for="consultant.id" class="control-label">
                        <g:message code="candidate.owningConsultant.label" default="Owning Consultant" />
                    </label>
                    <div class="controls">
                        <g:textField name="consultant.id" class="input-xlarge" value="${candidateInstance?.consultant?.firstName + ' ' + candidateInstance?.consultant?.lastName}" disabled="disabled" />
                        <span class="help-inline">
                            ${hasErrors(bean: candidateInstance, field: 'consultant', 'error')}
                        </span>
                    </div>
                </div>
            <% } %>

            <% if(params.action == 'create' || params.action == 'save' ) {%>
                <div class="control-group fieldcontain  ${hasErrors(bean: candidateInstance, field: 'candidateQualifications', 'error')} ">
                    <label for="mainTradeId" class="control-label">
                        <g:message code="candidate.mainTrade.label" default="Main Trade" />
                    </label>
                    <div class="controls">
                        <%--
                        TODO:add most used qualifications list on the right so that the user can select the qualification if not typing it
                        --%>
                        <g:hiddenField
                            name="candidateMainTrade.id"
                            id="mainTradeId"
                            class="input-xlarge"
                            value="${candidateInstance?.candidateQualifications?.asList()?.first()?.qualification?.id}"
                            />

                        <g:javascript>
                            function formatCandidateQualification(item) { return item.name; };
                            $("#mainTradeId").select2({
                                    data: {results:${AvailableMainTrades}, text:'name'},
                                    formatSelection: formatCandidateQualification,
                                    formatResult: formatCandidateQualification,
                                    placeholder: "Select a Qualification",
                                    allowClear:true
                                }
                            );
                        </g:javascript>
                        <span class="help-inline">
                            ${hasErrors(bean: candidateInstance, field: 'candidateQualifications', 'error')}
                        </span>
                    </div>
                </div>
            <% } %>

    <div class="row-fluid">
        <div class="span4">
            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'driver', 'error')} ">
                <label for="candidate.driver" class="control-label">
                    <g:message code="candidate.driver.label" default="Driver" />
                </label>
                <div class="controls">
                    <g:checkBox name="candidate.driver" value="${candidateInstance?.driver}" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'driver', 'error')}
                    </span>
                </div>
            </div>
        </div>
        <div class="span4">
            <div class="control-group fieldcontain ${hasErrors(bean: candidateInstance, field: 'carOwner', 'error')} ">
                <label for="candidate.carOwner" class="control-label">
                   <g:message code="candidate.carOwner.label" default="Car Owner" />
                </label>
                <div class="controls">
                    <g:checkBox name="candidate.carOwner" value="${candidateInstance?.carOwner}" />
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
                <label for="candidate.sponsored" class="control-label">
                  <g:message code="candidate.sponsored.label" default="Sponsored" />
                </label>
                <div class="controls">
                    <g:checkBox name="candidate.sponsored" value="${candidateInstance?.sponsored}" />
                    <span class="help-inline">
                        ${hasErrors(bean: candidateInstance, field: 'sponsored', 'error')}
                    </span>
                </div>
            </div>
        </div>
    </div>
