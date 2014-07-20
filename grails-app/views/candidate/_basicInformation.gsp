<div class="col-xs-12 text-center">
    <div class="img-thumbnail">
        <g:img dir="images/avatar" file="avatar04.png"/>
    </div>

    <h2 class="bold">${candidateInstance?.firstName + " " + candidateInstance?.lastName }</h2>
    <h4>${candidateInstance?.getMainTrade()?.qualification?.code}(${candidateInstance?.getMainTrade()?.qualification?.name})</h4>

    <div class="col-xs-12">
        <table class="table table-striped">
            <tbody>
            <tr>
                <td>Status</td>

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
                <td>Member Since</td>
                <td><g:formatDate date="${candidateInstance?.dateCreated}" /> </td>
            </tr>
            <tr>
                <td>Last Updated</td>
                <td><g:formatDate date="${candidateInstance?.lastUpdated}" /> </td>
            </tr>
            <tr>
                <td>Added by</td>
                <td>${candidateInstance?.consultant?.firstName + " " + candidateInstance?.consultant?.lastName}</td>
            </tr>
            </tbody>
        </table>
    </div>

</div>