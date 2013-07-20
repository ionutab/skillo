
<div class="workspace-content-container">
	
	<!-- print system messages (infos, warnings, etc) - not validation errors -->
	<g:if test="${flash.message}">
		<div class="alert alert-info">${flash.message}</div>
	</g:if>
	
	<g:layoutBody />
	<g:pageProperty name="page.body" />
	
	<%-- footer --%> 
	<g:if test="${ pageProperty(name:'page.footer') }">
		<g:pageProperty name="page.footer"/>
	</g:if>
	<g:else>
		<g:render template="/_testmenu/testWorkspaceFooter"/>
	</g:else>
	
</div>
