<div id="displayCandidate">

    <div>
        <h5><b>${CandidateShow.firstName} ${CandidateShow.lastName}</b></h5>

        <g:each in="${CandidateShow.candidateQualifications}" var="CandidateQualification" >


        </g:each>

    </div>


    <div>



    </div>


    <div >

        <div class="box-body">
            <dl>
                <dt>Telephone number</dt>
                <dd>${CandidateShow.telephoneNumber}</dd>
                <dt>Email</dt>
                <dd>${CandidateShow.email}</dd>
                <dt>Address</dt>
                <dd>${CandidateShow.address.details}</dd>
                <g:each in="${CandidateShow.candidateQualifications}" var="CandidateQualification" >
                <dt>Qualification</dt>
                <dd>${CandidateQualification.qualification.name}</dd>
                <dt>Owning Consultant</dt>
                <dd>${CandidateQualification.candidate.consultant.firstName + " " + CandidateQualification.candidate.consultant.lastName }</dd>
                </g:each>


            </dl>
        </div>

    </div>

</div>