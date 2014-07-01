<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="layout_nocontextbar" value="false" scope="request"/>
</head>

<body>
<div class="row">
<div class="col-md-3">
    <div class="box box-solid">
        <g:uploadForm controller="consultant" action="uploadPhoto" enctype="multipart/form-data" method="POST">
            <div class="box-body">
                <h4 class="text-center">${consultant.firstName + " " + consultant.lastName}</h4>

                <div class="row">
                    <div class="col-xs-12 text-center">
                        <div class="img-thumbnail">
                            <g:img dir="images/avatar" file="female-icon.jpg"/>
                        </div>

                        <div class="box-tools text-center">
                            <a class="btn btn-primary btn-md  bg-blue" href="javascript:void(0);">
                                <i class="fa fa-cloud-upload append-icon"></i> Upload
                            </a>
                        </div>

                        <div class="box-tools">
                            <address>
                                <strong>Twitter, Inc.</strong><br>
                                795 Folsom Ave, Suite 600<br>
                                San Francisco, CA 94107<br>
                                <abbr title="Phone">P:</abbr> (123) 456-7890
                            </address>
                        </div>

                        <div class="box-tools">
                            <i class="fa fa-star text-yellow fa-fw"></i><i
                                class="fa fa-star text-success fa-fw"></i><i
                                class="fa fa-star text-green fa-fw"></i><i class="fa fa-star vd_yellow fa-fw"></i><i
                                class="fa fa-star vd_yellow fa-fw"></i>
                        </div>
                    </div>

                </div>

            </div>
        </g:uploadForm>

    </div>
</div>

<div class="col-md-9">
    <div class="box box-solid">
        <g:form controller="consultant" action="saveSettings" class="form-horizontal" autocomplete="off">
            <div class="box-body">
                <h4><i class="fa fa-wrench"></i>&nbsp;Account settings</h4>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group ${hasErrors(bean: consultant, field: 'firstName', 'has-error')}">
                            <label for="firstName" class="col-sm-2 control-label">First name</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="firstName" name="consultant.firstName"
                                       placeholder="First name" value="${consultant.firstName}">
                                <g:eachError var="err" bean="${consultant}"  field="firstName">
                                    <g:if test="${err.code == 'matches.invalid'}">
                                        <span class="control-label"><g:message
                                                code="custom.invalid.name.message"/></span>
                                    </g:if>
                                    <g:if test="${err.code == 'blank'}">
                                        <span class="control-label"><g:message code="custom.null.message"/></span>
                                    </g:if>
                                </g:eachError>
                            </div>
                        </div>

                        <div class="form-group ${hasErrors(bean: consultant, field: 'lastName', 'has-error')}">
                            <label for="lastName" class="col-sm-2 control-label">Last name</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="lastName" name="consultant.lastName"
                                       placeholder="Last name" value="${consultant.lastName}">
                                <g:eachError var="err" bean="${consultant}" field="lastName">
                                    <g:if test="${err.code == 'matches.invalid'}">
                                        <span class="control-label"><g:message
                                                code="custom.invalid.name.message"/></span>
                                    </g:if>
                                    <g:if test="${err.code == 'blank'}">
                                        <span class="control-label"><g:message code="custom.null.message"/></span>
                                    </g:if>
                                </g:eachError>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <h4><i class="fa fa-globe"></i>&nbsp;Contact settings</h4>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group ${hasErrors(bean: consultant, field: 'email', 'has-error')}">
                            <label for="email" class="col-sm-2 control-label">Email Address</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="email" name="consultant.email"
                                       placeholder="Email" value="${consultant.email}">
                                <g:eachError var="err" bean="${consultant}" field="email">
                                    <g:if test="${err.code == 'email.invalid'}">
                                        <span class="control-label" ><g:message
                                            code="custom.invalid.email.message"/><span>
                                    </g:if>
                                    <g:if test="${err.code == 'blank'}">
                                        <span><g:message code="custom.null.message"/></span>
                                    </g:if>
                                </g:eachError>
                            </div>
                        </div>

                        <div class="form-group ${hasErrors(bean: consultant, field: 'companyName', 'has-error')}">
                            <label for="companyName" class="col-sm-2 control-label">Company</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="companyName" name="consultant.companyName"
                                       placeholder="Company name" value="${consultant.companyName}">
                                <g:eachError var="err" bean="${consultant}" field="companyName">
                                    <g:if test="${err.code == 'blank'}">
                                        <span><g:message code="custom.null.message"/></span>
                                    </g:if>
                                    <g:if test="${err.code == 'nullable'}">
                                        <span><g:message code="custom.null.message"/></span>
                                    </g:if>
                                </g:eachError>
                            </div>
                        </div>

                        <div class="form-group ${hasErrors(bean: consultant, field: 'telephoneNumber', 'has-error')}">
                            <label for="telephoneNumber" class="col-sm-2 control-label">Telephone</label>

                            <div class="col-sm-5">
                                <input type="tel" class="form-control" id="telephoneNumber"
                                       name="consultant.telephoneNumber" placeholder="Telephone Number"
                                       value="${consultant.telephoneNumber}">
                                <g:hasErrors bean="${consultant}" field="telephoneNumber">
                                    <g:eachError var="err" bean="${consultant}" field="telephoneNumber">
                                        <g:if test="${err.code == 'matches.invalid'}">
                                            <span class="control-label"><g:message
                                                    code="custom.invalid.telephone.message"/></span>
                                        </g:if>
                                        <g:if test="${err.code == 'blank'}">
                                            <span class="control-label"><g:message code="custom.null.message"/></span>
                                        </g:if>
                                    </g:eachError>
                                </g:hasErrors>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="website" class="col-sm-2 control-label">Website</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="website" name="consultant.website"
                                       placeholder="Website"
                                       value="${consultant.website}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="facebook" class="col-sm-2 control-label">Facebook</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="facebook" name="consultant.facebook"
                                       placeholder="Facebook"
                                       value="${consultant.facebook}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="twitter" class="col-sm-2 control-label">Twitter</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="twitter" name="consultant.twitter"
                                       placeholder="Twitter" autocomplete="off"
                                       value="${consultant.twitter}">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <g:submitButton name="Finish" class="btn btn-success btn"/>
                        <g:link uri="/" class="btn btn-warning" name="Cancel">Cancel</g:link>
                    </div>
                </div>
            </div>
        </g:form>
    </div>

    <div class="box box-solid">
        <g:form controller="consultant" action="savePassword" class="form-horizontal"
                autocomplete="off">
            <div class="box-body ">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                    <i class="fa fa-key"></i>&nbsp;Password settings
                                </a>
                            </h4>
                        </div>
                        <div class="row">
                        <div id="collapseOne" class="panel-collapse collapse  in">
                                <div class="panel-body">
                                  <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="u_password" class="col-sm-2 control-label">Password</label>

                                            <div class="col-sm-5">
                                                <input type="password" class="form-control" id="u_password"
                                                       name="u_password"
                                                       placeholder="Old Password" autocomplete="off">
            </div>
        </div>

            <div class="form-group">
                <label for="newPassword" class="col-sm-2 control-label">New password</label>

                <div class="col-sm-5">
                    <input type="password" class="form-control" id="newPassword"
                           name="newPassword"
                           placeholder="New password">
                </div>
            </div>

            <div class="form-group">
                <label for="retypePassword"
                       class="col-sm-2 control-label">Re-type password</label>

                <div class="col-sm-5">
                    <input type="password" class="form-control" id="retypePassword"
                           name="retypePassword"
                           placeholder="Re-type password">
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
            <g:submitButton name="Update" class="btn btn-success btn"/>
            </div>
        </div>

        </div>
        </div>
        </g:form>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
</div>
</div>
</body>
</html>