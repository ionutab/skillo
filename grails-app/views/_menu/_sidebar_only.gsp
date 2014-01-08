
%{--<g:javascript>--}%
%{--alert(<%=Boolean.TRUE.equals((Boolean)session.getAttribute("user.layout.sidebar.narrow")) %>);--}%
%{--</g:javascript>--}%

<div id="sidebar" class="<%=Boolean.TRUE.equals((Boolean)session.getAttribute("user.layout.sidebar.narrow")) ? 'sidebar-narrow' : 'sidebar-wide' %>">

    <div id="applogo">
        <div>
            <span id="title-long" style="<%=Boolean.TRUE.equals((Boolean)session.getAttribute("user.layout.sidebar.narrow")) ? 'display:none' : '' %>"><a class="brand" href="${createLink(uri: '/')}"><h4>Skill°</h4></a></span>
            <span id="title-short" style="<%=Boolean.TRUE.equals((Boolean)session.getAttribute("user.layout.sidebar.narrow")) ? '' : 'display:none' %>"><a class="brand" href="${createLink(uri: '/')}"><h4>S°</h4></a></span>
        </div>
    </div>

    <ul class="nav nav-list">
        <g:each var="item,conf" in="[
                'home' : [uri:'/', icon:'home'],
                'candidate' : [controller:'candidate', icon:'list'],
                'qualifications' : [controller:'qualification', icon:'bookmark'],
                'clients' : [controller:'client', icon:'briefcase'],
                'map' : [uri:'/map', icon:'globe']
        ]">
            <li class="${conf.uri && request.forwardURI.substring(request.contextPath.length()) == conf.uri || conf.controller && params.controller == conf.controller ? " active" : ""}  sidebar-item" >
                <g:if test="${conf.controller || conf.uri}">
                    <g:link controller="${conf.controller}" uri="${conf.uri}">
                        <i class="icon-${conf.icon}"></i>
                        <span style="<%=Boolean.TRUE.equals((Boolean)session.getAttribute("user.layout.sidebar.narrow")) ? 'display:none' : '' %>"><g:message code="${item}.label" default="${item.capitalize()}"/></span>
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
                                    <span><g:message code="${subitem}.label" default="${subitem.capitalize()}"/></span>
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
    <br/>
    <div class="" style="margin-left: 15px">
        <a class="btn btn-mini" href="#" id="toggle-sidebar" data-toggle="tooltip" title="toggle sidebar" onmouseover="alertToggleSidebar();" onclick="toggleSidebar();">
            <i class="icon-arrow-left"></i>
        </a>
    </div>
</div><!--/.well -->
<g:javascript>

    function alertToggleSidebar(){

        $('#toggle-sidebar').tooltip('toggle');
    }

    function toggleSidebar(){

        if($("li.sidebar-item > a > span").is(":visible") && $("#sidebar").hasClass("sidebar-wide")){
            $("li.sidebar-item > a > span").hide();
            $("#title-long").hide();
            $("#title-short").show();
        } else {
            $("li.sidebar-item > a > span").show();
            $("#title-short").hide();
            $("#title-long").show();
        }
        $("#sidebar").toggleClass("sidebar-wide sidebar-narrow");
        $("#workspace-content-container").toggleClass("workspace-narrow workspace-wide");
        $("#workspace-navbar-absolute").toggleClass("workspace-navbar-narrow workspace-navbar-wide");
        <g:remoteFunction controller="session" action="ajaxToggleSidebar" />
    };

</g:javascript>

