<g:set var="editable" value="${params.action == 'edit' || params.action == 'updateMainDetails' || params.action == 'updatePaymentDetails'}" />

<div class="col-xs-12 text-center">
    <div class="img-thumbnail">
        <g:img dir="images/avatar" file="nophoto.png"/>
    </div>
    <g:uploadForm controller="candidate" action="upload" enctype="multipart/form-data" method="POST">
    </g:uploadForm>
    <h2 class="bold">${candidateInstance?.firstName + " " + candidateInstance?.lastName }</h2>

    <g:if test="${candidateInstance?.getMainTrade() != null}">
        <h4>${candidateInstance?.getMainTrade()?.qualification?.code}(${candidateInstance?.getMainTrade()?.qualification?.name})</h4>
    </g:if>

    <div class="row">
        <div class="col-xs-12">
            <table class="table">
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


<div class="row">
    <div class="col-xs-12">

        <div class="box box-solid">
            <div class="box-body">
                <div class="row">
                    <ul class="timeline">

                        <!-- timeline time label -->
                        <li class="time-label">
                            <span class="bg-green">
                                10 Feb. 2014
                            </span>
                        </li>
                        <!-- /.timeline-label -->

                        <!-- timeline item -->
                        <li>
                            <!-- timeline icon -->
                            <i class="fa fa-plus bg-blue"></i>

                            <div class="timeline-item">
                                <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

                                <h3 class="timeline-header"> Andrei Ene have been added by Katie ...</h3>


                            </div>
                        </li>

                        <li class="time-label">
                            <span class="bg-green">
                                10 Feb. 2014
                            </span>
                        </li>
                        <!-- /.timeline-label -->

                        <!-- timeline item -->
                        <li>
                            <!-- timeline icon -->
                            <i class="fa fa-edit bg-blue"></i>

                            <div class="timeline-item">
                                <span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>

                                <h3 class="timeline-header"> Andrei Ene   have been modified by Will ...</h3>

                                <div class="timeline-body">
                                    <ul>
                                        <li>
                                            changed birth date from "14-08-1988" to "15-08-1988"
                                        </li>
                                    </ul>
                                </div>

                            </div>
                        </li>

                        <li class="time-label">
                            <span class="bg-green">
                                10 Feb. 2014
                            </span>
                        </li>

                        <li>
                            <!-- timeline icon -->
                            <i class="fa fa-edit bg-blue"></i>

                            <div class="timeline-item">
                                <span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>

                                <h3 class="timeline-header"> Andrei Ene   have been modified by Mary ...</h3>

                                <div class="timeline-body">
                                    <ul>
                                        <li>
                                            programmer qualification was added
                                        </li>
                                    </ul>
                                </div>

                            </div>
                        </li>

                        <li class="time-label">
                            <span class="bg-green">
                                10 Feb. 2014
                            </span>
                        </li>

                        <li>
                            <!-- timeline icon -->
                            <i class="fa fa-trash-o bg-blue"></i>

                            <div class="timeline-item">
                                <span class="time"><i class="fa fa-clock-o"></i> just now</span>

                                <h3 class="timeline-header"> Andrei Ene   have been removed by Tom ...</h3>

                                <div class="timeline-body">
                                </div>

                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
        <a class="btn btn-block bg-light-blue">
            Show more
        </a>
    </div>
</div>