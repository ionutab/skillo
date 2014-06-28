<html>
<head>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="page_title" value="${message(code: 'dashboard.welcome.label')}" scope="request"/>
</head>

<body>

<div class="row">
    <div class="col-md-12">
        <div class="box box-solid">
            <form role="form">
                <div class="box-body">
                    <div class="row">
                        <div class="col-xs-3">
                            <input type="text" class="form-control" placeholder=".col-xs-5">
                        </div>

                        <div class="col-xs-3">
                            <input type="text" class="form-control" placeholder=".col-xs-5">
                        </div>

                        <div class="col-xs-2">
                            <input type="text" class="form-control" placeholder=".col-xs-5">
                        </div>

                        <div class="col-xs-2">
                            <input type="text" class="form-control" placeholder=".col-xs-5">
                        </div>

                        <div class="col-xs-2">
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button onclick="candidateSearchFormFunctions.resetForm(this);" type="reset"
                                    class="btn btn-info input-sm"><span class="glyphicon glyphicon-refresh"></span>
                            </button>
                            %{--<button type="button" class="btn btn-info input-sm" data-toggle="button"><span class="glyphicon glyphicon-arrow-down"></span></button>--}%
                        </div>
                    </div>
                </div><!-- /.box-body -->

            </form>
        </div>
    </div>
</div>


<div class="row">
<div class="col-md-12">
<div class="box box-solid">
<div class="box-body">
<div class="row">
<div class="col-md-8 col-sm-8">
    <div class="table-responsive">
        <!-- THE MESSAGES -->
        <table class="table">
            <thead>
            <tr>

                <th class="sortable"><a
                        href="/skillo/candidate/list?sort=firstName&amp;order=asc">Full Name</a>
                </th>
                <th>Telephone</th>
                <th>Address</th>
                <th>Post Code</th>
                <th>Trade</th>

            </tr>
            </thead>
            <tbody>

            <tr>
                <td>

                    <a href="/skillo/candidate/display/1"
                       onclick="jQuery.ajax({type: 'POST', url: '/skillo/candidate/display/1', success: function (data, textStatus) {
                           jQuery('#displayCandidate').html(data);
                       }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                       }});
                       return false;" id="1">Alexandru Bujdei</a>

                    <div id="popover_content_wrapper_1" style="display: none">
                        <div>
                            <p><b>By Consultant:</b> John Shepard</p>

                            <p><b>Email:</b> bujdeialexandru@gmail.com</p>

                            <p><b>Driver:</b> true</p>

                            <p><b>Car Owner:</b> true</p>
                        </div>
                    </div>
                </td>
                <td>
                    40745763293
                </td>
                <td>
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr>
            <tr class="unread">
                <td class="small-col"><div class="icheckbox_minimal" aria-checked="false"
                                           aria-disabled="false" style="position: relative;"><input
                            type="checkbox" style="position: absolute; opacity: 0;"><ins
                            class="iCheck-helper"
                            style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                </div></td>
                <td class="small-col"><i class="fa fa-star"></i></td>
                <td class="name"><a href="#">John Doe</a></td>
                <td class="subject"><a href="#">Urgent! Please read</a></td>
                <td class="time">12:30 PM</td>
            </tr>
            <tr>
                <td class="small-col"><div class="icheckbox_minimal" aria-checked="false"
                                           aria-disabled="false" style="position: relative;"><input
                            type="checkbox" style="position: absolute; opacity: 0;"><ins
                            class="iCheck-helper"
                            style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                </div></td>
                <td class="small-col"><i class="fa fa-star-o"></i></td>
                <td class="name"><a href="#">John Doe</a></td>
                <td class="subject"><a href="#">Urgent! Please read</a></td>
                <td class="time">12:30 PM</td>
            </tr>
            <tr>
                <td class="small-col"><div class="icheckbox_minimal" aria-checked="false"
                                           aria-disabled="false" style="position: relative;"><input
                            type="checkbox" style="position: absolute; opacity: 0;"><ins
                            class="iCheck-helper"
                            style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                </div></td>
                <td class="small-col"><i class="fa fa-star-o"></i></td>
                <td class="name"><a href="#">John Doe</a></td>
                <td class="subject"><a href="#">Urgent! Please read</a></td>
                <td class="time">12:30 PM</td>
            </tr>
            <tr class="unread">
                <td class="small-col"><div class="icheckbox_minimal" aria-checked="false"
                                           aria-disabled="false" style="position: relative;"><input
                            type="checkbox" style="position: absolute; opacity: 0;"><ins
                            class="iCheck-helper"
                            style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                </div></td>
                <td class="small-col"><i class="fa fa-star-o"></i></td>
                <td class="name"><a href="#">John Doe</a></td>
                <td class="subject"><a href="#">Urgent! Please read</a></td>
                <td class="time">12:30 PM</td>
            </tr>
            <tr>
                <td class="small-col"><div class="icheckbox_minimal" aria-checked="false"
                                           aria-disabled="false" style="position: relative;"><input
                            type="checkbox" style="position: absolute; opacity: 0;"><ins
                            class="iCheck-helper"
                            style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                </div></td>
                <td class="small-col"><i class="fa fa-star"></i></td>
                <td class="name"><a href="#">John Doe</a></td>
                <td class="subject"><a href="#">Urgent! Please read</a></td>
                <td class="time">12:30 PM</td>
            </tr>
            <tr>
                <td class="small-col"><div class="icheckbox_minimal" aria-checked="false"
                                           aria-disabled="false" style="position: relative;"><input
                            type="checkbox" style="position: absolute; opacity: 0;"><ins
                            class="iCheck-helper"
                            style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                </div></td>
                <td class="small-col"><i class="fa fa-star"></i></td>
                <td class="name"><a href="#">John Doe</a></td>
                <td class="subject"><a href="#">Urgent! Please read</a></td>
                <td class="time">12:30 PM</td>
            </tr>
            <tr>
                <td class="small-col"><div class="icheckbox_minimal" aria-checked="false"
                                           aria-disabled="false" style="position: relative;"><input
                            type="checkbox" style="position: absolute; opacity: 0;"><ins
                            class="iCheck-helper"
                            style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                </div></td>
                <td class="small-col"><i class="fa fa-star-o"></i></td>
                <td class="name"><a href="#">John Doe</a></td>
                <td class="subject"><a href="#">Urgent! Please read</a></td>
                <td class="time">12:30 PM</td>
            </tr>
            <tr>
                <td class="small-col"><div class="icheckbox_minimal" aria-checked="false"
                                           aria-disabled="false" style="position: relative;"><input
                            type="checkbox" style="position: absolute; opacity: 0;"><ins
                            class="iCheck-helper"
                            style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                </div></td>
                <td class="small-col"><i class="fa fa-star"></i></td>
                <td class="name"><a href="#">John Doe</a></td>
                <td class="subject"><a href="#">Urgent! Please read</a></td>
                <td class="time">12:30 PM</td>
            </tr>
            <tr class="unread">
                <td class="small-col"><div class="icheckbox_minimal" aria-checked="false"
                                           aria-disabled="false" style="position: relative;"><input
                            type="checkbox" style="position: absolute; opacity: 0;"><ins
                            class="iCheck-helper"
                            style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                </div></td>
                <td class="small-col"><i class="fa fa-star-o"></i></td>
                <td class="name"><a href="#">John Doe</a></td>
                <td class="subject"><a href="#">Urgent! Please read</a></td>
                <td class="time">12:30 PM</td>
            </tr>
            <tr class="unread">
                <td class="small-col"><div class="icheckbox_minimal" aria-checked="false"
                                           aria-disabled="false" style="position: relative;"><input
                            type="checkbox" style="position: absolute; opacity: 0;"><ins
                            class="iCheck-helper"
                            style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                </div></td>
                <td class="small-col"><i class="fa fa-star-o"></i></td>
                <td class="name"><a href="#">John Doe</a></td>
                <td class="subject"><a href="#">Urgent! Please read</a></td>
                <td class="time">12:30 PM</td>
            </tr>
            <tr>
                <td class="small-col"><div class="icheckbox_minimal" aria-checked="false"
                                           aria-disabled="false" style="position: relative;"><input
                            type="checkbox" style="position: absolute; opacity: 0;"><ins
                            class="iCheck-helper"
                            style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins>
                </div></td>
                <td class="small-col"><i class="fa fa-star-o"></i></td>
                <td class="name"><a href="#">John Doe</a></td>
                <td class="subject"><a href="#">Urgent! Please read</a></td>
                <td class="time">12:30 PM</td>
            </tr>
            </tbody>
        </table>
    </div><!-- /.table-responsive -->
</div><!-- /.col (RIGHT) -->
<div class="col-md-4 col-sm-4">
    <!-- BOXES are complex enough to move the .box-header around.
                                                 This is an example of having the box header within the box body -->
    <div class="box-header">
        <h3 class="box-title">John Steward Madison the IIrd</h3>
        %{--<h2 class="box-title">John Steward Madison the IIrd Achmed Giovanni ionesc pandele </h2>--}%
    </div>
    %{--
    <div class="row">
        <div class="col-sm-3">
            <label>First Name:</label>
        </div>
        <div class="col-sm-9">
            <span>Mariah</span>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3">
            <label>Last Name:</label>
        </div>
        <div class="col-sm-9">
            <p>Caraiban</p>
        </div>
    </div>
    --}%
    <div class="box-body">
        <div class="row">
            <div class="col-sm-12">
                <a class="btn btn-sm bg-yellow" %{--style="position: absolute; top: 5px; right: 5px;"--}%><i
                        class="fa fa-pencil append-icon"></i> Edit</a>
                <a class="btn btn-sm bg-yellow" %{--style="position: absolute; top: 5px; right: 5px;"--}%><i
                        class="fa fa-star append-icon"></i>Star</a>
            </div>

        </div>
        <br />
        <p class="text-light-blue">Main Trade qualification</p>
        <p class="">Other Competence</p>
        <p class="">Other Competence</p>
        <p class="text-yellow">Qualification will expire in < 2 weeks</p>
        <p class="text-red">Qualification expired.</p>
        <div class="row">
            <div class="col-sm-3">
                <label><i class="fa fa-phone"></i></label>
            </div>
            <div class="col-sm-9">
                <p>0040745763293</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <label>Email:</label>
            </div>
            <div class="col-sm-9">
                <p>vasilevasilica@vasile.com</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <label>Car: </label>
            </div>
            <div class="col-sm-9">
                <p>Yes</p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3">
                <label>Birthday: </label>
            </div>
            <div class="col-sm-3">
                <p>06/01/1977</p>
            </div>
            <div class="col-sm-3">
                <label>Age: </label>
            </div>
            <div class="col-sm-3">
                <p>37</p>
            </div>
        </div>
    <div class="row">
        <div class="col-sm-3">
            <label>Consultant: </label>
        </div>
        <div class="col-sm-9">
            <p>John Shepard</p>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3">
            <label>Rating</label>
        </div>
        <div class="col-sm-9">
            <i class="fa fa-star text-yellow fa-fw"></i><i class="fa fa-star text-success fa-fw"></i><i class="fa fa-star text-green fa-fw"></i><i class="fa fa-star vd_yellow fa-fw"></i><i class="fa fa-star vd_yellow fa-fw"></i>
        </td>
    </div>
    </div>
</div>
</div><!-- /.col (LEFT) -->

</div><!-- /.row -->
</div><!-- /.box-body -->
<div class="box-footer clearfix">
    <div class="pull-right">
        <small>Showing 1-12/1,240</small>
        <button class="btn btn-xs btn-primary"><i class="fa fa-caret-left"></i></button>
        <button class="btn btn-xs btn-primary"><i class="fa fa-caret-right"></i></button>
    </div>
</div><!-- box-footer -->
</div><!-- /.box -->
</div><!-- /.box -->
</div>
</body>
</html>