<legend>
    <g:message code="candidate.form.new.qualification" />
</legend>
<g:hiddenField name="newCandidateQualification.candidate.id" value="${newCandidateQualification?.candidate?.id}" />
<div class="form-group  ${hasErrors(bean: newCandidateQualification, field: 'qualification', 'has-error')} ">
    <label for="newCandidateQualification.qualification.id" class="col-sm-4 control-label">
        <g:message code="qualification.label" default="Qualification" />
    </label>
    <div class="col-sm-8">
        <g:select
                name="newCandidateQualification.qualification.id"
                id="newCandidateQualificationQualificationId"
                from="${AvailableQualifications}"
                value="${newCandidateQualification?.qualification?.id}"
                optionKey="id"
                optionValue="name"
                class="form-control"
                noSelection="${['null':'']}"
                required=""
        />
    </div>
</div>
<div class="form-group  ${hasErrors(bean: newCandidateQualification, field: 'expiryDate', 'has-error')} ">
    <label for="newCandidateQualification.expiryDate" class="col-sm-4 control-label">
        <g:message code="candidateQualification.expiryDate.label" default="Expiry Date" />
    </label>
    <div class="col-sm-4">
        <g:field type="expiryDate" name="newCandidateQualification.expiryDate" id="newCandidateQualificationExpiryDate" class="datepicker form-control" value="${formatDate(date: newCandidateQualification?.expiryDate)}" default="none" precision="day" />
        <g:javascript>
            $("#newCandidateQualificationExpiryDate").inputmask("d/m/y", { "placeholder": "dd/mm/yyyy" });
        </g:javascript>
   </div>
</div>
<div class="form-group  ${hasErrors(bean: newCandidateQualification, field: 'expiryDate', 'has-error')} ">
    <label for="newCandidateQualification.number" class="col-sm-4 control-label">
        <g:message code="candidateQualification.number.label" default="Qualification Number" />
    </label>
    <div class="col-sm-4">
        <g:textField name="newCandidateQualification.number" id="newCandidateQualificationNumber" class="form-control" value="${newCandidateQualification?.number}" />
    </div>
    <span class="help-inline">
        ${hasErrors(bean: newCandidateQualification, field: 'number', 'has-error')}
    </span>
</div>
<div class="form-group">
    <label for="newCandidateQualification.isMainTrade" class="col-sm-4 control-label">
        <g:message code="candidateQualification.isMainTrade.label" default="Is Main Trade" />
    </label>
    <div class="col-sm-6">
        <g:radioGroup name="newCandidateQualification.isMainTrade"
                      labels="['True', 'False']"
                      values="['true', 'false']"
                      value="${newCandidateQualification?.isMainTrade}">
            ${it.label} ${it.radio}
        </g:radioGroup>
    </div>
</div>