<div id="displayContacts">
    <g:each in="${clientInstance?.contacts}" var="contact">
        <div class="box box-solid">
            <div class="box-header">
                <g:form method="post" url="[controller: 'client']" >
                    <g:hiddenField name="clientContact.id" value="${contact.id}" />
                    <h3 class="box-title">
                        ${contact.getFullName()}
                    </h3>
                </g:form>
	            <div class="box-tools pull-right">
                                <g:remoteLink
                                    class="btn btn-sm"
									controller="client"
									action="displayContactComments"
									id="${contact.id}"
									elementId="${contact.id}"
									update="contactCommentsContainer"
									onLoaded="slimClientList()">
									&nbsp;${contact?.contactComments?.size()}&nbsp;comments&nbsp;
								</g:remoteLink>
								&nbsp;
								<g:remoteLink class="btn btn-sm"
								              controller="client"
								              action="display" id="${contact.id}"
								              elementId="${contact.id}"
								              update="clientContactDetailsContainer">
									<i class="fa fa-pencil"></i>
								</g:remoteLink>
								%{--<button class="btn btn-info btn-sm" data-widget="remove"><i class="fa fa-times"></i></button>--}%
	            </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-sm-6">
                        <g:if test="${contact.telephoneNumber != null}">
                            <span><g:message code="contact.telephoneNumber.short.label" default="Telephone nr"/>:&nbsp;</span>
                            <span>${contact.telephoneNumber}</span>
                            <br/>
                        </g:if>
                        <g:if test="${contact.email != null}">
                            <span><g:message code="contact.email.label" default="Email"/>:&nbsp;</span>
                            <span>${contact.email}</span>
                            <br/>
                        </g:if>
                    </div>
                    <div class="col-sm-6">
                        <g:if test="${contact.landlineNumber != null}">
                            <span><g:message code="contact.landlineNumber.short.label" default="Landline nr"/>:&nbsp;</span>
                            <span>${contact.landlineNumber}</span>
                            <br/>
                        </g:if>
                        <g:if test="${contact.role != null}">
                            <span><g:message code="contact.role.label" default="Role"/>:&nbsp;</span>
                            <span>${contact.role}</span>
                            <br/>
                        </g:if>
                    </div>
                </div>
            </div>
        </div>
    </g:each>
</div>

<div id="clientContactDetailsContainer">
	<g:render template="../contact/createContactModal" model="['clientInstance':clientInstance]"/>
</div>
