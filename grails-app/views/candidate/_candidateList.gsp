<g:if test="${!candidateList}">
	<div class="page-background-info">
		<h2>There are currently no candidates that match your criteria.</h2>
	</div>
</g:if>
<g:if test="${candidateList}">
	<div class="box box-solid">
		<div class="box-body">
			<div class="row">
				<div class="col-md-7 col-sm-7">
					<div class="table-responsive">
						<!-- THE MESSAGES -->
						<table class="table">
							<thead>
							<tr>
								<g:sortableColumn property="firstName" title="Firts Name"/>
								%{--<th>Telephone</th>--}%
								<th>Address</th>
								<th class="fixed-80">Post Code</th>
								<th>Trade</th>
							</tr>
							</thead>
							<tbody>
							<g:each in="${candidateList}" status="i" var="candidate">
								<tr>
									<td>
										<g:remoteLink controller="candidate" action="display" id="${candidate.id}"
										              elementId="${candidate.id}"
										              update="infoContainer">${candidate.firstName} ${candidate.lastName}</g:remoteLink>
									</td>
									<td>
										${candidate?.address?.details}
									</td>
									<td>
										${candidate?.address?.postCode?.code}
									</td>
									<td>
										${candidate?.getMainTrade()?.qualification?.name}
									</td>
								</tr>
							</g:each>
							</tbody>
						</table>
					</div><!-- /.table-responsive -->
					<div class="row">
						<div class="col-md-4">
							<div class="dataTables_paginate paging_bootstrap">
								<div class="pagination">
									<g:paginate total="${candidateTotal}"/>
								</div>
							</div>
						</div>
					</div>
				</div><!-- /.col (RIGHT) -->
				<div class="col-md-5 col-sm-5">
					<div id="infoContainer">
						<g:render template="/candidate/info"/>
					</div>
				</div>
			</div><!-- /.row -->
		</div><!-- /.box-body -->
	</div><!-- /.box -->
</g:if>