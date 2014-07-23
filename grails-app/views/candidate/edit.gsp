<%@ page import="skillo.Candidate" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="admin_lte_layout" />
    <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
    <g:set var="entityNaturalName" value="${candidateInstance.firstName + ' ' + candidateInstance.lastName}" />
    <g:set var="page_title" value="${entityNaturalName}" scope="request"/>

    <title><g:message code="default.edit.label" args="[entityNaturalName]" /></title>

    <r:require modules="forms"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'customButtons.css')}"/>
</head>

<body>

<g:set var="tab1" value="${params.action == 'edit' || params.action == 'show' || params.action == 'updateMainDetails'}" />
<g:set var="tab2" value="${params.action == 'updatePaymentDetails'}" />
<g:set var="tab3" value="${false}" />

<div class="row">

    <div class="col-md-3">
        <div class="box box-solid">
            <div class="box-body">
                <div class="row">
                    <g:render template="/candidate/basicInformation" />
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
                        <li class="${tab3 ? "active" : ""}"><a href="#tab_4" data-toggle="tab">Documents</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane ${tab1 ? "active" : ""}" id="tab_1">
                            <div class="row">
                                <g:render template="/candidate/mainDetails" />
                                <hr>
                                <g:render template="/candidate/candidateQualificationDetails" />
                            </div><!-- /.tab-pane -->
                        </div><!-- /.tab-pane -->
                        <div class="tab-pane ${tab2 ? "active" : ""}" id="tab_2">
                            <div class="box box-solid">
                                <div class="row">
                                    <g:render template="/candidate/candidatePaymentDetails" />
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