<div id="full-content-container">
	<!-- print system messages (infos, warnings, etc) - not validation errors -->
    <div class="content-fluid">

        <g:if test="${!layout_nocontextbar}">
            <g:render template="/_menu/listContext"/>
        </g:if>

        <g:layoutBody />
        <g:pageProperty name="page.body" />

    </div>

</div>
