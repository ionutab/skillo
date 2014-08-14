<g:set var="editable"
       value="${params.action == 'edit' || params.action == 'updateMainDetails' || params.action == 'updatePaymentDetails'}"/>

<div class="col-md-12">
    <div class="box box-solid">
        <div class="box-header">
            <div class="box-header">
                <div class="col-md-12 col-sm-12">
                    <span>Next of kin details</span>
                </div>
            </div>
            <g:if test="${!editable}">
                <div class="box-tools pull-right">
                    <g:link controller="candidate" action="edit" id="${candidateInstance?.id}"
                            class="btn btn-sm bg-yellow"><i class="fa fa-pencil append-icon"></i>Edit</g:link>
                </div>
            </g:if>
        </div>

        <div class="box-body">
            <g:form controller="candidate" action="updateMainDetails" class="form-horizontal" autocomplete="off">
                <g:hiddenField name="id" value="${candidateInstance?.id}"/>
                <g:hiddenField name="candidate.currentVersion" value="${candidateInstance?.version}"/>
                <div class="row">
                    <div class="col-md-6"></div>

                    <div class="col-md-6"></div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <g:if test="${editable}">
                            <g:actionSubmit class="btn btn-primary" action="updateMainDetails"
                                            value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                            <g:link controller="candidate" action="list" class="btn btn-default"
                                    name="Cancel">Cancel</g:link>
                        </g:if>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>