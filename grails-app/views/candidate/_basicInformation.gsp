<g:set var="editable" value="${params.action == 'edit' || params.action == 'updateMainDetails' || params.action == 'updatePaymentDetails'}" />

<div class="col-xs-12 text-center">
    <h2 class="bold">${candidateInstance?.firstName + " " + candidateInstance?.lastName }</h2>

    <g:if test="${candidateInstance?.getMainTrade() != null}">
        <h4>${candidateInstance?.getMainTrade()?.qualification?.code}(${candidateInstance?.getMainTrade()?.qualification?.name})</h4>
    </g:if>

    <div class="row">
        <div class="col-xs-12">
            <table class="table text-left">
                <tbody>
                <tr>
                    <td><b>Status</b></td>

                    <g:if test="${candidateInstance?.active}">
                        <td><span class="label label-success">Active</span></td>
                    </g:if>
                    <g:else>
                        <td><span class="label label-danger">Inactive</span></td>
                    </g:else>
                </tr>
                %{--
                <tr>
                    <td>User Rating</td>
                    <td><i class="fa fa-star text-yellow fa-fw"></i><i
                            class="fa fa-star text-yellow fa-fw"></i><i
                            class="fa fa-star text-yellow fa-fw"></i>
                        <i class="fa fa-star  fa-fw"></i><i
                            class="fa fa-star  fa-fw"></i></td>
                </tr>
                --}%
                <tr>
                    <td><b>Member Since</b></td>
                    <td><g:formatDate date="${candidateInstance?.dateCreated}" /> </td>
                </tr>
                <tr>
                    <td><b>Last Updated</b></td>
                    <td><g:formatDate date="${candidateInstance?.lastUpdated}" /> </td>
                </tr>
                <tr>
                    <td><b>Added by</b></td>
                    <td>${candidateInstance?.consultant?.firstName + " " + candidateInstance?.consultant?.lastName}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <g:if test="${editable}">
        <div class="col-xs-12">
            <br/>
            <g:form controller="candidate" method="POST">
                <g:hiddenField name="id" value="${candidateInstance?.id}" />
                <g:actionSubmit class="btn btn-danger btn-sm" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </g:form>
        </div>
        </g:if>
    </div>
</div>
