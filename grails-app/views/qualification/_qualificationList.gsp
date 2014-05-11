<div class="content-container col-lg-12">

        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>

                    <g:sortableColumn property="code"
                                      title="${message(code: 'qualification.code.label', default: 'Code ')}"/>
                    <g:sortableColumn property="name"
                                      title="${message(code: 'qualification.name.label', default: 'Name')}"/>
                    <th><g:message code="qualification.description.label" default="Description"/></th>
                    <th><g:message code="qualification.mainTrade.label" default="Main Trade"/></th>
                    <th><g:message code="default.actions.label" default="Actions"/></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${searchResults?}" status="i" var="Qualification">
                    <tr>
                        <td>
                            ${Qualification.code}
                        </td>
                        <td>
                            <!-- If the user click the qualification name, the will be redirected to the show view of that qualification -->
                            <g:link action="show" data-placement="right" data-trigger="click" id="${Qualification.id}"
                                    elementId="${Qualification.id}">${Qualification.name}</g:link>
                        </td>
                        <td>
                            ${Qualification.description}
                        </td>
                        <td>
                            ${Qualification.canBeMainTrade}
                        </td>
                        <td>
                            <g:link action="edit" id="${Qualification.id}" class="btn btn-small"><g:message
                                    code="default.edit.label" args=" "/></g:link>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    <div class="pagination">
        <g:paginate total="${searchCount}"/>
    </div>
    </div>