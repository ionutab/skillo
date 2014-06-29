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
            <g:form controller="consultant" action="index">
                <div class="box-body">
                    <h4>John Steward Madison the IIrd</h4>
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <div class="img-thumbnail">
                                <img alt="example image" src="images/avatar/female-icon.jpg">
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
            </g:form>

        </div>
    </div>

    <div class="col-md-9">
        <div class="box box-solid">
        <g:form controller="consultant" action="index" class="form-horizontal" autocomplete="off">
            <div class="box-body">
                <h4><i class="fa fa-wrench"></i>&nbsp;Account settings</h4>
                %{--<a href="#" data-toggle="tooltip" title="Some tooltip text!">Hover over me</a>--}%

                <!-- Generated markup by the plugin -->
                <div class="tooltip top" role="tooltip">
                <div class="tooltip-arrow"></div>
                <div class="tooltip-inner">
                    Some tooltip text!
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group has-error">
                            <label for="firstName" class="col-sm-2 control-label">First name</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First name">
                            </div>
                            <span class="help-block">some error text</span>
                        </div>
                        <div class="form-group has-error">
                            <label for="lastName" class="col-sm-2 control-label">Last name</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last name">
                                %{--<label class="control-label" for="lastName" style="font-size: 10px;">Input with error</label>--}%
                                <label class="control-label" for="lastName">Input with error</label>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <h4><i class="fa fa-globe"></i>&nbsp;Contact settings</h4>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">Email Address</label>
                            <div class="col-sm-5">
                                <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="telephone" class="col-sm-2 control-label">Mobile Phone</label>
                            <div class="col-sm-5">
                                <input type="tel" class="form-control" id="telephone" name="telephone" placeholder="Mobile Phone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="website" class="col-sm-2 control-label">Website</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="website" name="website" placeholder="Website">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="facebook" class="col-sm-2 control-label">Facebook</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="facebook" name="facebook" placeholder="Facebook">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="twitter" class="col-sm-2 control-label">Twitter</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="twitter" name="twitter" placeholder="Twitter" autocomplete="off">
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <h4><i class="fa fa-key"></i>&nbsp;Password settings</h4>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="u_password" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="u_password" name="u_password" placeholder="Old Password" autocomplete="off" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="newPassword" class="col-sm-2 control-label">New password</label>
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="New password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="retypePassword" class="col-sm-2 control-label">Re-type password</label>
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="retypePassword" name="retypePassword" placeholder="Re-type password">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button class="btn btn-success btn"><i class="fa fa-check-square-o"></i>Finish</button>
                        <button class="btn btn-warning btn"><i class="fa fa-ban"></i>Cancel</button>
                    </div>
                </div>
            </div>
        </g:form>
        </div>
    </div>
</div>
</body>
</html>