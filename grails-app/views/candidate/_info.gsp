<%@ page import="skillo.Candidate" %>

<div id="displayCandidate">

    <div class="box-header">
        <h3 class="box-title">${CandidateShow.firstName} ${CandidateShow.lastName}</h3>
    </div>
    <div class="box-body">
        <div class="row">
            <div class="col-sm-12">
                <g:link controller="candidate" action="edit" id="${CandidateShow.id}" class="btn btn-sm bg-yellow" ><i class="fa fa-pencil append-icon"></i>Edit</g:link>

                <a class="btn btn-sm bg-yellow" %{--style="position: absolute; top: 5px; right: 5px;"--}%><i
                        class="fa fa-star append-icon"></i> Star</a>
                <a class="btn btn-sm bg-yellow" %{--style="position: absolute; top: 5px; right: 5px;"--}%><i
                        class="fa fa-plus-square append-icon"></i>&nbsp;Add to</a>
                <a class="btn btn-sm bg-yellow" %{--style="position: absolute; top: 5px; right: 5px;"--}%><i
                        class="fa fa-print append-icon"></i>&nbsp;PDF</a>

            </div>

        </div>
        <br/>
        <table class="table">
            <tbody>

                <g:set var="cqMain" value="${CandidateShow.getMainTrade()}" />
                <tr>
                    %{--MAIN TRADE--}%
                    <g:if test="${cqMain?.isExpired()}">
                        <td><p class="text-red"><b>${cqMain?.qualification?.name}</b></p></td>
                        <td><p class="text-red"><b>${cqMain?.number != null ? " " + cqMain?.number : "" }</b></p></td>
                        <td><p class="text-red"><b>${cqMain?.expiryDate != null ? " " + formatDate(date: cqMain?.expiryDate) : ""}</b></p></td>
                    </g:if>
                    <g:elseif test="${CandidateShow.getMainTrade()?.willExpireSoonerThanTwoMonths()}">
                        <td><p class="text-yellow"><b>${cqMain?.qualification?.name}</b></p></td>
                        <td><p class="text-yellow"><b>${cqMain?.number != null ? " " + cqMain?.number : "" }</b></p></td>
                        <td><p class="text-yellow"><b>${cqMain?.expiryDate != null ? " " + formatDate(date: cqMain?.expiryDate) : ""}</b></p></td>
                    </g:elseif>
                    <g:else>
                        <td style="padding: 0px; border-top: none;"><p class=""><b>${cqMain?.qualification?.name}</b></p></td>
                        <td style="padding: 0px; border-top: none;"><p class=""><b>${cqMain?.number != null ? " " + cqMain?.number : "" }</b></p></td>
                        <td style="padding: 0px; border-top: none;"><p class=""><b>${cqMain?.expiryDate != null ? " " + formatDate(date: cqMain?.expiryDate) : ""}</b></p></td>
                    </g:else>
                </tr>

                <g:each in="${CandidateShow.candidateQualifications}" var="cq" >
                    <tr>
                        <g:if test="${cq.isMainTrade == false}" >
                            <g:if test="${cq.isExpired()}">
                                <td style="padding: 0px; border-top: none;"><p class="text-red"><b>${cq?.qualification?.name}</b></p></td>
                                <td style="padding: 0px; border-top: none;"><p class="text-red"><b>${cq?.number != null ? " " + cq?.number : "" }</b></p></td>
                                <td style="padding: 0px; border-top: none;"><p class="text-red"><b>${cq?.expiryDate != null ? " " + formatDate(date: cq?.expiryDate) : ""}</b></p></td>
                            </g:if>
                            <g:elseif test="${cq.willExpireSoonerThanTwoMonths()}">
                                <td style="padding: 0px; border-top: none;"><p class="text-yellow"><b>${cq?.qualification?.name}</b></p></td>
                                <td style="padding: 0px; border-top: none;"><p class="text-yellow"><b>${cq?.number != null ? " " + cq?.number : "" }</b></p></td>
                                <td style="padding: 0px; border-top: none;"><p class="text-yellow"><b>${cq?.expiryDate != null ? " " + formatDate(date: cq?.expiryDate) : ""}</b></p></td>
                            </g:elseif>
                            <g:else>
                                <td style="padding: 0px; border-top: none;"><p class=""><b>${cq?.qualification?.name}</b></p></td>
                                <td style="padding: 0px; border-top: none;"><p class=""><b>${cq?.number != null ? " " + cq?.number : "" }</b></p></td>
                                <td style="padding: 0px; border-top: none;"><p class=""><b>${cq?.expiryDate != null ? " " + formatDate(date: cq?.expiryDate) : ""}</b></p></td>
                            </g:else>
                        </g:if>
                    </tr>
                </g:each>
            </tbody>
        </table>
        <g:if test="${CandidateShow.telephoneNumber != null}">
            <div class="row">
                <div class="col-sm-3">
                    <label><i class="fa fa-phone"></i></label>
                </div>

                <div class="col-sm-9">
                    <p>${CandidateShow.telephoneNumber}</p>
                </div>
            </div>
        </g:if>

        <g:if test="${CandidateShow.email != null}">
            <div class="row">
                <div class="col-sm-3">
                    <label><g:message code="candidate.email.label" />:</label>
                </div>

                <div class="col-sm-9">
                    <p>${CandidateShow.email}</p>
                </div>
            </div>
        </g:if>

        <div class="row">
            <div class="col-sm-3">
                <label><g:message code="candidate.carOwner.label" />:</label>
            </div>

            <div class="col-sm-9">
                <p>${CandidateShow.carOwner == true ? 'Yes' : 'No'}</p>
            </div>
        </div>

        <g:if test="${CandidateShow.birthDate != null}">
            <div class="row">
                <div class="col-sm-3">
                    <label><g:message code="candidate.birthDate.label" />:</label>
                </div>

                <div class="col-sm-3">
                    <p><g:formatDate date="${CandidateShow.birthDate}" /></p>
                </div>

                <div class="col-sm-3">
                    <label><g:message code="candidate.age.label" />:</label>
                </div>

                <div class="col-sm-3">
                    <p>${CandidateShow.age() != null ? CandidateShow.age() : ""}</p>
                </div>
            </div>
        </g:if>

        <div class="row">
            <div class="col-sm-3">
                <label><g:message code="candidate.consultant.label" />:</label>
            </div>

            <div class="col-sm-9">
                <p>${CandidateShow.consultant?.firstName + ' ' + CandidateShow.consultant?.lastName }</p>
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
    </div>
</div>