<g:set var="editable" value="${params.action == 'edit' || params.action == 'updateMainDetails' || params.action == 'updatePaymentDetails'}"/>

<div class="col-md-12">
    <div class="box box-solid">
        <div class="box-header">
            <div class="box-body">
                <g:if test="${editable}">
                    <g:uploadForm controller="candidate" action="documentsUpload" class="form-horizontal"
                                  enctype="multipart/form-data">
                        <g:hiddenField name="id" value="${candidateInstance?.id}"/>
                        <g:hiddenField name="candidate.currentVersion" value="${candidateInstance?.version}"/>


                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <input id="files" type="file" name="files" multiple="multiple"/>
                                            </div>

                                            <div class="col-sm-3">
                                                <button class="btn btn-primary btn-sm">Upload</button>
                                                <button class="btn btn-default btn-sm">Cancel</button>
                                            </div>

                                        </div>

                                        <p class="help-block">Max 10 MB each file</p>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </g:uploadForm>
                </g:if>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group ">
                            <g:if test="${documentInstanceList == null || documentInstanceList.size() == 0}">
                                <hr>

                                <div class="col-lg-12 col-lg-offset-0 page-background-info">
                                    <g:message code="document.notFound.label"/>
                                    <br>
                                    <br>
                                </div>
                            </g:if>
                            <g:else>
                                <table class="table">
                                    <tbody>
                                    <g:each in="${documentInstanceList}" status="i" var="documentInstance">
                                        <td><g:link action="documentDownload"
                                                    id="${documentInstance.id}">${documentInstance.filename}</g:link></td>
                                        <td>${documentInstance.type}</td>
                                        <td>${documentInstance.humanReadableSize}</td>
                                        <td><g:formatDate date="${documentInstance.uploadDate}"/></td>


                                        <g:hasErrors bean="${documentInstance}">
                                            <ul>
                                                <g:eachError var="err" bean="${documentInstance}">
                                                    <li>${err}</li>
                                                </g:eachError>
                                            </ul>
                                        </g:hasErrors>

                                        </tr>
                                    </g:each>
                                    </tbody>
                                </table>
                            </g:else>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>