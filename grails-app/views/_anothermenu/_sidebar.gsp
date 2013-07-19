<div class="well sidebar sidebar-fixed">
    <ul class="nav nav-list">
        <g:each status="i" var="c" in="['qualification','candidate']">
            <li class="controller${params.controller == c ? " active" : ""}">
                <g:link controller="${c}" action="index">
                    <g:message code="${c}.label" default="${c.capitalize()}"/>
                </g:link>
            </li>
        </g:each>
    </ul>
</div><!--/.well -->
