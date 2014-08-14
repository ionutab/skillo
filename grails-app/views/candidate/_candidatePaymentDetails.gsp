<g:set var="editable" value="${params.action == 'edit' || params.action == 'updateMainDetails' || params.action == 'updatePaymentDetails'}" />

<div class="col-md-12">
    <div class="box box-solid">
    <div class="box-header">
        <g:if test="${!editable}">
            <div class="box-tools pull-right">
                <g:link controller="candidate" action="edit" id="${candidateInstance?.id}" class="btn btn-sm bg-yellow"><i class="fa fa-pencil append-icon"></i>Edit</g:link>
            </div>
        </g:if>
    </div>

    <div class="box-body">
        <g:form controller="candidate" action="updatePaymentDetails" class="form-horizontal" autocomplete="off">

            <g:hiddenField name="id" value="${candidateInstance?.id}" />
            <g:hiddenField name="candidate.currentVersion" value="${candidateInstance?.version}" />

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="payroll.payrollCompany.id" class="col-md-3 control-label">
                            <g:message code="payroll.payrollCompany.short.label" default="Payroll Company"/>
                        </label>

                        <div class="col-sm-9">
                            <g:if test="${editable}">
                                <g:render template="../payrollCompany/payrollCompanySelectorInput"
                                          model="['attributeName':'payroll.payrollCompany.id',
                                                 'attributeId':'payrollCompanyId',
                                                 'payrollCompany':candidateInstance?.payroll?.payrollCompany,
                                                 'availablePayrollCompanies':availablePayrollCompanies]"
                                />
                            </g:if>
                            <g:else>
                                <g:if test="${candidateInstance?.payroll?.payrollCompany == null}">
                                    <label class="control-label">No payroll company selected</label>
                                </g:if>
                                <g:else>
                                    <label class="control-label">${candidateInstance?.payroll?.payrollCompany?.name}</label>
                                </g:else>
                            </g:else>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="payroll.referenceNumber"
                               class="col-md-3 control-label">
                            <g:message code="payroll.reference.number.short.label" default="Ref No"/>
                        </label>

                        <div class="col-sm-9">
                            <g:textField name="payroll.referenceNumber" value="${candidateInstance?.payroll?.referenceNumber}" class="form-control" disabled="${!editable}" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="payroll.registrationNumber" class="col-md-3 control-label">
                            <g:message code="payroll.registration.number.short.label" default="Registration Nr."/>
                        </label>
                        <div class="col-sm-9">
                            <g:textField name="payroll.registrationNumber" value="${candidateInstance?.payroll?.registrationNumber}" class="form-control" disabled="${!editable}" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="payroll.uniqueTaxReferenceNumber" class="col-md-3 control-label">
                            <g:message code="payroll.unique.tax.reference.number.short.label" default="Unique Tax Reference Nr."/>
                        </label>
                        <div class="col-sm-9">
                            <g:textField id="payrollUniqueTaxReferenceNumber" name="payroll.uniqueTaxReferenceNumber" class="form-control" value="${candidateInstance?.payroll?.uniqueTaxReferenceNumber}" disabled="${!editable}" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="payroll.nationalInsuranceNumber" class="col-md-3 control-label">
                            <g:message code="payroll.national.insurance.number.short.label" default="Payroll Company"/>
                        </label>
                        <div class="col-sm-9">
                            <g:textField id="payrollNationalInsuranceNumber" name="payroll.nationalInsuranceNumber" class="form-control" value="${candidateInstance?.payroll?.nationalInsuranceNumber}" disabled="${!editable}" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="payroll.sortCode" class="col-md-3 control-label">
                            <g:message code="payroll.sortCode.label" default="Sort Code"/>
                        </label>
                        <div class="col-sm-9">
                            <g:textField id="payrollSortCode" name="payroll.sortCode" class="form-control" value="${candidateInstance?.payroll?.sortCode}" disabled="${!editable}" />
                            <g:javascript>
                                $("#payrollSortCode").inputmask("${message( code:'default.sortCode.inputMask')}", {"placeholder":"${message( code:'default.sortCode.placeHolder')}"});
                            </g:javascript>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="payroll.nationalInsuranceNumber" class="col-md-3 control-label">
                            <g:message code="payroll.accountNumber.label" default="Payroll Company"/>
                        </label>
                        <div class="col-sm-9">
                            <g:textField id="payrollAccountNumber" name="payroll.accountNumber" class="form-control" value="${candidateInstance?.payroll?.accountNumber}" disabled="${!editable}" />
                            <g:javascript>
                                $("#payrollAccountNumber").inputmask("${message( code:'default.accNo.inputMask')}", {"placeholder":"${message( code:'default.accNo.placeHolder')}"});
                            </g:javascript>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="payroll.registered" class="col-md-3 control-label">Registered</label>

                        <div class="col-md-9" aria-checked="true" aria-disabled="true">

                            <g:if test="${editable}">
                                <g:radioGroup values="[true, false]" labels="['yes', 'no']" name="payroll.registered" value="${candidateInstance?.payroll != null ? candidateInstance?.payroll?.registered : false}" >
                                    <label class="control-label">
                                        ${it.radio}&nbsp;${it.label}
                                    </label>
                                    &nbsp;
                                </g:radioGroup>
                            </g:if>
                            <g:else>
                                <label class="control-label">${candidateInstance?.payroll?.registered ? "yes" : "no"}</label>
                            </g:else>

                        </div>
                    </div>

                    <div class="form-group">
                        <label for="payroll.inducted" class="col-md-3 control-label">Inducted</label>
                        <div class="col-md-9" aria-checked="true" aria-disabled="true">
                            <g:if test="${editable}">
                                <g:radioGroup values="[true, false]" labels="['yes', 'no']" name="payroll.inducted" value="${candidateInstance?.payroll != null ? candidateInstance?.payroll?.inducted : false}" >
                                    <label class="control-label">
                                        ${it.radio}&nbsp;${it.label}
                                    </label>
                                    &nbsp;
                                </g:radioGroup>
                            </g:if>
                            <g:else>
                                <label class="control-label">${candidateInstance?.payroll?.inducted ? "yes" : "no"}</label>
                            </g:else>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <g:if test="${editable}">
                        <g:actionSubmit class="btn btn-primary" action="updatePaymentDetails" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                        <g:link controller="candidate" action="list" class="btn btn-default" name="Cancel">Cancel</g:link>
                    </g:if>
                </div>
            </div>
        </g:form>
    </div>
</div>

</div><!-- /.col=md-12 -->

