
<%@ page import="skillo.Candidate" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="admin_light" />
    <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
    <title><g:message code="candidate.list.label" args=" " /></title>
    <g:set var="page_title" value="${message(code: 'candidate.list.label')}" scope="request"/>
</head>

<body>

<div class="row">
    <div class="content-container col-lg-12">
    <g:form action="list" controller="candidate" name="searchForm" role="form">
        <legend><g:message code="candidate.search.label" /></legend>
        <div class="form-group row">
            <div class="col-lg-2">
                <g:textField class="form-control" name="firstName" placeholder="${message(code: 'candidate.search.firstName.label', default: 'First Name')}" value="${params.firstName}"/>
            </div>
            <div class="col-lg-2">
                <g:textField class="form-control" name="lastName" placeholder="${message(code: 'candidate.search.lastName.label', default: 'Last Name')}" />
            </div>
            <div class="col-lg-2">
                <g:textField class="form-control" name="telephoneNumber" placeholder="${message(code: 'candidate.search.telephoneNumber.label', default: 'Telephone Nr')}" />
            </div>
        </div>
        <div class="form-group row">
            <div class="col-lg-2">
                <input class="form-control" type="text" placeholder="${message(code: 'candidate.search.address.label', default: 'Address')}">
            </div>
            <div class="col-lg-2">
                <input class="form-control" type="text" placeholder="${message(code: 'candidate.search.postCode.label', default: 'Post Code')}">
            </div>
            <div class="col-lg-2">
                <input class="form-control" type="text" placeholder="${message(code: 'candidate.search.mainTrade.label', default: 'Main Trade')}">
            </div>
        </div>
        <div class="form-group">
                <g:submitButton name="list" class="btn btn-primary" value="${message(code: 'default.button.search.label')}" />
                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-refresh"></span></button>
                <button type="button" class="btn btn-info pull-right" data-toggle="button"><span class="glyphicon glyphicon-arrow-down"></span></button>
        </div>
    </g:form>
    </div>
</div>


<div class="row">

    <div class="content-container col-lg-12">

        <ul class="nav nav-tabs">

            %{--I have commented this because then the top context will not work properly - beats me--}%
            <li><a href="#cs1" data-toggle="tab">Seach 1</a></li>
            <li><g:link href="#" ><span class="glyphicon glyphicon-plus"></span></g:link></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active" id="cs1">

                <section id="list-candidate-1" class="first">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>

                                <g:sortableColumn property="firstName" title="${message(code: 'candidate.firstName.label', default: 'First ')}" />
                                <g:sortableColumn property="lastName" title="${message(code: 'candidate.lastName.label', default: 'Last Name')}" />
                                <th><g:message code="candidate.telephoneNumber.label" default="Telephone Number" /></th>
                                <th><g:message code="address.details.label" default="Address" /></th>
                                <th><g:message code="address.postcode.label" default="Post Code" /></th>
                                <th><g:message code="candidate.mainTrade.label" default="Main Trade" /></th>
                                <th><g:message code="payroll.payrollCompany.label" default="Payroll Company" /></th>
                                <th><g:message code="default.actions.label" default="Actions" /></th>

                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${CandidateList}" status="i" var="Candidate">
                                <tr>
                                    <td colspan="2">
                                        <g:link action="show" data-placement="right" data-trigger="click" id="${Candidate.id}" elementId="${Candidate.id}">${Candidate.firstName}</g:link>
                                        <g:link url="#" class="popable" data-placement="right" data-trigger="click" elementId="${Candidate.id}">${Candidate.lastName}</g:link>
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
                                        ${Candidate?.payroll?.payrollCompany?.name}
                                    </td>
                                    <td>
                                        <g:link action="edit" id="${Candidate.id}" class="btn btn-small"><g:message code="default.edit.label" args=" " /></g:link>
                                    </td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>

                    <div class="pagination">
                        <g:paginate total="${CandidateTotal}" />
                    </div>

                </section>
            </div>
        </div>
    </div>
</div>

</body>

</html>
    