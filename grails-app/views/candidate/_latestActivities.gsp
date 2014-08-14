<%@ page import="skillo.enums.ActivityType" %>
<div class="col-xs-12">


    <g:if test="${candidateActivities != null && !candidateActivities.isEmpty()}">

        <div class="box box-solid">
            <div class="box-body">
                <div class="row" style="overflow-y:auto; height:600px;">
                    <ul class="timeline">
                        <g:each in="${candidateActivities}" status="i" var="activity">
                            <!-- timeline time label -->
                            <li class="time-label">
                                <span class="bg-green">
                                    <g:formatDate format="dd-MMM-yyyy" date="${activity.activity.timestamp}"/>
                                </span>
                            </li>
                            <!-- /.timeline-label -->

                            <!-- timeline item -->
                            <li>
                            <!-- timeline icon -->
                                <g:if test="${activity.activity.type == ActivityType.CREATE}">
                                    <i class="fa fa-plus bg-blue"></i>
                                </g:if>
                                <g:elseif test="${activity.activity.type == ActivityType.UPDATE}">
                                    <i class="fa fa-edit bg-blue"></i>
                                </g:elseif>
                                <g:else>
                                    <i class="fa fa-trash-o bg-blue"></i>
                                </g:else>

                                <div class="timeline-item">

                                    <g:if test="${activity.activity.type == ActivityType.CREATE}">
                                        <h3 class="timeline-header">${activity.candidateName} has been added</h3>
                                    </g:if>
                                    <g:elseif test="${activity.activity.type == ActivityType.UPDATE}">
                                        <h3 class="timeline-header">${activity.candidateName} has been updated</h3>
                                    </g:elseif>
                                    <g:else>
                                        <h3 class="timeline-header">${activity.candidateName} has been deleted</h3>
                                    </g:else>


                                    <div class="timeline-body">
                                        <div class="row">
                                            <g:if test="${activity.activity.type == ActivityType.UPDATE}">
                                                <g:each in="${activity.fieldChanges}" status="j" var="change">
                                                    <g:message code="candidate.${change.fieldName}.label" />
                                                    <g:if test="${change.valueFrom != 'null'}">
                                                        &nbsp<g:message code="field.change.message.simple" args="${[change.valueFrom, change.valueTo]}"/>
                                                    </g:if>
                                                    <g:else>
                                                        &nbsp<g:message code="field.change.message.noOld" args="${[change.valueTo]}"/>
                                                    </g:else>
                                                </g:each>
                                            </g:if>
                                        </div>

                                        <div class="row">
                                            &nbsp<span class="time"><i
                                                    class="fa fa-clock-o"></i>&nbsp${skillo.util.ActivityLoggingUtil.logActivityTimestamp(activity.activity.timestamp)}
                                            </span> by ${activity.consultantName}
                                        </div>
                                    </div>

                                </div>
                            </li>
                        </g:each>
                    </ul>
                </div>
            </div>
        </div>
        <div>
            <a class="btn btn-block btn-social bg-blue">
                <i class="fa fa-plus bg-blue"></i> Show more
            </a>
        </div>
    </g:if>
</div>