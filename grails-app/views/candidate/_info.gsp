<div id="displayCandidate">

    <div>
        <h5><b>${CandidateShow.firstName} ${CandidateShow.lastName}</b></h5>

        <br />
        <g:each in="${CandidateShow.candidateQualifications}" var="cq" >

            <g:if test="${cq.isMainTrade = true}" >
                <g:if test="${cq.expiryDate != null}" >
                    <g:if test="${cq.expiryDate.before(new Date())}">
                        <span class="label label-danger">${ "Main Trade " + cq.qualification.name + (cq.number != null ? " " + cq.number : "" )}</span>
                    </g:if>
                    <g:if test="${cq.expiryDate.after(new Date())}">
                        <span class="label label-success">${ "Main Trade " + cq.qualification.name + (cq.number != null ? " " + cq.number : "" )}</span>
                    </g:if>
                </g:if>
                <g:if test="${cq.expiryDate == null}" >
                    <span class="label label-success">${ "Main Trade " + cq.qualification.name + (cq.number != null ? " " + cq.number : "" )}</span>
                </g:if>
            </g:if>
            <g:if test="${cq.isMainTrade = false}" >
                <g:if test="${cq.expiryDate != null}" >
                    <g:if test="${cq.expiryDate.before(new Date())}">
                        <span class="label label-danger">${cq.qualification.name + (cq.number != null ? " " + cq.number : "" )}</span>
                    </g:if>
                    <g:if test="${cq.expiryDate.after(new Date())}">
                        <span class="label label-primary">${cq.qualification.name + (cq.number != null ? " " + cq.number : "" )}</span>
                    </g:if>
                </g:if>
                <g:if test="${cq.expiryDate == null}" >
                    <span class="label label-primary">${cq.qualification.name + (cq.number != null ? " " + cq.number : "" )}</span>
                </g:if>
            </g:if>

        </g:each>

    </div>
    <br />

    <div >

        <div class="box-body">
            <dl>
                <dt>Telephone number</dt>
                <dd>${CandidateShow.telephoneNumber}</dd>
                <dt>Email</dt>
                <dd>${CandidateShow.email}</dd>
                <dt>Address</dt>
                <dd>${CandidateShow.address.details}</dd>

                <dt>Owning Consultant</dt>
                <dd>${CandidateShow.consultant.firstName + " " + CandidateShow.consultant.lastName }</dd>


            </dl>
        </div>

    </div>

</div>