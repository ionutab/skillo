<%--
  Created by IntelliJ IDEA.
  User: Andrei-Home
  Date: 6/28/2014
  Time: 11:21 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="admin_lte_layout" />
    <g:set var="layout_nocontextbar" value="false" scope="request" />
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <div class="box-body">
            <div class="row">
                <div class="col-sm-3">
                        <div class="col-sm-12">
                            <div class="box-header text-center">
                                <h3 class="box-title margin 20 ">John Steward Madison the IIrd</h3>
                            </div>
                        </div>
                        <div class="col-xs-12 text-center">
                            <div class="img-thumbnail img-responsive margin 20">
                                <img alt="example image" src="images/avatar/female-icon.jpg" style="width: 240px; height: 240px;">
                            </div>
                            <div class=" text-center margin 20">
                                <a class="btn btn-primary btn-md  bg-blue" href="javascript:void(0);">
                                    <i class="fa fa-cloud-upload append-icon"></i> Upload
                                </a>
                            </div>

                            <div class="text-center margin 20">
                                <address>
                                    <strong>Twitter, Inc.</strong><br>
                                    795 Folsom Ave, Suite 600<br>
                                    San Francisco, CA 94107<br>
                                    <abbr title="Phone">P:</abbr> (123) 456-7890
                                </address>
                            </div>
                            <div>
                                <i class="fa fa-star text-yellow fa-fw"></i><i class="fa fa-star text-success fa-fw"></i><i class="fa fa-star text-green fa-fw"></i><i class="fa fa-star vd_yellow fa-fw"></i><i class="fa fa-star vd_yellow fa-fw"></i>
                            </div>
                        </div>
                </div>

                <div class="col-sm-9">
                    <div class="col-sm-12">
                        <div class="box-header">
                            <h3 class="box-title margin 20 "><label><i class="fa fa-wrench"></i></label>Account settings</h3>
                        </div>
                    </div>

                    <div class="col-md-12 text-center">
                        <div class="box-body margin 40">
                            <div class="row margin 20">
                                <div class="col-md-2 text-left">
                                    <label class="control-label" style="font-size:20px">Email address</label>
                                </div>

                                <div class="col-md-10 ">
                                    <input class="form-control input-group-lg" type="text" placeholder="email@yourcompany.com">
                                </div>
                            </div>
                            <div class="row margin 20">
                                <div class="col-md-2  text-left">
                                    <label class="control-label" style="font-size:20px">Username</label>
                                </div>

                                <div class="col-md-10 ">
                                    <input class="form-control input-group-lg" type="text" placeholder="username">
                                </div>
                            </div>
                            <div class="row margin 20">
                                <div class="col-md-2  text-left">
                                    <label class="control-label" style="font-size:20px">Password</label>
                                </div>

                                <div class="col-md-10 ">
                                    <input class="form-control input-group-lg" type="password" placeholder="current password">
                                </div>
                            </div>
                            <div class="row margin 20">
                                <div class="col-md-2  text-left">
                                    <label class="control-label" style="font-size:20px">New password</label>
                                </div>

                                <div class="col-md-10 ">
                                    <input class="form-control input-group-lg" type="password" placeholder="new password">
                                </div>
                            </div>
                            <div class="row margin 20">
                                <div class="col-md-2  text-left">
                                    <label class="control-label" style="font-size:20px">Re-type password</label>
                                </div>

                                <div class="col-md-10 ">
                                    <input class="form-control input-group-lg" type="password" placeholder="re-type password">
                                </div>
                            </div>
                        </div>
                        <hr>
                    </div>

                    <div class="col-sm-12">
                        <div class="box-header">
                            <h3 class="box-title margin 20 "><label><i class="fa fa-globe"></i></label>Contact settings</h3>
                        </div>
                    </div>

                    <div class="col-md-12 text-center">
                        <div class="box-body margin 40">
                            <div class="row margin 20">
                                <div class="col-md-2 text-left">
                                    <label class="control-label" style="font-size:20px">Mobile Phone</label>
                                </div>

                                <div class="col-md-10 ">
                                    <input class="form-control input-group-lg" type="text" placeholder="mobile phone">
                                </div>
                            </div>
                            <div class="row margin 20">
                                <div class="col-md-2  text-left">
                                    <label class="control-label" style="font-size:20px">Website</label>
                                </div>

                                <div class="col-md-10 ">
                                    <input class="form-control input-group-lg" type="text" placeholder="website">
                                </div>
                            </div>
                            <div class="row margin 20">
                                <div class="col-md-2  text-left">
                                    <label class="control-label" style="font-size:20px">Facebook</label>
                                </div>

                                <div class="col-md-10 ">
                                    <input class="form-control input-group-lg" type="password" placeholder="facebook">
                                </div>
                            </div>
                            <div class="row margin 20">
                                <div class="col-md-2  text-left">
                                    <label class="control-label" style="font-size:20px">Twitter</label>
                                </div>

                                <div class="col-md-10 ">
                                    <input class="form-control input-group-lg" type="password" placeholder="twitter">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="box-body margin 40">
                            <div class="row margin 20">
                                <button class="btn btn-success btn"><label><i class="fa  fa-check-square-o"></i></label>Finish</button>
                                <button class="btn btn-warning btn"><label><i class="fa   fa-ban"></i></label>Cancel</button>
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