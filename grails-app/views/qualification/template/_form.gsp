<%@ page import="skillo.Qualification"%>
<legend><g:message code="candidateQualification.form.basicInfo" /></legend>
<div class="form-group  ${hasErrors(bean: qualificationInstance, field: 'code', 'has-error')} ">
    <label for="code" class="col-sm-4 control-label">
        <g:message code="qualification.code.label" default="Code" />
    </label>
    <div class="col-sm-6">
        <g:textField name="code" class="form-control" value="${qualificationInstance?.code}" />
    </div>
</div>
<div class="form-group  ${hasErrors(bean: qualificationInstance, field: 'name', 'has-error')} ">
    <label for="name" class="col-sm-4 control-label">
        <g:message code="qualification.name.label" default="Name" />
    </label>
    <div class="col-sm-6">
        <g:textField name="name" class="form-control" value="${qualificationInstance?.name}" />
    </div>
</div>
<div class="form-group  ${hasErrors(bean: qualificationInstance, field: 'description', 'has-error')} ">
    <label for="description" class="col-sm-4 control-label">
        <g:message code="qualification.description.label" default="Description" />
    </label>
    <div class="col-sm-6">
        <g:textArea name="description" class="form-control" value="${qualificationInstance?.description}" />
    </div>
</div>
<div class="form-group  ${hasErrors(bean: qualificationInstance, field: 'canBeMainTrade', 'has-error')} ">
    <label for="canBeMainTrade" class="col-sm-4 control-label">
        <g:message code="qualification.mainTrade.label" default="Main Trade" />
    </label>
    <div class="col-sm-6">
        <g:radioGroup name="canBeMainTrade"
                      labels="['True','False']"
                      values="['true', 'false']"
                      value="${qualificationInstance?.canBeMainTrade}">
            ${it.label} ${it.radio}
        </g:radioGroup>
    </div>
</div>