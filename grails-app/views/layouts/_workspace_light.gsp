
<div id="workspace-content-container" class="<%=Boolean.TRUE.equals((Boolean)session.getAttribute("user.layout.sidebar.narrow")) ? 'workspace-wide' : 'workspace-narrow' %>">
	
	<!-- print system messages (infos, warnings, etc) - not validation errors -->
	<g:if test="${flash.message}">
		<div class="alert alert-info">${flash.message}</div>
	</g:if>
	
    <div class="content-fluid">

        <g:if test="${!layout_nocontextbar}">
            <g:render template="/_menu/listContext"/>
        </g:if>

        <g:layoutBody />
        <g:pageProperty name="page.body" />
        %{--
        <g:if test="${!layout_nocontextbar}">
            <g:render template="/_menu/listContext"/>
        </g:if>
        --}%

    </div>

	<%-- footer --%> 
	<%-- 
	<g:if test="${ pageProperty(name:'page.footer') }">
		<g:pageProperty name="page.footer"/>
	</g:if>
	<g:else>
		<g:render template="/_menu/footer"/>
	</g:else>
	--%>
	
</div>
