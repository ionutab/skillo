<nav class="navbar navbar-fixed-top <%=Boolean.TRUE.equals((Boolean)session.getAttribute("user.layout.sidebar.narrow")) ? 'workspace-navbar-wide' : 'workspace-navbar-narrow' %>" id="workspace-navbar-absolute" role="navigation">
    <div class="navbar-header">
        <g:if test="${null != page_title}" >
            <h4 class="navbar-text navbar-right">${page_title}</h4>
        </g:if>
        <g:if test="${null == page_title}" >
            <h4>${params.controller} ${params.action}</h4>
        </g:if>
    </div>

    <ul class="nav navbar-nav navbar-right">
        <li><g:render template="/_menu/notifications"/></li>
        <g:render template="/_menu/user"/>
    </ul>

</nav>