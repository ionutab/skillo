<%@ page import="skillo.activity.Activity; skillo.enums.ActivityType; skillo.enums.DomainActivityType" %>
<div class="col-xs-12">

    <g:if test="${candidateActivities != null && !candidateActivities.isEmpty()}">

        <div class="box box-solid">
            <div class="box-body">
                <div class="row">

                    <g:each in="${candidateActivities}" status="i" var="activity">
                        <div class="callout callout-info">
                            <p>
                        <g:if test="${activity.type == ActivityType.CREATE}">
                            <i class="fa fa-plus"></i>
                        </g:if>
                        <g:elseif test="${activity.type == ActivityType.UPDATE}">
                            <i class="fa fa-edit"></i>
                        </g:elseif>
                        <g:else>
                            <i class="fa fa-trash-o"></i>
                        </g:else>
                        <g:formatDate format="dd/MM/yyyy" date="${activity.timestamp}"/>


                        <g:if test="${activity.type == ActivityType.CREATE}">
                            <g:if test="${showLinks == true}">
                                <g:link controller="candidate" action="show"
                                        id="${activity.ownerId}"><b>${activity.modifiedObjectName}</b></g:link> has been added
                            </g:if>
                            <g:else>
                                <b>${activity.modifiedObjectName}</b> has been added
                            </g:else>
                        </g:if>
                        <g:elseif test="${activity.type == ActivityType.UPDATE}">
                            <g:if test="${showLinks == true}">
                                <g:link controller="candidate" action="show"
                                        id="${activity.ownerId}"><b>${activity.modifiedObjectName}</b></g:link> has been updated
                            </g:if>
                            <g:else>
                                <b>${activity.modifiedObjectName}</b> has been updated
                            </g:else>
                        </g:elseif>
                        <g:else>
                            <g:if test="${showLinks == true}">
                                <g:link controller="candidate" action="show"
                                        id="${activity.ownerId}"><b>${activity.modifiedObjectName}</b></g:link>  has been deleted
                            </g:if>
                            <g:else>
                                <b>${activity.modifiedObjectName}</b> has been deleted
                            </g:else>
                        </g:else>
                        </p>

                        <p>
                        <g:if test="${activity.type == ActivityType.UPDATE}">
                            <g:if test="${activity.domainActivityType != null}">
                                <g:if test="${activity.domainActivityType == DomainActivityType.PAYROLL}">
                                    <i class="fa fa-info-circle"></i>&nbsp;Candidate payroll changed
                                </g:if>
                                <g:elseif test="${activity.domainActivityType == DomainActivityType.DOCUMENT}">
                                    <i class="fa fa-info-circle"></i>&nbsp;Candidate documents changed
                                </g:elseif>
                                <g:elseif
                                        test="${activity.domainActivityType == DomainActivityType.CANDIDATE_QUALIFICATION}">
                                    <i class="fa fa-info-circle"></i>&nbsp;Candidate qualification changed
                                </g:elseif>
                            </g:if>
                            <ul>
                                <g:each in="${activity.fieldChanges}" status="j" var="change">
                                    <li>
                                        <g:if test="${change.domainActivityType == DomainActivityType.CANDIDATE}">
                                            <g:message code="candidate.${change.fieldName}.label"/>
                                            <g:if test="${change.valueFrom != 'null' && change.valueTo != 'null'}">
                                                <g:message code="field.change.message.simple"
                                                           args="${[change.valueFrom, change.valueTo]}"/>
                                            </g:if>
                                            <g:elseif test="${change.valueFrom == 'null' && change.valueTo != 'null'}">
                                                <g:message code="field.change.message.noOld"
                                                           args="${[change.valueTo]}"/>
                                            </g:elseif>
                                            <g:elseif test="${change.valueFrom != 'null' && change.valueTo == 'null'}">
                                                <g:message code="field.change.message.delete"
                                                           args="${[change.valueFrom]}"/>
                                            </g:elseif>
                                        </g:if>
                                        <g:elseif test="${change.domainActivityType == DomainActivityType.ADDRESS}">
                                            <g:message code="address.${change.fieldName}.label"/>
                                            <g:if test="${change.valueFrom != 'null' && change.valueTo != 'null'}">
                                                <g:message code="field.change.message.simple"
                                                           args="${[change.valueFrom, change.valueTo]}"/>
                                            </g:if>
                                            <g:elseif test="${change.valueFrom == 'null' && change.valueTo != 'null'}">
                                                <g:message code="field.change.message.noOld"
                                                           args="${[change.valueTo]}"/>
                                            </g:elseif>
                                            <g:elseif test="${change.valueFrom != 'null' && change.valueTo == 'null'}">
                                                <g:message code="field.change.message.delete"
                                                           args="${[change.valueFrom]}"/>
                                            </g:elseif>
                                        </g:elseif>
                                        <g:elseif test="${change.domainActivityType == DomainActivityType.PAYROLL}">
                                            <g:message code="payroll.${change.fieldName}.label"/>
                                            <g:if test="${change.valueFrom != 'null' && change.valueTo != 'null'}">
                                                <g:message code="field.change.message.simple"
                                                           args="${[change.valueFrom, change.valueTo]}"/>
                                            </g:if>
                                            <g:elseif test="${change.valueFrom == 'null' && change.valueTo != 'null'}">
                                                <g:message code="field.change.message.noOld"
                                                           args="${[change.valueTo]}"/>
                                            </g:elseif>
                                            <g:elseif test="${change.valueFrom != 'null' && change.valueTo == 'null'}">
                                                <g:message code="field.change.message.delete"
                                                           args="${[change.valueFrom]}"/>
                                            </g:elseif>
                                        </g:elseif>
                                        <g:elseif test="${change.domainActivityType == DomainActivityType.DOCUMENT}">
                                            <g:message code="${change.fieldName}.label"/>
                                            <g:if test="${change.valueFrom != 'null' && change.valueTo != 'null'}">
                                                <g:message code="field.change.message.simple"
                                                           args="${[change.valueFrom, change.valueTo]}"/>
                                            </g:if>
                                            <g:elseif test="${change.valueFrom == 'null' && change.valueTo != 'null'}">
                                                <g:message code="field.change.message.noOld"
                                                           args="${[change.valueTo]}"/>
                                            </g:elseif>
                                            <g:elseif test="${change.valueFrom != 'null' && change.valueTo == 'null'}">
                                                <g:message code="field.change.message.delete"
                                                           args="${[change.valueFrom]}"/>
                                            </g:elseif>
                                        </g:elseif>
                                        <g:elseif
                                                test="${change.domainActivityType == DomainActivityType.CANDIDATE_QUALIFICATION}">
                                            <g:message code="candidateQualification.${change.fieldName}.label"/>
                                            <g:if test="${change.valueFrom != 'null' && change.valueTo != 'null'}">
                                                <g:message code="field.change.message.simple"
                                                           args="${[change.valueFrom, change.valueTo]}"/>
                                            </g:if>
                                            <g:elseif test="${change.valueFrom == 'null' && change.valueTo != 'null'}">
                                                <g:message code="field.change.message.noOld"
                                                           args="${[change.valueTo]}"/>
                                            </g:elseif>
                                            <g:elseif test="${change.valueFrom != 'null' && change.valueTo == 'null'}">
                                                <g:message code="field.change.message.delete"
                                                           args="${[change.valueFrom]}"/>
                                            </g:elseif>
                                        </g:elseif>
                                    </li>
                                </g:each>
                            </ul>
                        </g:if>
                        </p>
                        <p>
                            <span class="time"><i
                                    class="fa fa-clock-o"></i>&nbsp${skillo.util.ActivityLoggingUtil.logActivityTimestamp(activity.timestamp)}
                            </span>
                            by ${activity.consultantName}
                        </p>

                        </div>
                    </g:each>
                </div>
            </div>
        </div>

    </g:if>
</div>

<util:remoteNonStopPageScroll action='filter' controller="home" total="${candidateActivities?.size()}"
                              update="activityTemplateDivId" heightOffset="5" loadingHtml="loadingGifDivId"/>