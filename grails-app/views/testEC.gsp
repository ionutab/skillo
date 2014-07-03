<%--
  Created by IntelliJ IDEA.
  User: Andrei-Home
  Date: 7/1/2014
  Time: 11:13 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="page_title" value="${message(code: 'dashboard.welcome.label')}" scope="request"/>
</head>

<body>
<div class="row">
    <div class="col-md-6">
    <div class="box box-solid">
        <g:form controller="candidate" action="save" class="form-horizontal" autocomplete="off">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="firstName" class="col-md-2 control-label">First name</label>

                            <div class="col-md-5">
                                <input type="text" class="form-control" id="firstName" name="candidate.firstName"
                                       placeholder="First name">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="lastName" class="col-md-2 control-label">Last name</label>

                            <div class="col-md-5">
                                <input type="text" class="form-control" id="lastName" name="candidate.lastName"
                                       placeholder="Last name">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="birthDate" class="col-md-2 control-label">Birth date</label>
                             <div class="col-md-5">
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control"  id = "birthDate" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="">
                            </div><!-- /.input group -->
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="telephoneNumber" class="col-md-2 control-label">Telephone</label>

                            <div class="col-md-5">
                                <input type="text" class="form-control" id="telephoneNumber" name="candidate.telephoneNumber"
                                       placeholder="Telephone">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="address" class="col-md-2 control-label">Address</label>

                            <div class="col-md-5">
                                <textarea rows="3" class="form-control" id="address" name="candidate.address"
                                       placeholder="Candidate address"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email" class="col-md-2 control-label">Email</label>

                            <div class="col-md-5">
                                <input type="text" class="form-control" id="email" name="candidate.email"
                                       placeholder="Email address">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="radio">
                                <label class="">
                                    <div class="iradio_minimal checked" aria-checked="true" aria-disabled="false" style="position: relative;"><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                    Option one is this and that—be sure to include why it's great
                                </label>
                            </div>
                            <div class="radio">
                                <label class="">
                                    <div class="iradio_minimal" aria-checked="false" aria-disabled="false" style="position: relative;"><input type="radio" name="optionsRadios" id="optionsRadios2" value="option2" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                    Option two can be something else and selecting it will deselect option one
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <div class="iradio_minimal disabled" aria-checked="false" aria-disabled="true" style="position: relative;"><input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" disabled="" style="position: absolute; opacity: 0;"><ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
                                    Option three is disabled
                                </label>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </g:form>
    </div>
</div>


<div class="col-md-6">
    <div class="box box-solid">
        <div class="box-body">
            <div class="row">
                <div class="col-xs-12 text-center">
                    Here will be some candidate suggestions
                </div>
            </div>
        </div>
    </div>
</div>

</div>
</body>
</html>