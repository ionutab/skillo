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
                                    <input type="text" class="form-control" name="birthDate" id="candidateBirthDate"
                                           data-inputmask="'alias': 'date'"/>
                                    <g:javascript>
                                        $("#candidateBirthDate").inputmask("d/m/y", { "placeholder": "dd/mm/yyyy" });
                                    </g:javascript>
                                </div><!-- /.input group -->
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="telephoneNumber" class="col-md-2 control-label">Telephone</label>

                            <div class="col-md-5">
                                <input type="text" class="form-control" id="telephoneNumber"
                                       name="candidate.telephoneNumber" placeholder="Telephone">
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
                            <label for="postCode" class="col-md-2 control-label">Post code</label>

                            <div class="col-md-5">
                                <input type="text" class="form-control" id="postCode" name="candidate.postCode"
                                       placeholder="Search for a post code">
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
                            <label for="trade" class="col-md-2 control-label">Trade</label>

                            <div class="col-md-5">
                                <input type="text" class="form-control" id="trade" name="candidate.trade"
                                       placeholder="Search for a qualification">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email" class="col-md-2 control-label">Driver</label>

                            <div class="col-md-5">
                                <label class="control-label">
                                    <input type="radio" name="optionsRadios" class="iradio_minimal" checked
                                           value="option1"/>
                                    &nbsp;yes
                                </label>
                                <label class="control-label">
                                    <input type="radio" name="optionsRadios" class="iradio_minimal" checked
                                           value="option1"/>
                                    &nbsp;no
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email" class="col-md-2 control-label">Sponsored</label>

                            <div class="col-md-5">
                                <label class="control-label">
                                    <input type="radio" name="optionsRadios2" class="iradio_minimal" checked
                                           value="option2"/>
                                    &nbsp;yes
                                </label>
                                <label class="control-label">
                                    <input type="radio" name="optionsRadios2" class="iradio_minimal" checked
                                           value="option2"/>
                                    &nbsp;no
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email" class="col-md-2 control-label">Car owner</label>

                            <div class="col-md-5">
                                <label class="control-label">
                                    <input type="radio" name="optionsRadios3" class="iradio_minimal" checked
                                           value="option3"/>
                                    &nbsp;yes
                                </label>
                                <label class="control-label">
                                    <input type="radio" name="optionsRadios3" class="iradio_minimal" checked
                                           value="option3"/>
                                    &nbsp;no
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email" class="col-md-2 control-label">Add a photo</label>

                            <div class="col-md-5">
                                <input type="file" id="exampleInputFile">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 text-center">
                        <g:submitButton name="Finish" class="btn btn-success btn"/>
                        <g:link uri="/" class="btn btn-warning" name="Cancel">Cancel</g:link>
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
</div>
</div>
</div>
</div>
</div>

</div>
</body>
</html>