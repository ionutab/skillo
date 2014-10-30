<%@ page import="skillo.candidate.Candidate" %>
<g:if test="${candidateShow}">
<div id="displayCandidate">
    <div class="box box-solid">

        <div class="box-header">
            <h3 class="box-title">${candidateShow.firstName} ${candidateShow.lastName}</h3>
        </div>
        <div class="box-body">
            <div class="row">
                <div class="col-sm-12">
                    <g:link controller="candidate" action="edit" id="${candidateShow.id}" class="btn btn-sm bg-yellow" ><i class="fa fa-pencil append-icon"></i>&nbsp;Edit</g:link>
                    <g:link controller="candidate" action="show" id="${candidateShow.id}" class="btn btn-sm bg-yellow" ><i class="fa fa-eye append-icon"></i>&nbsp;Show</g:link>
                    <button class="btn btn-info btn-sm" data-toggle="modal"
                            data-target="#createCandidateNoteModal" id="addCandidateNote">
                        <i class="fa fa-plus "></i>&nbsp;Note</button>
                    <g:javascript>
                        $("#addCandidateNote").click(function (event) {
                            event.preventDefault();
                        });
                    </g:javascript>

                </div>

            </div>
            <br/>
            <table class="table compact">
                <tbody>

                    <g:set var="cqMain" value="${candidateShow.getMainTrade()}" />
                    <tr>
                    %{--MAIN TRADE--}%
                        <g:if test="${cqMain?.isExpired()}">
                            <td><p class="text-red"><b>${cqMain?.qualification?.name}</b></p></td>
                            <td><p class="text-red"><b>${cqMain?.number != null ? " " + cqMain?.number : "" }</b></p></td>
                            <td><p class="text-red"><b>${cqMain?.expiryDate != null ? " " + formatDate(date: cqMain?.expiryDate) : ""}</b></p></td>
                        </g:if>
                        <g:elseif test="${candidateShow.getMainTrade()?.willExpireSoonerThanTwoMonths()}">
                            <td><p class="text-yellow"><b>${cqMain?.qualification?.name}</b></p></td>
                            <td><p class="text-yellow"><b>${cqMain?.number != null ? " " + cqMain?.number : "" }</b></p></td>
                            <td><p class="text-yellow"><b>${cqMain?.expiryDate != null ? " " + formatDate(date: cqMain?.expiryDate) : ""}</b></p></td>
                        </g:elseif>
                        <g:else>
                            <td><p class=""><b>${cqMain?.qualification?.name}</b></p></td>
                            <td><p class=""><b>${cqMain?.number != null ? " " + cqMain?.number : "" }</b></p></td>
                            <td style="padding: 0px; border-top: none;"><p class=""><b>${cqMain?.expiryDate != null ? " " + formatDate(date: cqMain?.expiryDate) : ""}</b></p></td>
                        </g:else>
                    </tr>

                    <g:each in="${candidateShow.candidateQualifications}" var="cq" >
                        <g:if test="${!cq.isMainTrade && cq.active}" >
                            <tr>
                                <g:if test="${cq.isExpired()}">
                                    <td><p class="text-red">${cq?.qualification?.name}</p></td>
                                    <td><p class="text-red">${cq?.number != null ? " " + cq?.number : "" }</p></td>
                                    <td><p class="text-red">${cq?.expiryDate != null ? " " + formatDate(date: cq?.expiryDate) : ""}</p></td>
                                </g:if>
                                <g:elseif test="${cq.willExpireSoonerThanTwoMonths()}">
                                    <td><p class="text-yellow">${cq?.qualification?.name}</p></td>
                                    <td><p class="text-yellow">${cq?.number != null ? " " + cq?.number : "" }</p></td>
                                    <td><p class="text-yellow">${cq?.expiryDate != null ? " " + formatDate(date: cq?.expiryDate) : ""}</p></td>
                                </g:elseif>
                                <g:else>
                                    <td><p class="">${cq?.qualification?.name}</p></td>
                                    <td><p class="">${cq?.number != null ? " " + cq?.number : "" }</p></td>
                                    <td><p class="">${cq?.expiryDate != null ? " " + formatDate(date: cq?.expiryDate) : ""}</p></td>
                                </g:else>
                            </tr>
                        </g:if>
                    </g:each>
                </tbody>
            </table>
            <g:if test="${candidateShow.telephoneNumber != null}">
                <div class="row">
                    <div class="col-sm-3">
                        <label><i class="fa fa-phone"></i></label>
                    </div>

                    <div class="col-sm-9">
                        <p>${candidateShow.telephoneNumber}</p>
                    </div>
                </div>
            </g:if>

            <g:if test="${candidateShow.email != null}">
                <div class="row">
                    <div class="col-sm-3">
                        <label><g:message code="candidate.email.label" />:</label>
                    </div>

                    <div class="col-sm-9">
                        <p>${candidateShow.email}</p>
                    </div>
                </div>
            </g:if>

            <div class="row">
                <div class="col-sm-3">
                    <label><g:message code="candidate.carOwner.label" />:</label>
                </div>

                <div class="col-sm-9">
                    <p>${candidateShow.carOwner == true ? 'Yes' : 'No'}</p>
                </div>
            </div>

            <g:if test="${candidateShow.birthDate != null}">
                <div class="row">
                    <div class="col-sm-3">
                        <label><g:message code="candidate.birthDate.label" />:</label>
                    </div>

                    <div class="col-sm-3">
                        <p><g:formatDate date="${candidateShow.birthDate}" /></p>
                    </div>

                    <div class="col-sm-3">
                        <label><g:message code="candidate.age.label" />:</label>
                    </div>

                    <div class="col-sm-3">
                        <p>${candidateShow.age() != null ? candidateShow.age() : ""}</p>
                    </div>
                </div>
            </g:if>

            <g:if test="${candidateShow.nationality != null}">
                <div class="row">
                    <div class="col-sm-3">
                        <label><g:message code="candidate.nationality.label" />:</label>
                    </div>

                    <div class="col-sm-3">
                        <p><g:message code="${candidateShow.nationality.nationality}" /></p>
                    </div>
                </div>
            </g:if>

            <div class="row">
                <div class="col-sm-3">
                    <label><g:message code="candidate.consultant.label" />:</label>
                </div>

                <div class="col-sm-9">
                    <p>${candidateShow.consultant?.firstName + ' ' + candidateShow.consultant?.lastName }</p>
                </div>
            </div>
        %{--
        <div class="row">
            <div class="col-sm-3">
                <label>Rating</label>
            </div>

            <div class="col-sm-9">
                <i class="fa fa-star text-yellow fa-fw"></i>
                <i class="fa fa-star text-success fa-fw"></i>
                <i class="fa fa-star text-green fa-fw"></i>
                <i class="fa fa-star vd_yellow fa-fw"></i>
                <i class="fa fa-star vd_yellow fa-fw"></i>
            </td>

            </div>
        </div>
        --}%

            <g:each in="${candidateShow.candidateNotes}" var="cnote">
                <div class="callout callout-main-details callout-info" >
                    <p><b><g:formatDate date="${cnote.note.date}" />&nbsp;${cnote.consultant.firstName + " " + cnote.consultant.lastName}</b></p>
                    <p>${cnote.note.note}</p>
                </div>
            </g:each>
        </div>
    </div>

    <g:render template="/candidate/createCandidateNoteModal" model="['redirect':'list','candidateInstance':candidateShow,'newCandidateNote':newCandidateNote]" />
</div>
</g:if>

