<!-- 
This menu is used to show function that can be triggered on the content (an object or list of objects).
-->

<%-- Only show the "Pills" navigation menu if a controller exists (but not for home) --%>
<g:if test="${ params.controller != null && params.controller != '' &&	params.controller != 'home' }">
    <div class="row">
        <div class="col-lg-12">
            <ul id="Menu" class="nav nav-pills nav-pills-n">

                <g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />

                <li class="${ params.action == "list" ? 'active' : '' }">
                    <g:link action="list"><span class="glyphicon glyphicon-th-list"></span> <g:message code="default.list.label" args="[entityName]"/></g:link>
                </li>
                <li class="${ params.action == "create" ? 'active' : '' }">
                    <g:link action="create"><span class="glyphicon glyphicon-plus"></span> <g:message code="default.new.label"  args="[entityName]"/></g:link>
                </li>

                <g:if test="${ params.action == 'show' || params.action == 'edit' }">
                    <!-- the item is an object (not a list) -->
                    <li class="${ params.action == "edit" ? 'active' : '' }">
                        <g:link action="edit" id="${params.id}"><span class="glyphicon glyphicon-pencil"></span> <g:message code="default.edit.label"  args="[entityName]"/></g:link>
                    </li>
                    <li class="">
                        <g:render template="/_common/modals/deleteTextLink"/>
                    </li>
                </g:if>

            </ul>
        </div>
    </div>
</g:if>
