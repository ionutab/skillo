<%@ page import="skillo.CandidateNote; skillo.Candidate" %>

<g:set var="editable" value="${params.action == 'edit' || params.action == 'updateMainDetails' || params.action == 'updatePaymentDetails'}"/>
<g:set var="cn" value="${candidateInstance.candidateNotes}" />

<div class="col-md-12">
    <div class="box box-solid">
        <div class="box-body">
            <div class="row">
                <div class="col-md-12 col-sm-12">

                    <g:if test="${cn == null || cn.size() <= 0}">

                        <div class="col-md-12 col-lg-offset-2 page-background-info">
                            <h2><g:message code="candidateNotes.display.notFound.label"/></h2>
                        </div>

                    </g:if>
                    <g:else>
                        <g:each in="${candidateInstance.candidateNotes}" var="cnote" status="i">
                            <div class="callout callout-main-details callout-info" >
                                <p><b><g:formatDate date="${cnote.note.date}" />&nbsp;${cnote.consultant.firstName + " " + cnote.consultant.lastName}</b></p>
                                <p>${cnote.note.note}</p>
                            </div>
                        </g:each>
                    </g:else>

                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <g:if test="${editable}">
                        <button class="btn btn-info btn-sm" data-toggle="modal"
                                data-target="#createCandidateNoteModal" id="addCandidateNote"><i
                                class="fa fa-plus "></i>&nbsp;Add Candidate Note</button>
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

<g:render template="createCandidateNoteModal" model="['redirect':'edit','candidateInstance':candidateInstance,'newCandidateNote':newCandidateNote]"/>