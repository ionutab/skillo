<html>
<head>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="page_title" value="${message(code: 'dashboard.welcome.label')}" scope="request"/>
</head>

<body>

<div class="row">
    <div class="col-md-12">
            <form role="form">
                    <div class="row">
                        <div class="col-xs-3">
                            <input type="text" class="form-control" placeholder="First Name">
                        </div>

                        <div class="col-xs-3">
                            <input type="text" class="form-control" placeholder="Last Name">
                        </div>

                        <div class="col-xs-2">
                            <input type="text" class="form-control" placeholder="Telephone nr">
                        </div>

                        <div class="col-xs-2">
                            <input type="text" class="form-control" placeholder="Main trade">
                        </div>

                        <div class="col-xs-2">
                            <button type="submit" class="btn btn-primary">Search</button>
                            <button onclick="candidateSearchFormFunctions.resetForm(this);" type="reset"
                                    class="btn btn-info input-sm"><span class="glyphicon glyphicon-refresh"></span>
                            </button>
                            %{--<button type="button" class="btn btn-info input-sm" data-toggle="button"><span class="glyphicon glyphicon-arrow-down"></span></button>--}%
                        </div>
                    </div>

            </form>
    </div>
</div>


<div class="row">
<div class="col-md-12">
<div class="box box-solid">
<div class="box-body">
<div class="row">
<div class="col-md-7 col-sm-7">
    <div class="table-responsive">
        <!-- THE MESSAGES -->
        <table class="table">
            <thead>
            <tr>

                <th class="sortable"><a
                        href="/skillo/candidate/list?sort=firstName&amp;order=asc">Full Name</a>
                </th>
                %{--<th>Telephone</th>--}%
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
                %{--<td>--}%
                    %{--40745763293--}%
                %{--</td>--}%
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
            <tr>
                <td>

                    <a href="/skillo/candidate/display/1"
                       onclick="jQuery.ajax({type: 'POST', url: '/skillo/candidate/display/1', success: function (data, textStatus) {
                           jQuery('#displayCandidate').html(data);
                       }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                       }});
                       return false;" id="1">Alexandru Bujdei</a>

                    <div id="" style="display: none">
                        <div>
                            <p><b>By Consultant:</b> John Shepard</p>

                            <p><b>Email:</b> bujdeialexandru@gmail.com</p>

                            <p><b>Driver:</b> true</p>

                            <p><b>Car Owner:</b> true</p>
                        </div>
                    </div>
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

            </tr><tr>
                <td>

                    <a href="/skillo/candidate/display/1"
                       onclick="jQuery.ajax({type: 'POST', url: '/skillo/candidate/display/1', success: function (data, textStatus) {
                           jQuery('#displayCandidate').html(data);
                       }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                       }});
                       return false;" id="1">Alexandru Bujdei</a>

                    <div id="" style="display: none">
                        <div>
                            <p><b>By Consultant:</b> John Shepard</p>

                            <p><b>Email:</b> bujdeialexandru@gmail.com</p>

                            <p><b>Driver:</b> true</p>

                            <p><b>Car Owner:</b> true</p>
                        </div>
                    </div>
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

            </tr><tr>
                <td>

                    <a href="/skillo/candidate/display/1"
                       onclick="jQuery.ajax({type: 'POST', url: '/skillo/candidate/display/1', success: function (data, textStatus) {
                           jQuery('#displayCandidate').html(data);
                       }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                       }});
                       return false;" id="1">Alexandru Bujdei</a>

                    <div id="" style="display: none">
                        <div>
                            <p><b>By Consultant:</b> John Shepard</p>

                            <p><b>Email:</b> bujdeialexandru@gmail.com</p>

                            <p><b>Driver:</b> true</p>

                            <p><b>Car Owner:</b> true</p>
                        </div>
                    </div>
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

            </tr><tr>
                <td>

                    <a href="/skillo/candidate/display/1"
                       onclick="jQuery.ajax({type: 'POST', url: '/skillo/candidate/display/1', success: function (data, textStatus) {
                           jQuery('#displayCandidate').html(data);
                       }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                       }});
                       return false;" id="1">Alexandru Bujdei</a>

                    <div id="" style="display: none">
                        <div>
                            <p><b>By Consultant:</b> John Shepard</p>

                            <p><b>Email:</b> bujdeialexandru@gmail.com</p>

                            <p><b>Driver:</b> true</p>

                            <p><b>Car Owner:</b> true</p>
                        </div>
                    </div>
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

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
                <td>

                    <a href="/skillo/candidate/display/1"
                       onclick="jQuery.ajax({type: 'POST', url: '/skillo/candidate/display/1', success: function (data, textStatus) {
                           jQuery('#displayCandidate').html(data);
                       }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                       }});
                       return false;" id="1">Alexandru Bujdei</a>

                    <div id="" style="display: none">
                        <div>
                            <p><b>By Consultant:</b> John Shepard</p>

                            <p><b>Email:</b> bujdeialexandru@gmail.com</p>

                            <p><b>Driver:</b> true</p>

                            <p><b>Car Owner:</b> true</p>
                        </div>
                    </div>
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

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr><tr>
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
                    str. A. Panu, nr. 34
                </td>
                <td>
                    AB10 1AG
                </td>
                <td>

                    360 Driver Bellow 10 Tonnes

                </td>

            </tr>
            </tbody>
        </table>
    </div><!-- /.table-responsive -->
</div><!-- /.col (RIGHT) -->
<div class="col-md-5 col-sm-5">
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
                <a class="btn btn-sm bg-yellow" %{--style="position: absolute; top: 5px; right: 5px;"--}%><i
                        class="fa fa-plus-square append-icon"></i>&nbsp;Add to</a>
                <a class="btn btn-sm bg-yellow" %{--style="position: absolute; top: 5px; right: 5px;"--}%><i
                        class="fa fa-print append-icon"></i>&nbsp;PDF</a>
            </div>

        </div>
        <br />
        <p class="text-light-blue"><b>Main Trade qualification (always first) </b></p>
        <p class="">Other Competence ( with no set exp. date )</p>
        <a href="#"><p class="">Other Competence </p></a>
        <p class="text-yellow">Qualification will expire in < 2 months (setting maybe) </p>
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