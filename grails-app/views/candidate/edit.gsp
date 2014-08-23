<%@ page import="skillo.candidate.Candidate" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="admin_lte_layout" />
    <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
    <g:set var="entityNaturalName" value="${candidateInstance.firstName + ' ' + candidateInstance.lastName}" />
    <g:set var="pageTitle" value="${entityNaturalName}" scope="request"/>

    <title><g:message code="default.edit.label" args="[entityNaturalName]" /></title>

    <r:require modules="forms"/>
    <r:require modules="remoteNonStopPageScroll" />
</head>

<body>

<g:set var="tab1" value="${params.action == 'edit' || params.action == 'show' || params.action == 'updateMainDetails'}" />
<g:set var="tab2" value="${params.action == 'updatePaymentDetails'}" />
<g:set var="tab3" value="${params.action == 'documentsUpload'}" />

<div class="row">
    <div class="col-md-3">
        <div class="box box-solid">
            <div class="box-body">
                <div class="row">
                    <g:render template="/candidate/basicInformation" model="[candidateInstance: candidateInstance]" />
                </div>
                <div class="row" id="activityTemplateDivId" style="overflow-y:auto; height:500px;">
                    <g:render template="/candidate/latestActivities"  />
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-9">
        <div class="row">
            <div class="col-md-12">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="${tab1 ? "active" : ""}"><a href="#tab_1" data-toggle="tab">Profile</a></li>
                        <li class="${tab2 ? "active" : ""}"><a href="#tab_2" data-toggle="tab">Payment</a></li>
                        <li class="${tab3 ? "active" : ""}"><a href="#tab_3" data-toggle="tab">Documents</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane ${tab1 ? "active" : ""}" id="tab_1">
                            <div class="row">
                                <g:render template="/candidate/mainDetails" />
                                <hr>
                                <g:render template="/candidate/candidateQualificationList" />
                                <hr>
                                <g:render template="/candidate/candidateNextOfKinDetails" />
                                <hr>
                                <g:render template="/candidate/candidateNotesList" model="['candidateInstance':candidateInstance]"/>

                            </div><!-- /.tab-pane -->
                        </div><!-- /.tab-pane -->
                        <div class="tab-pane ${tab2 ? "active" : ""}" id="tab_2">
                            <div class="box box-solid">
                                <div class="row">
                                    <g:render template="/candidate/candidatePaymentDetails" model="['candidateInstance':candidateInstance, 'availablePayrollCompanies': availablePayrollCompanies]"/>
                                </div><!-- /.row -->
                            </div><!-- /.row -->
                        </div><!-- /.tab-pane -->
                        <div class="tab-pane ${tab3 ? "active" : ""}" id="tab_3">
                            <div class="box box-solid">
                                <div class="row">

                                    <g:render template="/candidate/documents" />

                                </div><!-- /.row -->
                            </div><!-- /.row -->
                        </div><!-- /.tab-pane -->
                    </div><!-- /.tab-content -->
                </div>
            </div>
        </div>

    </div>
</div>

</body>