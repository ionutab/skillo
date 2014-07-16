<div id="full-content-container">
    <div class="content-fluid">

        <g:if test="${!layout_nocontextbar}">
            <g:render template="/_menu/context"/>
        </g:if>

        <g:layoutBody />
        <g:pageProperty name="page.body" />

    </div>
</div>
