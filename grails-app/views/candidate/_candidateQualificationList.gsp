<%@ page import="skillo.candidate.CandidateQualification; skillo.candidate.Candidate" %>

<g:set var="editable" value="${params.action == 'edit' || params.action == 'updateMainDetails' || params.action == 'updatePaymentDetails'}"/>
<g:set var="cq" value="${candidateInstance.candidateQualifications}"/>
<g:set var="cqMain" value="${candidateInstance.getMainTrade()}"/>

<div class="col-md-12">
    <div class="box box-solid">
        <div class="box-header">
            <div class="col-md-12 col-sm-12">
                <span>Candidate Qualification Details</span>
            </div>
        </div>
        <div class="box-body">
            <div class="row">
                <div class="col-md-12 col-sm-12">

                    <g:if test="${cq == null || cq.size() <= 0}">

                        <div class="col-md-12 col-lg-offset-2 page-background-info">
                            <h2><g:message code="candidateQualification.display.notFound.label"/></h2>
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
                            <g:if test="${cqMain != null}">
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
                                            <g:remoteLink controller="candidate"
                                                          action="getEditCandidateQualification" id="${cqMain.id}"
                                                          elementId="${cqMain.id}"
                                                          update="editCandidateQualificationContainer"
                                                          onComplete ="showEditCandidateQualification()"
                                                          class="btn btn-sm bg-yellow"><i class="fa fa-pencil append-icon"></i>&nbsp;Edit</g:remoteLink>
                                        </td>
                                    </g:if>
                                </tr>
                            </g:if>
                            <g:each in="${candidateInstance.candidateQualifications}" status="i" var="cq">
                                <g:if test="${!cq.isMainTrade && cq.active}">
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
                                                <g:remoteLink controller="candidate"
                                                              action="getEditCandidateQualification" id="${cq.id}"
                                                              elementId="${cq.id}"
                                                              update="editCandidateQualificationContainer"
                                                              onComplete ="showEditCandidateQualification()"
                                                              class="btn btn-sm bg-yellow"><i class="fa fa-pencil append-icon"></i>&nbsp;Edit</g:remoteLink>
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

            <g:javascript>

                function showEditCandidateQualification(){
                    $('#editCandidateQualificationModal').modal({
                        show: true
                    });
                    $("#editCandidateQualificationExpiryDate").inputmask("d/m/y", { "placeholder": "dd/mm/yyyy" });
                    $('#editCandidateQualificationContainer').find('input').iCheck({
                        checkboxClass: 'icheckbox_flat-blue',
                        radioClass: 'iradio_flat-blue'
                    });
                }


            </g:javascript>

            <div class="row">
                <div class="col-md-6">
                    <g:if test="${editable}">
                        <button class="btn btn-info btn-sm" data-toggle="modal"
                                data-target="#createCandidateQualificationModal" id="addQualification"><i
                                class="fa fa-plus "></i>&nbsp;Add Candidate Qualification</button>
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

<div class="modal fade" id="createCandidateQualificationModal" role="dialog" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog">
        <g:form
                method="post"
                class="form-horizontal"
                id="createCandidateQualificationForm"
                name="createCandidateQualificationForm"
                url="[controller: 'candidate', action: 'addCandidateQualification']"
                after="">

            <g:hiddenField name="id" value="${candidateInstance?.id}"/>
            <div class="modal-content">
                <div class="modal-body">
                    <div id="createCandidateQualificationFormContainer">
                        <g:render template="createCandidateQualificationForm" />
                    </div>
                </div>
                <div class="modal-footer text-left">
                    %{--

                    <g:javascript>
                        function renderEditCandidateQualification(){

                            function formatCandidateQualification(item) { return item.name; };
                            $("#newCandidateQualificationId").select2({
                                    data: {results:${availableQualifications}, text:'name'},
                                    formatSelection: formatCandidateQualification,
                                    formatResult: formatCandidateQualification,
                                    placeholder: "Select a Qualification",
                                    allowClear:true
                                }
                            );
                            $("#newCandidateQualificationExpiryDate").inputmask("d/m/y", { "placeholder": "dd/mm/yyyy" });
                            $('#createCandidateQualificationFormContainer').find('input').iCheck({
                                checkboxClass: 'icheckbox_flat-blue',
                                radioClass: 'iradio_flat-blue'
                            });
                        }
                    </g:javascript>

                    <g:submitToRemote
                            url="[controller: 'candidate', action: 'addCandidateQualification']"
                            class="btn btn-primary btn-sm"
                            name="${message(code: 'default.button.save.label', default: 'Save')}"
                            value="${message(code: 'default.button.save.label', default: 'Save')}"
                            update="createCandidateQualificationFormContainer" onComplete="renderEditCandidateQualification()" />
                    --}%
                    <div class="text-left">
                        <g:submitButton class="btn btn-primary btn-sm"
                                        name="${message(code: 'default.button.save.label', default: 'Save')}"
                                        update="newCandidateQualificationForm" />
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </g:form>
    </div>
</div>


<div id="editCandidateQualificationContainer">
    <g:render template="editCandidateQualificationModal" />
</div>