<legend>
    <g:message code="candidate.form.new.qualification" />
</legend>
<div class="alert alert-error">
    asdada
    asd
    asda
    sd
</div>
<g:hiddenField name="newCandidateQualification.candidate.id" value="${newCandidateQualification?.candidate?.id}" />
<fieldset class="form">
    <div class="control-group fieldcontain ${hasErrors(bean: newCandidateQualification, field: 'qualification', 'error')} ">
        <label for="newCandidateQualification.qualification.id" class="control-label">
            <g:message code="qualification.label" default="Qualification" />
        </label>
        <div class="controls">
            <g:select
                    name="newCandidateQualification.qualification.id"
                    id="newCandidateQualificationQualificationId"
                    from="${AvailableQualifications}"
                    value="${newCandidateQualification?.qualification?.id}"
                    optionKey="id"
                    optionValue="name"
                    class="input-xlarge"
                    noSelection="${['null':'']}"
                    required=""
            />
            <span class="help-inline">
                ${hasErrors(bean: newCandidateQualification, field: 'qualification', 'error')}
            </span>
        </div>
    </div>
    <div class="control-group fieldcontain ${hasErrors(bean: newCandidateQualification, field: 'expiryDate', 'error')} ">
        <label for="newCandidateQualification.expiryDate" class="control-label">
            <g:message code="candidateQualification.expiryDate.label" default="Expiry Date" />
        </label>
        <div class="controls">
            <g:field type="expiryDate" name="newCandidateQualification.expiryDate" id="newCandidateQualificationExpiryDate" class="datepicker" value="${formatDate(date: newCandidateQualification?.expiryDate)}" default="none" precision="day" required="" />
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
            <g:textField name="newCandidateQualification.number" id="number" class="input-xlarge" value="${newCandidateQualification?.number}" />
        </div>
        <span class="help-inline">
            ${hasErrors(bean: newCandidateQualification, field: 'number', 'error')}
        </span>
    </div>
    <div class="control-group fieldcontain ${hasErrors(bean: newCandidateQualification, field: 'isMainTrade', 'error')} ">
        <label for="newCandidateQualification.isMainTrade" class="control-label">
            <g:message code="candidateQualification.isMainTrade.label" default="Is Main Trade" />
        </label>
        <div class="controls">
            <g:checkBox name="newCandidateQualification.isMainTrade" value="${newCandidateQualification?.isMainTrade}" />
            <span class="help-inline">
                ${hasErrors(bean: newCandidateQualification, field: 'isMainTrade', 'error')}
            </span>
        </div>
    </div>
</fieldset>
%{--<g:submit url="[controller:'candidateQualification', action:'addCandidateQualification']" class="btn btn-primary"  value="${message(code: 'default.button.save.label', default: 'DAFUQ')}" />--}%
<g:actionSubmit class="btn btn-primary" action="addCandidateQualification"  value="${message(code: 'default.button.save.label', default: 'Save')}" />