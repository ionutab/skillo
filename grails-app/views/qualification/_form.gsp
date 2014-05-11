<%@ page import="skillo.Qualification"%>
<legend><g:message code="candidateQualification.form.basicInfo" /></legend>
<div class="form-group  ${hasErrors(bean: qualificationInstance, field: 'code', 'has-error')} ">
    <label for="qualification.code" class="col-sm-4 control-label">
        <g:message code="qualification.code.label" default="Code" />
    </label>
    <div class="col-sm-6">
        <g:textField name="qualification.code" class="form-control" value="${qualificationInstance?.code}" />
    </div>
</div>
<div class="form-group  ${hasErrors(bean: qualificationInstance, field: 'name', 'has-error')} ">
    <label for="qualification.name" class="col-sm-4 control-label">
        <g:message code="qualification.name.label" default="Name" />
    </label>
    <div class="col-sm-6">
        <g:textField name="qualification.name" class="form-control" value="${qualificationInstance?.name}" />
    </div>
</div>
<div class="form-group  ${hasErrors(bean: qualificationInstance, field: 'description', 'has-error')} ">
    <label for="qualification.description" class="col-sm-4 control-label">
        <g:message code="qualification.description.label" default="Description" />
    </label>
    <div class="col-sm-6">
        <g:textArea name="qualification.description" class="form-control" value="${qualificationInstance?.description}" />
    </div>
</div>
<div class="form-group  ${hasErrors(bean: qualificationInstance, field: 'canBeMainTrade', 'has-error')} ">
    <label for="qualification.canBeMainTrade" class="col-sm-4 control-label">
        <g:message code="qualification.mainTrade.label" default="Main Trade" />
    </label>
    <div class="col-sm-6">
        <g:radioGroup name="qualification.canBeMainTrade"
                      labels="['True','False']"
                      values="['true', 'false']"
                      value="${qualificationInstance?.canBeMainTrade}">
            ${it.label} ${it.radio}
        </g:radioGroup>
    </div>
</div>