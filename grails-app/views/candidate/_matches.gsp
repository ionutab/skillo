<div id="candidateMatches">
<g:if test="${matchCandidates?.size() > 0}">
    <div class="col-md-7">
        <div class="box box-solid">
            <div class="box-body">
                <h4><i class="fa fa-users"></i>&nbsp;Possible match candidates.</h4>
                <g:form controller="candidate" action="save" class="form-horizontal" autocomplete="off">
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="table-responsive">
                                <!-- THE MESSAGES -->
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="sortable">Full Name</th>
                                            <th>Telephone</th>
                                            <th>Post Code</th>
                                            <th>Trade</th>
                                            <th>Date of Birth</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <g:each in="${matchCandidates}" var="match">
                                            <tr>
                                                <td><g:link action="show" id="${match?.id}" target="_blank">${match?.firstName + " " + match.lastName}</g:link></td>
                                                <td>${match?.telephoneNumber}</td>
                                                <td>${match?.address?.postCode?.code}</td>
                                                <td>
                                                <g:if test="${match.candidateQualifications != null && match.candidateQualifications.size() > 0}">
                                                    <g:each in="${match.candidateQualifications}" var="cq">
                                                        <g:if test="${cq.isMainTrade}">
                                                            ${cq.qualification?.name}
                                                        </g:if>
                                                    </g:each>
                                                </g:if>
                                                </td>
                                                <td>
                                                    <g:formatDate format="${message (code:'default.date.format')}" date="${match?.birthDate}"/>
                                                </td>
                                            </tr>
                                        </g:each>
                                    </tbody>
                                </table>
                            </div><!-- /.table-responsive -->
                        </div><!-- /.col (RIGHT) -->
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</g:if>
</div>