
<div class="well sidebar sidebar-fixed">
    <ul class="nav nav-list">
        <g:each var="item,conf" in="[
                'home' : [uri:'/', icon:'home'],
                'candidates' : [icon:'user',
                        items: ['directory' : [controller:'candidate', icon:'folder-open'],
                                'qualifications' : [controller:'qualification', icon:'bookmark']
                        ]
                ],
                'clients' : [controller:'client', icon:'briefcase'],
                'map' : [uri:'/map', icon:'globe']
        ]">
            <li class="${conf.uri && request.forwardURI.substring(request.contextPath.length()) == conf.uri || conf.controller && params.controller == conf.controller ? " active" : ""}">
                <g:if test="${conf.controller || conf.uri}">
                    <g:link controller="${conf.controller}" uri="${conf.uri}">
                        <i class="icon-${conf.icon}"></i>
                        <g:message code="${item}.label" default="${item.capitalize()}"/>
                    </g:link>
                </g:if>
                <g:if test="${conf.items}">
                    <a href="#" data-toggle="collapse" data-target=".sidebar-${item}">
                        <i class="icon-${conf.icon}"></i>
                        <g:message code="${item}.label" default="${item.capitalize()}"/>
                    </a>
                    <ul class="nav nav-list collapse sidebar-${item}">
                        <g:each var="subitem,subconf" in="${conf.items}">
                            <li class="${subconf.uri && request.forwardURI.substring(request.contextPath.length()) == subconf.uri || subconf.controller && params.controller == subconf.controller ? " active" : ""}">
                                <g:link controller="${subconf.controller}" uri="${subconf.uri}">
                                    <i class="icon-${subconf.icon}"></i>
                                    <g:message code="${subitem}.label" default="${subitem.capitalize()}"/>
                                </g:link>
                            </li>
                            <g:if test="${subconf.uri && request.forwardURI.substring(request.contextPath.length()) == subconf.uri || subconf.controller && params.controller == subconf.controller}">
                                <script>
                                    $(".sidebar-${item}").addClass('in');
                                </script>
                            </g:if>
                        </g:each>
                    </ul>
                </g:if>
            </li>
        </g:each>
    </ul>
</div><!--/.well -->

