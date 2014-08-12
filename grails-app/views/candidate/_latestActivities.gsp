<%@ page import="skillo.enums.ActivityType" %>
<div class="col-xs-12">

    <g:if test="${candidateActivities != null && !candidateActivities.isEmpty()}">

    <div class="box box-solid">
        <div class="box-body">
            <div class="row">
                <ul class="timeline">
                    <g:each in="${candidateActivities}" status="i" var="activity">
                        <!-- timeline time label -->
                        <li class="time-label">
                            <span class="bg-green">
                                <g:formatDate format="dd-MMM-yyyy" date="${activity.timestamp}"/>
                            </span>
                        </li>
                        <!-- /.timeline-label -->

                        <!-- timeline item -->
                        <li>
                        <!-- timeline icon -->
                            <g:if test="${activity.type == ActivityType.CREATE}">
                                <i class="fa fa-plus bg-blue"></i>
                            </g:if>
                            <g:elseif test="${activity.type == ActivityType.UPDATE}">
                                <i class="fa fa-edit bg-blue"></i>
                            </g:elseif>
                            <g:else>
                                <i class="fa fa-trash-o bg-blue"></i>
                            </g:else>

                            <div class="timeline-item">

                                <g:if test="${activity.type == ActivityType.CREATE}">
                                    <h3 class="timeline-header">${activity.name} have been added</h3>
                                </g:if>
                                <g:elseif test="${activity.type == ActivityType.UPDATE}">
                                    <h3 class="timeline-header">${activity.name} have been updated</h3>
                                </g:elseif>
                                <g:else>
                                    <h3 class="timeline-header">${activity.name} have been deleted</h3>
                                </g:else>


                                <div class="timeline-body">
                                    <g:if test="${activity.type == ActivityType.UPDATE}">
                                        <g:each in="${candidateChanges}" status="j" var="change">
                                            ${change.key} changed from ${change.value.from} to ${change.value.to}
                                        </g:each>
                                        ${activity.changes}
                                    </g:if>
                                    <span class="time"><i
                                            class="fa fa-clock-o"></i>&nbsp${skillo.util.ActivityLoggingUtil.logActivityTimestamp(activity.timestamp)}
                                    </span> by ${activity.consultantName}
                                </div>

                            </div>
                        </li>
                    </g:each>
                </ul>
            </div>
        </div>
    </div>
    </g:if>
</div>