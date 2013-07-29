<!doctype html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="admin" />
    <g:set var="entityName" value="\${message(code: 'Candidate.label', default: 'Candidate')}" />
    <title><g:message code="candidate.list.label" args=" " /></title>
    <r:require modules="application"/>
    <r:require modules="candidates"/>
</head>

<body>

<div class="accordion" id="accordion2">
	<div class="accordion-group">
        <div class="accordion-heading">
	        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                <g:message code="candidate.search.label" default="Search Candidates" />
	        </a>
        </div>
        
		<div id="collapseOne" class="accordion-body collapse in">
			<div class="accordion-inner">
			    
			</div>
		</div>
		        
	</div>
</div>
  

<div class="tabbable tabs-right">
	<ul class="nav nav-tabs">
        <li class="active">
            <a href="#candidatesearch-1" data-toggle="tab">Seach #1</a>
        </li>
        
        <%--
        <li class="">
            <a href="#candidatesearch-2" data-toggle="tab">Seach #2 <button class="btn btn-link" type="button"><i class="icon-remove"></i></button></a>
        </li>
        --%>
        <li class="">
            <button class="btn btn-primary" type="button" id="add-candidates-tab-button">+</button>
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
			                <th><g:message code="address.details.label" default="Address" /></th>
			                <th><g:message code="address.postcode.label" default="Post Code" /></th>
			                <th><g:message code="actions" default="Actions" /></th>
			                
			            </tr>
			        </thead>
			        <tbody>
			            <g:each in="${CandidateList}" status="i" var="Candidate">
			                
			                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			                
                                <td colspan="2">
                                    <g:link action="show" id="${Candidate.id}">${Candidate.firstName}</g:link> <g:link action="show" id="${Candidate.id}">${Candidate.lastName}</g:link>
                                </td>
                                <td>
                                    <g:if test="${Candidate.address != null}">
	                                    <g:link action="show" id="${Candidate.id}">${Candidate.address.details}</g:link>
                                    </g:if>
                                </td>
                                <td>
                                    <g:if test="${Candidate.address != null}">
	                                    <g:link action="show" id="${Candidate.id}">${Candidate.address.postCode}</g:link>
                                    </g:if>
                                </td>
                                <td>
                                </td>
			                
			                </tr>
			                
			            </g:each>
			        </tbody>
			    </table>
			    
			    <div class="pagination">
			        <bs:paginate total="\${CandidateTotal}" />
			    </div>
			    
			</section>
        </div>
        
        <%-- 
        <div class="tab-pane" id="candidatesearch-2">
			<section id="list-candidate" class="first">
			    <table class="table table-bordered">
			        <thead>
			            <tr>
			            
			                <g:sortableColumn property="firstName" title="${message(code: 'candidate.firstName.label', default: 'First Name')}" />
			                <g:sortableColumn property="lastName" title="${message(code: 'candidate.lastName.label', default: 'Last Name')}" />
			                <th><g:message code="address.details.label" default="Address" /></th>
			                <th><g:message code="address.postcode.label" default="Post Code" /></th>
			                <th><g:message code="actions" default="Actions" /></th>
			                
			            </tr>
			        </thead>
			        <tbody>
			            <g:each in="\${CandidateList}" status="i" var="Candidate">
			                
			                
			                
			            </g:each>
			        </tbody>
			    </table>
			    <div class="pagination">
			        <bs:paginate total="\${CandidateTotal}" />
			    </div>
			</section>
        </div>
        --%>
        
	</div>
</div>

</body>

</html>
    