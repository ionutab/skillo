<%@ page import="skillo.Candidate"%>
<legend><g:message code="candidate.form.basicInfo" /></legend>
<div class="form-group  ${hasErrors(bean: candidateInstance, field: 'firstName', 'has-error')} ">
    <label for="candidate.firstName" class="col-sm-4 control-label">
        <g:message code="candidate.firstName.label" default="First Name" />
    </label>
    <div class="col-sm-6">
        <g:textField name="candidate.firstName" class="form-control" value="${candidateInstance?.firstName}" />
    </div>
    %{--
    <span class="help-inline">
        ${hasErrors(bean: candidateInstance, field: 'firstName', 'error')}
    </span>
    --}%
</div>
<div class="form-group ${hasErrors(bean: candidateInstance, field: 'lastName', 'has-error')} ">
    <label for="candidate.lastName" class="col-sm-4 control-label">
        <g:message code="candidate.lastName.label" default="Last Name" />
    </label>
    <div class="col-sm-6">
        <g:textField name="candidate.lastName" class="form-control" value="${candidateInstance?.lastName}" />
    </div>
</div>
<div class="form-group ${hasErrors(bean: candidateInstance, field: 'birthDate', 'has-error')} ">
    <label for="candidate.birthDate" class="col-sm-4 control-label">
        <g:message code="candidate.birthDate.label" default="Birth Date" />
    </label>
    <div class="col-sm-3">
        <g:field type="textField" name="candidate.birthDate" id="candidateBirthDate" class="form-control datepicker" value="${formatDate(date: candidateInstance?.birthDate)}" default="none" />
    </div>
</div>
<div class="form-group ${hasErrors(bean: candidateInstance, field: 'telephoneNumber', 'has-error')} ">
    <label for="candidate.telephoneNumber" class="col-sm-4 control-label">
        <g:message code="candidate.telephoneNumber.label" default="Telephone Number" />
    </label>
    <div class="col-sm-3">
        <g:textField type="tel" name="candidate.telephoneNumber" class="form-control" value="${candidateInstance?.telephoneNumber}" />
    </div>
    %{--
    <div class="col-sm-3">
        <g:textField name="candidate.otherTelephoneNumber" class="form-control" value="${candidateInstance?.otherTelephoneNumber}" />
    </div>
    --}%
</div>
<div class="form-group ${hasErrors(bean: candidateInstance, field: 'address.details', 'has-error')} ">
    <label for="address.details" class="col-sm-4 control-label">
        <g:message code="candidate.address.label" default="Address" />
    </label>
    <div class="col-sm-6">
        <g:textField name="address.details" id="address.details" class="form-control" value="${candidateInstance?.address?.details}" />
    </div>
</div>

<div class="form-group ${hasErrors(bean: candidateInstance, field: 'address.postCode', 'has-error')} ">
    <label for="postCode.id" class="col-sm-4 control-label">
        <g:message code="postCode.code.label" default="Post Code" />
    </label>
    <div class="col-sm-6">
        <g:hiddenField
                name="postCode.id"
                id="postCodeId"
                value="${candidateInstance?.address?.postCode?.id}"
        />
        <g:hiddenField
                name="postCode.previousCode"
                id="postCodeCode"
                value="${candidateInstance?.address?.postCode?.code}"
        />

        <g:javascript>
                function formatPostCodeSelection(item) {
                    return item.code;
                };

                function formatPostCodeResult(item) {
                    return item.code + ' - ' + item.country;
                };
                function doWeHaveAPostCodeAlready(){
                    return "Search for a Post Code";
                }
                $("#postCodeId").select2({
                    placeholder: doWeHaveAPostCodeAlready,
//                                  VERY IMPORTANT
                    //minimumInputLength: 4,
                    ajax:{
                        url: '<g:createLink controller="postCode" action="getPostCodes" />',
                        dataType: 'json',
                        data: function(term, page){
                            return {inputCode: term};
                        },
                        results: function (data, page) {
                            return {results: data};
                        }
                    },
                    initSelection: function(element, callback) {
                        var id=$("#postCodeId").val();
                        if (id!=="") {
                            $("#s2id_postCodeId .select2-chosen").html($("#postCodeCode").val());
                        }
                    },
                    formatSelection: formatPostCodeSelection,
                    formatResult: formatPostCodeResult,
                    escapeMarkup: function (m) { return m; }
                });

        </g:javascript>
    </div>
</div>

<div class="form-group ${hasErrors(bean: candidateInstance, field: 'email', 'has-error')} ">
    <label for="candidate.email" class="col-sm-4 control-label">
        <g:message code="candidate.email.label" default="Email" />
    </label>
    <div class="col-sm-6">
        <g:field type="email" name="candidate.email" class="form-control" value="${candidateInstance?.email}" />
    </div>
</div>

<% if(params.action == 'create' || params.action == 'save' ) {%>
    <div class="form-group ${hasErrors(bean: candidateInstance, field: 'candidateQualifications', 'has-error')} ">
        <label for="mainTradeId" class="col-sm-4 control-label">
            <g:message code="candidate.mainTrade.label" default="Main Trade" />
        </label>
        <div class="col-sm-6">
            <%--
            TODO:add most used qualifications list on the right so that the user can select the qualification if not typing it
            --%>
            <g:hiddenField
                name="candidateMainTrade.id"
                id="mainTradeId"
                class="form-control"
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
        </div>
    </div>
<% } %>

%{--
<div class="form-group">
    <label class="col-sm-3 control-label">Remember me</label>
    <div class="col-sm-6">
        <input type="checkbox" id="checkoff" checked>
    </div>
</div>
--}%

<div class="form-group">
    <label for="candidate.driver" class="col-sm-4 control-label ">
        <g:message code="candidate.driver.label" default="Driver" />
    </label>
    <div class="col-sm-6">
        <g:checkBox name="candidate.driver" class="checkbox" value="${candidateInstance?.driver}" id="candidateIsDriver" data-on-label="Yes" data-off-label="No" />
    </div>
</div>

<div class="form-group ">
    <label for="candidate.sponsored" class="col-sm-4 control-label">
        <g:message code="candidate.sponsored.label" default="Sponsored" />
    </label>
    <div class="col-sm-6">
        <g:checkBox name="candidate.sponsored" class="checkbox" value="${candidateInstance?.sponsored}" id="candidateIsSponsored" data-on-label="Yes" data-off-label="No"/>
    </div>
</div>

<div class="form-group ">
    <label for="candidate.carOwner" class="col-sm-4 control-label">
       <g:message code="candidate.carOwner.label" default="Car Owner" />
    </label>
    <div class="col-sm-6">
        <g:checkBox name="candidate.carOwner" class="checkbox" value="${candidateInstance?.carOwner}" id="candidateIsCarOwner" data-on-label="Yes" data-off-label="No"/>
    </div>
</div>

<% if(params.action == 'edit' || params.action == 'index'){ %>
<div class="form-group ${hasErrors(bean: candidateInstance, field: 'consultant', 'has-error')} ">
    <label for="consultant.id" class="col-sm-4 control-label">
        <g:message code="candidate.owningConsultant.label" default="By Consultant" />
    </label>
    <div class="col-sm-6">
        <g:textField name="consultant.id" class="form-control" value="${candidateInstance?.consultant?.firstName + ' ' + candidateInstance?.consultant?.lastName}" disabled="disabled" />
    </div>
</div>
<% } %>