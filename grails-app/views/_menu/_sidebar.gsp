<aside class="left-side sidebar-offcanvas" >
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- search form -->
        %{--
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                        <button type="submit" name="seach" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
                    </span>
                </div>
            </form>
        --}%
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <g:each var="item,conf" in="[
                    'home' : [uri:'/', icon:'home'],
                    'candidate' : [controller:'candidate', icon:'list'],
                    'qualifications' : [controller:'qualification', icon:'bookmark'],
                    'clients' : [controller:'client', icon:'briefcase'],
                    'placement' : [controller: 'placement', icon:'pushpin'],
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
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>