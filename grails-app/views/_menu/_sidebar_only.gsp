
%{--<g:javascript>--}%
%{--alert(<%=Boolean.TRUE.equals((Boolean)session.getAttribute("user.layout.sidebar.narrow")) %>);--}%
%{--</g:javascript>--}%

<div id="sidebar" class="bs-sidebar <%=Boolean.TRUE.equals((Boolean)session.getAttribute("user.layout.sidebar.narrow")) ? 'sidebar-narrow' : 'sidebar-wide' %>" role="complementary" >

    <div class="applogo">
        <div id="title-long" style="<%=Boolean.TRUE.equals((Boolean)session.getAttribute("user.layout.sidebar.narrow")) ? 'display:none' : '' %>"><a class="brand" href="${createLink(uri: '/')}"><h4><g:meta name="app.title" /></h4></a></div>
        <div id="title-short" style="<%=Boolean.TRUE.equals((Boolean)session.getAttribute("user.layout.sidebar.narrow")) ? '' : 'display:none' %>"><a class="brand" href="${createLink(uri: '/')}"><h4><g:meta name="app.title.short" /></h4></a></div>
    </div>

    <ul class="nav bs-sidenav">
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
                        <span class="glyphicon glyphicon-${conf.icon}"></span>
                        <span class="navlink" style="<%=Boolean.TRUE.equals((Boolean)session.getAttribute("user.layout.sidebar.narrow")) ? 'display:none' : '' %>"><g:message code="${item}.label" default="${item.capitalize()}"/></span>
                    </g:link>
                </g:if>
                <g:if test="${conf.items}">
                    <a href="#" data-toggle="collapse" data-target=".sidebar-${item}">
                        <span class="glyphicon glyphicon-${conf.icon}"></span>
                        <g:message code="${item}.label" default="${item.capitalize()}"/>
                    </a>
                    <ul class="nav collapse sidebar-${item}">
                        <g:each var="subitem,subconf" in="${conf.items}">
                            <li class="${subconf.uri && request.forwardURI.substring(request.contextPath.length()) == subconf.uri || subconf.controller && params.controller == subconf.controller ? " active" : ""}">
                                <g:link controller="${subconf.controller}" uri="${subconf.uri}">
                                    <span class="glyphicon glyphicon-${subconf.icon}"></span>
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
        <li>
            <a class="" href="#" id="toggle-sidebar" data-toggle="tooltip" title="toggle sidebar" onmouseover="alertToggleSidebar();" onclick="toggleSidebar();">
                <span id="toggle-sidebar-icon" class="glyphicon <%=Boolean.TRUE.equals((Boolean)session.getAttribute("user.layout.sidebar.narrow")) ? 'glyphicon-arrow-right' : 'glyphicon-arrow-left' %>"></span>
            </a>
        </li>
    </ul>

    <div class="" style="margin-left: 10px">

    </div>

</div>
<g:javascript>

    function alertToggleSidebar(){

        $('#toggle-sidebar').tooltip('toggle');
    }

    function toggleSidebar(){

        if($("li.sidebar-item > a > span").is(":visible") && $("#sidebar").hasClass("sidebar-wide")){
            $("li.sidebar-item > a > span.navlink").hide();
            $("#title-long").hide();
            $("#title-short").show();
        } else {
            $("li.sidebar-item > a > span.navlink").show();
            $("#title-short").hide();
            $("#title-long").show();
        }
        $("#sidebar").toggleClass("sidebar-wide sidebar-narrow");
        $("#workspace-content-container").toggleClass("workspace-narrow workspace-wide");
        $("#workspace-navbar-absolute").toggleClass("workspace-navbar-narrow workspace-navbar-wide");
        $("#toggle-sidebar-icon").toggleClass("glyphicon-arrow-right glyphicon-arrow-left");
        <g:remoteFunction controller="session" action="ajaxToggleSidebar" />
    };

</g:javascript>

