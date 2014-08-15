<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="admin_lte_layout" />
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
    <g:set var="entityNaturalName" value="${clientInstance.name}" />
    <g:set var="page_title" value="${entityNaturalName}" scope="request"/>
    <title>
        <g:message code="default.edit.label" args="[entityNaturalName]" />
    </title>
    <r:require modules="forms"/>
</head>
<body>

<div class="row">
    <div class="col-md-3">
        <div class="box box-solid">
            <div class="box-body">
                <div class="row">
                    <g:render template="/client/basicInformation" model="[clientInstance: clientInstance]" />
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-9">
        <div class="row top10">
            <g:if test="${ clientInstance?.contacts?.size() == 0}">

                <div class="page-background-info">
                    <h2>You have not yet added any contacts to this client. Use the form below to add contacts.</h2>
                </div>
            </g:if>
            <g:else>
                <g:each in="${clientInstance?.contacts}" var="contact">
                    <g:if test="${contact?.active}">
                        <div class="col-sm-6 col-md-6">
                            <div class="box box-solid">
                                <div class="box-header">
                                    <g:form method="post" url="[controller: 'client']" >
                                        <g:hiddenField name="clientContact.id" value="${contact.id}" />
                                        <h3 class="box-title">${contact.getFullName()}</h3>
                                        <div class="box-tools pull-right">
                                            %{--<button class="btn btn-default btn-sm" data-toggle="tooltip" title="" data-original-title="Edit"><i class="fa fa-pencil"></i></button>--}%
                                            <g:actionSubmit class="btn btn-danger btn-sm" data-toggle="tooltip" action="deleteClientContact" id="${contact?.id}" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" formmethod="post" />
                                        </div>
                                    </g:form>
                                </div>
                                <div class="box-body">
                                    <dl class="dl-horizontal">
                                        <g:if test="${contact.telephoneNumber != null}">
                                            <dt><g:message code="contact.telephoneNumber.label" default="Telephone nr"/></dt>
                                            <dd>${contact.telephoneNumber}</dd>
                                        </g:if>
                                        <g:if test="${contact.landlineNumber != null}">
                                            <dt><g:message code="contact.landlineNumber.label" default="Landline nr"/></dt>
                                            <dd>${contact.landlineNumber}</dd>
                                        </g:if>
                                        <g:if test="${contact.email != null}">
                                            <dt><g:message code="contact.email.label" default="Email"/></dt>
                                            <dd>${contact.email}</dd>
                                        </g:if>
                                        <g:if test="${contact.role != null}">
                                            <dt><g:message code="contact.role.label" default="Role"/></dt>
                                            <dd>${contact.role}</dd>
                                        </g:if>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </g:if>
                </g:each>
            </g:else>
        </div>
        <div class="row top10">
            <div class="col-md-12">
                <div class="box box-solid">
                    <g:if test="${ clientInstance?.contacts?.size() > 0}">
                        <div class="box-header">
                            <div class="col-md-12 col-sm-12">
                                <span>Add a new Client Contact</span>
                            </div>
                        </div>
                    </g:if>
                    <div class="box-body">
                        <g:form controller="client" action="addClientContact" autocomplete="off" role="form" class="form-horizontal" method="POST" id="clientCreateContactForm" >
                            <div class="row">
                                <g:render template="../contact/createContactFormSplit" model="['clientInstance':clientInstance, 'newClientContact':newClientContact]"/>
                            </div>
                            <div>
                                <g:submitButton name="create" class="btn btn-success" value="${message(code: 'default.button.save.label', default: 'Save')}" />
                                <g:link controller="client" action="list" class="btn" name="Cancel">Cancel</g:link>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>