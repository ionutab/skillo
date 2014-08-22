<%@ page import="skillo.client.Client" %>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
		<meta name="layout" content="admin_lte_layout" />
		<title><g:message code="client.list.label" /></title>
		<g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}" />
		<g:set var="pageTitle" value="${message(code: 'client.list.label')}" scope="request" />
		<g:set var="layout_nocontextbar" value="${true}" scope="request" />
		<r:require modules="forms" />
	</head>
	<body>
		<div class="row">
			<div class="col-md-6">
				<g:form action="list" controller="client" name="searchForm" role="form" method="GET">
					<div class="row">
						<div class="col-xs-6">
							<g:textField class="form-control" name="search.name" placeholder="${message(code: 'client.search.name.label', default: 'Name')}" value="${clientListFilter?.name}"/>
						</div>
						<div class="col-xs-6">
							<g:textField class="form-control" name="search.registrationNumber" placeholder="${message(code: 'client.search.registrationNumber.label', default: 'Registration Number')}" value="${clientListFilter?.registrationNumber}"/>
						</div>
					</div>
					<div class="row top10">
						<div class="col-xs-6">
							<g:submitButton name="list" class="btn btn-primary" value="${message(code: 'default.button.search.label')}"/>
							<button type="submit" id="resetClientSearchForm" class="btn btn-info" name="reset" value="true">
								<i class="fa fa-refresh"></i>
							</button>
						</button>
						</div>
					</div>
				</g:form>
			</div>
		</div>
		<hr>
		<div class="row">
			<g:if test="${clientList.size() == 0}">
				<div class="col-md-12">
					<div class="page-background-info">
						<h2><g:message code="candidate.search.notFound.label"/></h2>
					</div>
				</div>
			</g:if>
			<g:if test="${clientList.size() > 0}">
				<div class="col-md-6" id="panel1">
					<g:link action="create"><i class="fa fa-plus"></i>&nbsp;Client</g:link>
					<div class="box box-solid">
						<div class="box-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th></th>
												<g:sortableColumn property="name" title="${message(code: 'client.name.label', default: 'Name')}"/>
												%{--
												<g:sortableColumn property="telephoneNumber" title="${message(code: 'client.telephoneNumber', default:'Telephone')}" class="attitude"/>
												<g:sortableColumn property="registrationNumber" title="${message(code: 'client.registrationNumber.short.label', default: 'Registration Number')}"/>
												--}%
												<g:sortableColumn property="address.postCode.code" title="${message(code: 'address.details.label', default: 'Address')}" class="attitude"/>
											<th class="attitude"></th>
										</tr>
									</thead>
									<tbody>
										<g:each in="${clientList}" status="i" var="clientInstance">
											<tr>
												<td>
													%{--<g:link controller="client" action="details" id="${clientInstance.id}">${clientInstance?.name}</g:link>--}%
													<g:remoteLink
															controller="client"
															action="displayContacts"
															id="${clientInstance.id}"
															elementId="${clientInstance.id}"
															update="clientContainer"><i
															class="fa fa-group"></i></g:remoteLink>
												</td>
												<td class="fixed-140">
													<g:link controller="client" action="show" id="${clientInstance?.id}">${clientInstance?.name}</g:link>
												</td>
												%{--
												<td class="attitude fixed-110">
													${clientInstance?.telephoneNumber}
												</td>
												<td>
													${clientInstance?.registrationNumber}
												</td>
												--}%
												<td class="attitude">
													${clientInstance?.address?.details} - <b>${clientInstance?.address?.postCode?.code}</b>
												</td>
												<td class="attitude">
													<g:link controller="client" action="edit" id="${clientInstance?.id}">
														<i class="fa fa-pencil"></i>
													</g:link>
												</td>
											</tr>
										</g:each>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-md-4">
									<div class="dataTables_paginate paging_bootstrap">
										<div class="pagination">
											<g:paginate total="${clientTotal}"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			%{-- PANEL 2 - contacts per client --}%
				<div class="col-md-6 col-sm-6" id="panel2">
					<g:link url="#" data-toggle="modal" data-target="#createClientContactModal"><i class="fa fa-plus"></i>&nbsp;Contact</g:link>
					<br/>
					<br/>
					<div id="clientContainer">
						<g:render template="contacts" model="['clientInstance':clientInstance]" />
					</div>
				</div>
			%{-- PANEL 3 - contact comments details --}%
				<div class="col-md-4 col-sm-4 context-content-off" id="panel3">
					<g:link controller="clientComment" action="create"><i class="fa fa-plus"></i>&nbsp;Comment</g:link>
					<div id="contactCommentsContainer">
						<g:render template="contactComments"/>
					</div>
				</div>
				<g:javascript>
					$("#panel1").click(function () {
						$("#panel1").removeClass("context-content-on");
						$("#panel1").addClass("col-md-6");
						$("#panel1").removeClass("col-md-2");
						$("#panel3").addClass("context-content-off");
					});
					function slimClientList() {
						$("#panel1").addClass("context-content-on");
						$("#panel1").removeClass("col-md-6");
						$("#panel1").addClass("col-md-2");
						$("#panel3").removeClass("context-content-off");
					};
				</g:javascript>
			</g:if>
		</div>
	</body>
</html>