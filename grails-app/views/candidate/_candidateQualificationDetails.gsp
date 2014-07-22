<g:set var="editable"
       value="${params.action == 'edit' || params.action == 'updateMainDetails' || params.action == 'updatePaymentDetails'}"/>
<g:set var="cq" value="${candidateInstance.candidateQualifications}"/>
<g:set var="cqMain" value="${candidateInstance.getMainTrade()}"/>
<div class="col-md-12">
    <div class="box box-solid">
        <div class="box-body">
            <div class="row">
                <div class="col-md-12 col-sm-12">

                    <g:if test="${cq == null || cq.size() <= 0}">

                        <div class="col-md-12 col-lg-offset-2 page-background-info">
                            <h2><g:message code="qualification.display.notFound.label"/></h2>
                        </div>

                    </g:if>
                    <g:else>

                        <table class="table">
                            <thead>
                            <tr>

                                <th><g:message code="qualification.code.label" default="Code"></g:message>
                                <th><g:message code="qualification.status.label" default="Status"></g:message>
                                <th><g:message code="qualification.name.label" default="Name"></g:message>
                                <th><g:message code="candidateQualification.number.label" default="Number"></g:message>
                                <th><g:message code="qualification.expiryDate.label" default="Expiry Date"/></th>
                                <g:if test="${editable}">
                                    <th><g:message code="default.actions.label" default="Actions"/></th>
                                </g:if>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <b>${cqMain.qualification.code}</b>
                                </td>
                                <g:if test="${cqMain.isExpired()}">
                                    <td><p class="text-red"><b>Expired</b></p></td>
                                </g:if>
                                <g:elseif test="${cqMain.willExpireSoonerThanTwoMonths()}">
                                    <td><p class="text-yellow"><b>Will Expire</b></p></td>
                                </g:elseif>
                                <g:else>
                                    <td><p class="text-green"><b>Active</b></p></td>
                                </g:else>
                                <td>
                                    <b>${cqMain.qualification.name}</b>
                                </td>
                                <td>
                                    <b>${cqMain.number}</b>
                                </td>
                                <td>
                                    <b><g:formatDate date="${cqMain.expiryDate}"/></b>
                                </td>
                                <g:if test="${editable}">
                                    <td>
                                        <button class="btn btn-sm bg-yellow"><i
                                                class="fa fa-pencil append-icon"></i>&nbsp;Edit</button>
                                    </td>
                                </g:if>
                            </tr>
                            <g:each in="${candidateInstance.candidateQualifications}" status="i" var="cq">
                                <g:if test="${cq.isMainTrade == false}">
                                    <tr>
                                        <td>
                                            ${cq.qualification.code}
                                        </td>
                                        <g:if test="${cq.isExpired()}">
                                            <td><p class="text-red"><b>Expired</b></p></td>
                                        </g:if>
                                        <g:elseif test="${cq.willExpireSoonerThanTwoMonths()}">
                                            <td><p class="text-yellow"><b>Will Expire</b></p></td>
                                        </g:elseif>
                                        <g:else>
                                            <td><p class="text-green"><b>Active</b></p></td>
                                        </g:else>
                                        <td>
                                            ${cq.qualification.name}
                                        </td>
                                        <td>
                                            ${cq.number}
                                        </td>
                                        <td>
                                            <g:formatDate date="${cq.expiryDate}"/>
                                        </td>
                                        <g:if test="${editable}">
                                            <td>
                                                <button class="btn btn-sm bg-yellow"><i
                                                        class="fa fa-pencil append-icon"></i>&nbsp;Edit</button>
                                            </td>
                                        </g:if>
                                    </tr>
                                </g:if>
                            </g:each>
                            </tbody>
                        </table>

                    </g:else>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <g:if test="${editable}">
                        <button class="btn btn-info btn-sm" data-toggle="modal"
                                data-target="#newCandidateQualificationModal" id="addQualification"><i
                                class="fa fa-plus "></i></button>
                        <g:javascript>
                            $("#addQualification").click(function (event) {
                                event.preventDefault();
                            });
                        </g:javascript>
                    </g:if>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="newCandidateQualificationModal" role="dialog" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog">
        <g:form
                method="post"
                class="form-horizontal"
                id="newCandidateQualificationForm"
                name="newCandidateQualificationForm"
                url="[controller: 'candidate', action: 'addCandidateQualification']"
                after="">
            <g:hiddenField name="id" value="${candidateInstance?.id}"/>
            <div class="modal-content">
                <div class="modal-body">
                    <g:render template="/candidate/candidateQualificationsForm" bean="${newCandidateQualification}"/>
                </div>

                <div class="modal-footer">
                    <g:submitButton class="btn btn-primary btn-sm"
                                    name="${message(code: 'default.button.save.label', default: 'Save')}"
                                    update="newCandidateQualificationForm"/>
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                </div>
            </div>
        </g:form>
    </div>
</div>
