<div class="page-container">
<!-- print system messages (infos, warnings, etc) - not validation errors -->
    <g:if test="${flash.message}">
        <div class="alert alert-info">${flash.message}</div>
    </g:if>

<!-- Show page's content -->
    <g:layoutBody />
    <g:pageProperty name="page.body" />
</div>