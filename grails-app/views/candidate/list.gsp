<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="admin" />
    <g:set var="entityName" value="${message(code: 'Candidate.label', default: 'Candidate')}" />
    <title><g:message code="candidate.list.label" args=" " /></title>
    <r:require modules="application"/>
    <r:require modules="candidates"/>
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
        <li class="active">
            <a href="#candidatesearch-1" data-toggle="tab">Seach #1</a>
        </li>
        
        <li class="">
            <button class="btn btn-primary" type="button" id="add-candidates-tab-button"><i class="icon-plus"></i></button>
        </li>
	</ul>
	<div class="tab-content">
        <div class="tab-pane active" id="candidatesearch-1">
			<section id="list-candidate" class="first">
			    <table class="table table-bordered table-striped">
			        <thead>
			            <tr>
			            
			                <g:sortableColumn property="firstName" title="${message(code: 'candidate.firstName.label', default: 'First ')}" />
			                <g:sortableColumn property="lastName" title="${message(code: 'candidate.firstName.label', default: 'Last Name')}" />
			                <th><g:message code="candidate.telephoneNumber.label" default="Telephone Number" /></th>
			                <th><g:message code="address.details.label" default="Address" /></th>
			                <th><g:message code="address.postcode.label" default="Post Code" /></th>
			                <th><g:message code="address.mainTrade.label" default="Main Trade" /></th>
			                <th><g:message code="actions" default="Actions" /></th>
			                
			            </tr>
			        </thead>
			        <tbody>
			            <g:each in="${CandidateList}" status="i" var="Candidate">
			                <tr>
		                        <td colspan="2">
		                            <g:link action="show" id="${Candidate.id}">${Candidate.firstName}</g:link> <g:link action="show" id="${Candidate.id}">${Candidate.lastName}</g:link>
		                        </td>
		                        <td>
		                            <g:if test="${Candidate.telephoneNumber != null}">
                                        ${Candidate.telephoneNumber.details}
		                            </g:if>
		                        </td>
		                        <td>
		                            <g:if test="${Candidate.address != null}">
                                        ${Candidate.address.details}
		                            </g:if>
		                        </td>
		                        <td>
		                            <g:if test="${Candidate.address != null}">
		                                ${Candidate.address.postCode}
		                            </g:if>
		                        </td>
		                        <td>
		                            <g:if test="${Candidate.mainTrade != null}">
		                                ${Candidate.mainTrade.name}
		                            </g:if>
		                        </td>
		                        <td>
		                        </td>
			                </tr>
			            </g:each>
			        </tbody>
			    </table>
			    
			    <div class="pagination">
			        <bs:paginate total="${CandidateTotal}" />
			    </div>
			    
			</section>
        </div>
        
        
	</div>
</div>

</body>

</html>
    