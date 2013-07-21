<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
			<a class="brand" href="${createLink(uri: '/i')}">
				${meta(name:'app.name')}
			</a>

            <div class="nav-collapse">
                <div class="pull-right">
                    <%--Right-side entries--%>
                    <%--NOTE: the following menus are in reverse order due to "pull-right" alignment (i.e., right to left)--%>
                    <g:render template="/_testmenu/testWorkspaceUser"/><!-- NOTE: the renderDialog for the "Register" modal dialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
                </div>

            </div>
		</div>
	</div>
</div>
