<div class="table-responsive">
    <table class="table table-striped">
        <thead>
        <tr>

            <g:sortableColumn property="firstName" title="${message(code: 'candidate.fullName.label', default: 'Full Name')}"/>
            <th><g:message code="candidate.telephoneNumber.label" default="Telephone Number"/></th>
            <th><g:message code="address.details.label" default="Address"/></th>
            <th><g:message code="address.postcode.label" default="Post Code"/></th>
            <th><g:message code="candidate.mainTrade.label" default="Main Trade"/></th>
            <th><g:message code="default.actions.label" /></th>
            %{--<th><g:message code="default.actions.label" default="Actions"/></th>--}%

        </tr>
        </thead>
        <tbody>
        <g:each in="${CandidateList}" status="i" var="Candidate">
            <tr>
                <td >
                    %{--<g:link action="show" data-placement="right" id="${Candidate.id}"
                            elementId="${Candidate.id}">${Candidate.firstName}</g:link>--}%
                    <g:remoteLink action="display" id="${Candidate.id}" elementId="${Candidate.id}" update="displayCandidate">${Candidate.firstName} ${Candidate.lastName}</g:remoteLink>
%{--                    <g:link url="#" class="popable" data-placement="right" data-trigger="click" elementId="${Candidate.id}">${Candidate.lastName}</g:link>--}%
                    <div id="popover_content_wrapper_${Candidate.id}" style="display: none">
                        <div>
                            <p><b><g:message code="candidate.owningConsultant.label"/>:</b> ${Candidate.consultant?.firstName} ${Candidate.consultant?.lastName}</p>

                            <p><b><g:message code="candidate.email.label"/>:</b> ${Candidate.email}</p>

                            <p><b><g:message code="candidate.driver.label"/>:</b> ${Candidate.driver}</p>

                            <p><b><g:message code="candidate.carOwner.label"/>:</b> ${Candidate.carOwner}</p>
                        </div>
                    </div>
                </td>
                <td>
                    ${Candidate?.telephoneNumber}
                </td>
                <td>
                    ${Candidate?.address?.details}
                </td>
                <td>
                    ${Candidate?.address?.postCode?.code}
                </td>
                <td>
                    <g:if test="${Candidate.candidateQualifications != null && Candidate.candidateQualifications.size() > 0}">
                        <g:each in="${Candidate.candidateQualifications}" var="cq">
                            <g:if test="${cq.isMainTrade}">
                                ${cq.qualification?.name}
                            </g:if>
                        </g:each>
                    </g:if>
                </td>
                <td>
                    <g:link controller="candidate" action="edit" id="${Candidate?.id}" class="btn btn-small" ><g:message code="default.button.edit.label" default="Edit" /></g:link>
                </td>
                %{--<td>
                    <g:link action="edit" id="${Candidate.id}" class="btn btn-small"><g:message
                            code="default.edit.label" args=" "/></g:link>
                </td>--}%
            </tr>
        </g:each>
        </tbody>
    </table>
</div>