<legend>
    <g:message code="candidate.form.new.qualification" />
</legend>
<div class="control-group fieldcontain ${hasErrors(bean: newCandidateQualification, field: 'qualification', 'error')} ">
    <label for="newQualificationId" class="control-label">
        <g:message code="qualification.label" default="Qualification" />
    </label>
    <div class="controls">
        <g:select
                name="newQualificationId"
                id="newQualificationId"
                from="${AvailableQualifications}"
                value="${newCandidateQualification?.qualification?.id}"
                optionKey="id"
                optionValue="name"
                class="input-xlarge"
                noSelection="${['null':'']}"
        />
        <span class="help-inline">
            ${hasErrors(bean: newCandidateQualification, field: 'qualification', 'error')}
        </span>
    </div>
</div>
<div class="control-group fieldcontain ${hasErrors(bean: newCandidateQualification, field: 'expiryDate', 'error')} ">
    <label for="expiryDate" class="control-label">
        <g:message code="candidateQualification.expiryDate.label" default="Expiry Date" />
    </label>
    <div class="controls">
        <g:datePicker name="expiryDate" id="expiryDate" precision="day" value="${newCandidateQualification?.expiryDate}" default="none" noSelection="['':' ']"  />
        <span class="help-inline">
            ${hasErrors(bean: newCandidateQualification, field: 'expiryDate', 'error')}
        </span>
   </div>
</div>
<div class="control-group fieldcontain ${hasErrors(bean: newCandidateQualification, field: 'expiryDate', 'error')} ">
    <label for="number" class="control-label">
        <g:message code="candidateQualification.number.label" default="Qualification Number" />
    </label>
    <div class="controls">
        <g:textField name="number" id="number" class="input-xlarge" value="${newCandidateQualification?.number}" />
    </div>
    <span class="help-inline">
        ${hasErrors(bean: newCandidateQualification, field: 'number', 'error')}
    </span>
</div>
<div class="control-group fieldcontain ${hasErrors(bean: newCandidateQualification, field: 'isMainTrade', 'error')} ">
    <label for="sponsored" class="control-label">
        <g:message code="candidateQualification.isMainTrade.label" default="Is Main Trade" />
    </label>
    <div class="controls">
        <g:checkBox name="isMainTrade" value="${newCandidateQualification?.isMainTrade}" />
        <span class="help-inline">
            ${hasErrors(bean: newCandidateQualification, field: 'isMainTrade', 'error')}
        </span>
    </div>
</div>