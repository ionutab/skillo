
<%@ page import="skillo.Candidate" %>
<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="admin_light" />
    <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
    <title><g:meta name="app.title.short" /> - <g:message code="candidate.list.label" args=" " /></title>
</head>

<body>

<g:form action="list" controller="candidate" name="searchForm">
  <fieldset>
    <legend><g:message code="candidate.search.label" /></legend>

    <div class="row-fluid">
	    <div class="span12">
		    <g:textField name="firstName" placeholder="${message(code: 'candidate.search.firstName.label', default: 'First Name')}" value="${params.firstName}"/>
		    <g:textField name="lastName" placeholder="${message(code: 'candidate.search.lastName.label', default: 'Last Name')}" />
		    <g:textField name="telephoneNumber" placeholder="${message(code: 'candidate.search.telephoneNumber.label', default: 'Telephone Nr')}" />
	    </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <input type="text" placeholder="${message(code: 'candidate.search.address.label', default: 'Address')}">
            <input type="text" placeholder="${message(code: 'candidate.search.postCode.label', default: 'Post Code')}">
            <input type="text" placeholder="${message(code: 'candidate.search.mainTrade.label', default: 'Main Trade')}">
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <g:submitButton name="list" class="btn btn-primary" value="${message(code: 'default.button.search.label')}" />
            <button type="button" class="btn btn-info"><i class="icon-refresh"></i></button>
            <button type="button" class="btn btn-info pull-right" data-toggle="button"><i class="icon-chevron-down"></i></button>
        </div>
    </div>
  </fieldset>
  <fieldset>

  </fieldset>
</g:form>


<div class="tabbable tabs-right">
	<ul class="nav nav-tabs">
        %{--
        I have commented this because then the top context will not work properly - beats me
        <li>
            <a href="#cs1" data-toggle="tab">Seach 1</a>
        </li>

        --}%
        <li class="">
            <button class="btn btn-primary" type="button" id="addcandidatestabbutton"><i class="icon-plus"></i></button>
        </li>
	</ul>

	<div class="tab-content">
        <div class="tab-pane active" id="cs1">

			<section id="list-candidate" class="first">
			    <table class="table table-bordered table-striped">
			        <thead>
			            <tr>

			                <g:sortableColumn property="firstName" title="${message(code: 'candidate.firstName.label', default: 'First ')}" />
			                <g:sortableColumn property="lastName" title="${message(code: 'candidate.lastName.label', default: 'Last Name')}" />
			                <th><g:message code="candidate.telephoneNumber.label" default="Telephone Number" /></th>
			                <th><g:message code="address.details.label" default="Address" /></th>
			                <th><g:message code="address.postcode.label" default="Post Code" /></th>
			                <th><g:message code="candidate.mainTrade.label" default="Main Trade" /></th>
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
		                            <g:if test="${Candidate.telephoneNumber != null}">
                                        ${Candidate.telephoneNumber}
		                            </g:if>
		                        </td>
		                        <td>
		                            <g:if test="${Candidate.address != null}">
                                        ${Candidate.address.details}
		                            </g:if>
		                        </td>
		                        <td>
		                            <g:if test="${Candidate.address != null}">
		                                ${Candidate.address.postCode.code}
		                            </g:if>
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

</body>

</html>
    