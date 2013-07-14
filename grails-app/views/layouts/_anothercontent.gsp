<div id="Content" class="container-fluid">
	<!-- Main menu in one row (e.g., controller entry points -->
    <g:render template="/_anothermenu/sidebar"/>

	<!-- print system messages (infos, warnings, etc) - not validation errors -->
	<g:if test="${flash.message}">
		<div class="alert alert-info">${flash.message}</div>
	</g:if>

	<!-- Show page's content -->
	<g:layoutBody />
	<g:pageProperty name="page.body" />
</div>
