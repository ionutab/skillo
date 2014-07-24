<%@ page import="skillo.Candidate" %>

<div id="displayCandidate">

    <div class="box-header">
        <h3 class="box-title">${CandidateShow.firstName} ${CandidateShow.lastName}</h3>
    </div>
    <div class="box-body">
        <div class="row">
            <div class="col-sm-12">
                <g:link controller="candidate" action="edit" id="${CandidateShow.id}" class="btn btn-sm bg-yellow" ><i class="fa fa-pencil append-icon"></i>&nbsp;Edit</g:link>
                <g:link controller="candidate" action="show" id="${CandidateShow.id}" class="btn btn-sm bg-yellow" ><i class="fa fa-eye append-icon"></i>&nbsp;Show</g:link>
%{--

                <a class="btn btn-sm bg-yellow" --}%
%{--style="position: absolute; top: 5px; right: 5px;"--}%%{--
><i
                        class="fa fa-star append-icon"></i> Star</a>
                <a class="btn btn-sm bg-yellow" --}%
%{--style="position: absolute; top: 5px; right: 5px;"--}%%{--
><i
                        class="fa fa-plus-square append-icon"></i>&nbsp;Add to</a>
                <a class="btn btn-sm bg-yellow" --}%
%{--style="position: absolute; top: 5px; right: 5px;"--}%%{--
><i
                        class="fa fa-print append-icon"></i>&nbsp;PDF</a>
--}%

            </div>

        </div>
        <br/>
        <table class="table compact">
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
                        <td><p class=""><b>${cqMain?.qualification?.name}</b></p></td>
                        <td><p class=""><b>${cqMain?.number != null ? " " + cqMain?.number : "" }</b></p></td>
                        <td style="padding: 0px; border-top: none;"><p class=""><b>${cqMain?.expiryDate != null ? " " + formatDate(date: cqMain?.expiryDate) : ""}</b></p></td>
                    </g:else>
                </tr>

                <g:each in="${CandidateShow.candidateQualifications}" var="cq" >
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

        <g:each in="${CandidateShow.candidateNotes}" var="cnote">
            <div class="callout callout-main-details callout-info" >
                <p><b><g:formatDate date="${cnote.note.date}" />&nbsp;${cnote.consultant.firstName + " " + cnote.consultant.lastName}</b></p>
                <p>${cnote.note.note}</p>
            </div>
        </g:each>
    </div>
</div>