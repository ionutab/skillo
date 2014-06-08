<legend><g:message code="candidate.search.label" /></legend>
<div class="form-group row">
    <div class="col-sm-2">
        <g:textField class="form-control input-sm" name="firstName" placeholder="${message(code: 'candidate.search.firstName.label', default: 'First Name')}" value="${CandidateListFilter?.firstName}"/>
    </div>
    <div class="col-sm-2">
        <g:textField class="form-control input-sm" name="lastName" placeholder="${message(code: 'candidate.search.lastName.label', default: 'Last Name')}" value="${CandidateListFilter?.lastName}" />
    </div>
    <div class="col-sm-2">
        <g:textField class="form-control input-sm" name="telephoneNumber" placeholder="${message(code: 'candidate.search.telephoneNumber.label', default: 'Telephone Nr')}" value="${CandidateListFilter?.telephoneNumber}" />
    </div>
    <div class="col-sm-2">
        <g:textField class="form-control input-sm" name="qualification" placeholder="${message(code: 'candidate.search.candidateQualification.label', default: 'Trade')}" value="${CandidateListFilter?.qualification}" />
    </div>
    <g:submitButton name="list" class="btn btn-primary input-sm small" value="${message(code: 'default.button.search.label')}" />
    <button onclick="candidateSearchFormFunctions.resetForm(this);" type="reset" class="btn btn-info input-sm"><span class="glyphicon glyphicon-refresh"></span></button>
    <button type="button" class="btn btn-info input-sm" data-toggle="button"><span class="glyphicon glyphicon-arrow-down"></span></button>
</div>