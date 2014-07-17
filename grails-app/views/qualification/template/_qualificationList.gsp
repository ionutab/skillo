<div class="box box-solid">
    <div class="box-body">
        <div class="row">
            <div class="col-md-12 col-sm-12">

                <g:if test="${searchResults.size() == 0}">

                    <div class="col-lg-6 col-lg-offset-3 page-background-info">
                        <h2><g:message code="qualification.search.notFound.label"/></h2>
                    </div>

                </g:if>
                <g:else>

                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>

                                <th><g:message code="qualification.code.label" default="Code"></g:message>
                                <th><g:message code="qualification.name.label" default="Name"></g:message>
                                <th><g:message code="qualification.description.label" default="Description"/></th>
                                <th><g:message code="qualification.mainTrade.label" default="Main Trade"/></th>
                                <th><g:message code="default.actions.label" default="Actions"/></th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${searchResults ?}" status="i" var="Qualification">
                                <tr>
                                    <td>
                                        ${Qualification.code}
                                    </td>
                                    <td>
                                        <!-- If the user click the qualification name, the will be redirected to the show view of that qualification -->
                                        <g:link action="show" data-placement="right" data-trigger="click"
                                                id="${Qualification.id}"
                                                elementId="${Qualification.id}">${Qualification.name}</g:link>
                                    </td>
                                    <td>
                                        ${Qualification.description}
                                    </td>
                                    <td>
                                        ${Qualification.canBeMainTrade}
                                    </td>
                                    <td>
                                        <g:link action="edit" id="${Qualification.id}"><g:message
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
                </g:else>
            </div>
        </div>
    </div>
</div>