<div id="workspace-navbar-absolute" class="<%=Boolean.TRUE.equals((Boolean)session.getAttribute("user.layout.sidebar.narrow")) ? 'workspace-navbar-wide' : 'workspace-navbar-narrow' %>" >
    <g:if test="${null != page_title}" >
        <div class="pull-left" style="position: relative; left: 20px; color: #FFFFFF;">
            <h4>${page_title}</h4>
        </div>
    </g:if>

    <div class="pull-right" style="position: relative; right: 5px; top: 5px;">
        <g:render template="/_menu/user"/>
    </div>


</div>