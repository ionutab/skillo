<div class="navbar navbar-fixed-top dark-font-navbar">
      <div class="%{--navbar-inner--}%">
        <div class="container-fluid">
			<a class="brand" href="${createLink(uri: '/')}">
				${meta(name:'app.name')}
			</a>

            <div class="nav-collapse">
                <div class="pull-right">
                    <%--Right-side entries--%>
                    
                    <g:if test="${params.controller != 'login'}">
                    
	                    <%--NOTE: the following menus are in reverse order due to "pull-right" alignment (i.e., right to left)--%>
	                    <g:render template="/_menu/user"/><!-- NOTE: the renderDialog for the "Register" modal dialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
	                    
                    </g:if>
                </div>
            </div>
            
		</div>
	</div>
</div>
