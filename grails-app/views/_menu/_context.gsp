<%-- Only show the "Pills" navigation menu if a controller exists (but not for home) --%>
<g:if test="${ params.controller != null && params.controller != '' &&	params.controller != 'home' }">
    <section class="content-header">
        <g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
    <g:if test="${params.action != 'list'}">
        <g:link action="list" ><i class="fa fa-bars"></i>&nbsp;<g:message code="default.list.label" args="[entityName]"/></g:link>
    </g:if>
    <g:elseif test="${params.action != 'create' && params.action != 'save'}">
        <g:link action="create"><i class="fa fa-plus"></i>&nbsp;<g:message code="default.new.label"  args="[entityName]"/></g:link>
    </g:elseif>
        %{--<g:link action="edit" id="${params.id}"><g:message code="default.edit.label"  args="[entityName]"/></g:link>--}%
    </section>
</g:if>
