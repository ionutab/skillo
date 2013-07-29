
<div class="well sidebar sidebar-fixed">
    <ul class="nav nav-list">
        <li class="${params.controller == null ? "active" : ""}">
            <a class="brand" href="${createLink(uri: '/')}">
                <i class="icon-home"></i>
                <span><g:message code="default.home.label"/></span>
            </a>
        </li>
        <g:each var="c,i" in="['candidate':'user','client':'briefcase']">
            <li class="controller${params.controller == c ? " active" : ""}">
                    <g:link controller="${c}" action="index">
                        <i class="icon-${i}"></i>
                        <g:message code="${c}.label" default="${c.capitalize()}"/>
                    </g:link>
            </li>
        </g:each>
        <li class="${params.view == 'map' ? "active" : ""}">
            <a class="brand" href="${createLink(uri: '/map')}">
                <i class="icon-map-marker"></i>
                <span><g:message code="default.map.label"/></span>
            </a>
        </li>
    </ul>
</div><!--/.well -->

