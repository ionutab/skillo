<%--
  Created by IntelliJ IDEA.
  User: Andrei-Home
  Date: 7/12/2014
  Time: 2:35 PM
--%>

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

                <div class="row">
                    <div class="col-xs-12 text-center">
                        <div class="img-thumbnail">
                            <g:img dir="images/avatar" file="avatar04.png"/>
                        </div>

                        <h2 class="bold">Dorel</h2>
                        <h4>ES (Engineering Supervisor)</h4>


                        <div class="col-xs-12">
                            <table class="table table-striped">
                                <tbody>
                                <tr>
                                    <td>Status</td>
                                    <td><span class="label label-success">Active</span></td>
                                </tr>
                                <tr>
                                    <td>User Rating</td>
                                    <td><i class="fa fa-star text-yellow fa-fw"></i><i
                                            class="fa fa-star text-yellow fa-fw"></i><i
                                            class="fa fa-star text-yellow fa-fw"></i>
                                        <i class="fa fa-star  fa-fw"></i><i
                                            class="fa fa-star  fa-fw"></i></td>
                                </tr>
                                <tr>
                                    <td>Member Since</td>
                                    <td>Jan 07, 2014</td>
                                </tr>
                                <tr>
                                    <td>Added by</td>
                                    <td>Katie</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>

            </div>
        </g:uploadForm>

    </div>
</div>

<div class="col-md-9">
<g:form controller="consultant" action="saveSettings" class="form-horizontal" autocomplete="off">
<div class="row">
<div class="col-md-12">
<div class="nav-tabs-custom">
<ul class="nav nav-tabs">
    <li class="active"><a href="#tab_1" data-toggle="tab">Profile</a></li>
    <li><a href="#tab_2" data-toggle="tab">Projects</a></li>
    <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
</ul>

<div class="tab-content">
<div class="tab-pane active" id="tab_1">
<div class="row">
<div class="col-md-12">
<div class="box box-solid">
<div class="box-header">
    <h3 class="box-title"><i class="fa fa-user"></i>&nbsp;ABOUT</h3>

    <div class="box-tools pull-right">
        <a class="btn btn-sm bg-yellow"><i
                class="fa fa-pencil append-icon"></i> Edit</a>
    </div>
</div>

<div class="box-body">
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label for="firstName"
                       class="col-md-3 control-label">
                    <g:message code="candidate.firstName.label"
                               default="First Name"/>
                </label>

                <div class="col-sm-4">
                    <input type="text" class="form-control"
                           id="firstName"
                           name="consultant.firstName"
                           value="Andrei" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="candidateBirthDate"
                       class="col-md-3 control-label">
                    <g:message code="candidate.birthDate.label"
                               default="Birth Date"/>
                </label>

                <div class="col-sm-4">
                    <input type="textField" class="form-control"
                           id="candidateBirthDate"
                           name="candidate.birthDate"
                           value="15/08/1988" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="address.details"
                       class="col-md-3 control-label">
                    <g:message code="candidate.address.label"
                               default="Address"/>
                </label>

                <div class="col-md-4">
                    <input type="text" rows="2"
                           name="address.details"
                           id="address.details" class="form-control"
                           value="Nicolina" disabled/>
                </div>
            </div>

            <div class="form-group">
                <label for="candidate.email"
                       class="col-md-3 control-label">
                    <g:message code="candidate.email.label"
                               default="Email"/>
                </label>

                <div class="col-md-4">
                    <input type="text"
                           name="candidate.email"
                           id="candidate.email" class="form-control"
                           value="andrei@yahoo.com" disabled/>
                </div>
            </div>

            <div class="form-group">
                <label for="candidate.driver"
                       class="col-md-3 control-label">Driver</label>

                <div class="col-md-9 " aria-checked="true" aria-disabled="true">
                    <g:radioGroup values="[true, false]" labels="['yes', 'no']"
                                  name="candidate.driver" value="true" disabled="">
                        <label class="control-label">
                            ${it.radio}&nbsp;${it.label}
                        </label>
                        &nbsp;
                    </g:radioGroup>
                </div>
            </div>

            <div class="form-group">
                <label for="candidate.carOwner"
                       class="col-md-3 control-label">Car owner</label>

                <div class="col-md-4">
                    <g:radioGroup values="[true, false]" labels="['yes', 'no']"
                                  name="candidate.carOwner" value="true" disabled="">
                        <label class="control-label">
                            ${it.radio}&nbsp;${it.label}
                        </label>
                        &nbsp;
                    </g:radioGroup>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <label for="lastName"
                       class="col-md-3 control-label">
                    <g:message code="candidate.lastName.label"
                               default="Last Name"/>
                </label>

                <div class="col-sm-4">
                    <input type="text" class="form-control"
                           id="lastName"
                           name="consultant.lastName"
                           value="Ene" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="telephoneNumber"
                       class="col-md-3 control-label">
                    <g:message
                            code="candidate.telephoneNumber.label"
                            default="Telephone Number"/>
                </label>

                <div class="col-md-4">
                    <div class="input-group">
                        <div class="input-group-addon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <input type="text" class="form-control"
                               id="telephoneNumber"
                               name="candidate.telephoneNumber"
                               value="0751101282" disabled>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="postCodeId"
                       class="col-md-3 control-label">
                    <g:message code="postCode.code.label"
                               default="Post Code"/>
                </label>

                <div class="col-md-4">
                    <input type="text" class="form-control"
                           id="postCodeId"
                           name="postCode.id"
                           value="AB10 Scotland" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="candidateMainTrade.id"
                       class="col-md-3 control-label">
                    <g:message code="candidate.mainTrade.label"
                               default="Main Trade"/>
                </label>

                <div class="col-md-4">
                    <input type="text" class="form-control"
                           id="candidateMainTrade.id"
                           name="candidateMainTrade.id"
                           value="ES (Engineering Supervisor)" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="candidate.sponsored"
                       class="col-md-3 control-label">Sponsored</label>

                <div class="col-md-4">
                    <g:radioGroup values="[true, false]" labels="['yes', 'no']"
                                  name="candidate.sponsored" value="true" disabled="">
                        <label class="control-label">
                            ${it.radio}&nbsp;${it.label}
                        </label>
                        &nbsp;
                    </g:radioGroup>
                </div>
            </div>

            <div class="form-group">
                <label for="consultant"
                       class="col-md-3 control-label">
                    <g:message code="candidate.owningConsultant.label"
                               default="Consultant"/>
                </label>

                <div class="col-sm-4">
                    <input type="text" class="form-control"
                           id="consultant"
                           name="consultant.name"
                           value="John Sephard" disabled>
                </div>
            </div>
        </div>
    </div>

</div><!-- /.box-body -->
%{--  <div class="box-footer">
      <code>.box-footer</code>
  </div><!-- /.box-footer-->--}%
</div>

</div>

<div class="col-md-12">
<div class="box box-solid">
<div class="row">
<div class="col-md-6">
    <div class="box-header">

        <h3 class="box-title"><i class="fa fa-file-text-o"></i>&nbsp;Qualifications</h3>

        <div class="box-tools pull-right">
            <a class="btn btn-sm bg-yellow"><i
                    class="fa fa-pencil append-icon"></i> Edit</a>
        </div>
    </div>

    <div class="box-body">
        <div class="row">
            <div class="content-container">
                <ul class="list">
                    <tr>
                        <td>
                            <span class="menu-icon">
                                <i class="fa  fa-circle-o"></i>
                            </span> <span class="menu-text">
                            360 Driver Above 10 Tonnes
                        </br>
                            <span class="menu-info">
                                <span class="menu-date">March 2013 ~ Now</span>
                            </span>
                        </span>
                        </td>
                    </tr>
                </ul>
                <ul class="list">
                    <tr>
                        <td>
                            <span class="menu-icon">
                                <i class="fa  fa-circle-o"></i>
                            </span> <span class="menu-text">
                            Asbestos Awareness
                        </br>
                            <span class="menu-info">
                                <span class="menu-date">Expired</span>
                            </span>
                        </span>
                        </td>
                    </tr>
                </ul>
                <ul class="list">
                    <tr>
                        <td>
                            <span class="menu-icon">
                                <i class="fa  fa-circle-o"></i>
                            </span> <span class="menu-text">
                            Abrasive Wheel
                        </br>
                            <span class="menu-info">
                                <span class="menu-date">March 2013 ~ >March 2014</span>
                            </span>
                        </span>
                        </td>
                    </tr>
                </ul>
                <ul class="list">
                    <tr>
                        <td>
                            <span class="menu-icon">
                                <i class="fa  fa-circle-o"></i>
                            </span> <span class="menu-text">
                            Banksman
                        </br>
                            <span class="menu-info">
                                <span class="menu-date">May 2013 ~ December 2014</span>
                            </span>
                        </span>
                        </td>
                    </tr>
                </ul>
                <ul class="list">
                    <tr>
                        <td>
                            <span class="menu-icon">
                                <i class="fa  fa-circle-o"></i>
                            </span> <span class="menu-text">
                            180 Driver
                        </br>
                            <span class="menu-info">
                                <span class="menu-date">March 2012 ~ March 2015</span>
                            </span>
                        </span>
                        </td>
                    </tr>
                </ul>
            </div>
        </div>
    </div>

</div>

<div class="col-md-6">
    <div class="box-header">

        <h3 class="box-title"><i class="fa  fa-money"></i>&nbsp;Payment Information</h3>

        <div class="box-tools pull-right">
            <a class="btn btn-sm bg-yellow"><i
                    class="fa fa-pencil append-icon"></i> Edit</a>
        </div>
    </div>

    <div class="box-body">
        <div class="row">
            <div class="form-group">
                <label for="payrollCompany"
                       class="col-md-4 control-label">
                    <g:message code="payroll.payrollCompany.label"
                               default="Payroll Company"/>
                </label>

                <div class="col-sm-5">
                    <input type="text" class="form-control"
                           id="payrollCompany"
                           name="candidate.payrollCompany"
                           value="My Company LTD" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="referenceNr"
                       class="col-md-4 control-label">
                    <g:message code="payroll.reference.number.label"
                               default="Reference Nr."/>
                </label>

                <div class="col-sm-5">
                    <input type="text" class="form-control"
                           id="referenceNr"
                           name="candidate.referenceNr"
                           value="J234 H3451KL" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="registrationNr"
                       class="col-md-4 control-label">
                    <g:message code="payroll.registration.number.label"
                               default="Registration Nr."/>
                </label>

                <div class="col-sm-5">
                    <input type="text" class="form-control"
                           id="registrationNr"
                           name="candidate.registrationNr"
                           value="J234 H3451KL" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="taxReferenceNr"
                       class="col-md-4 control-label">
                    <g:message code="payroll.unique.tax.reference.number.label"
                               default="Unique Tax Reference Nr."/>
                </label>

                <div class="col-sm-5">
                    <input type="text" class="form-control"
                           id="taxReferenceNr"
                           name="candidate.referenceNr"
                           value="72 H 299920KL" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="insuranceNumber"
                       class="col-md-4 control-label">
                    <g:message code="payroll.national.insurance.number.label"
                               default="Payroll Company"/>
                </label>

                <div class="col-sm-5">
                    <input type="text" class="form-control"
                           id="insuranceNumber"
                           name="candidate.insuranceNumber"
                           value="27361937456" disabled>
                </div>
            </div>

            <div class="form-group">
                <label for="candidate.registered"
                       class="col-md-4 control-label">Registered</label>

                <div class="col-md-5 " aria-checked="true" aria-disabled="true">
                    <g:radioGroup values="[true, false]" labels="['yes', 'no']"
                                  name="candidate.registered" value="true" disabled="">
                        <label class="control-label">
                            ${it.radio}&nbsp;${it.label}
                        </label>
                        &nbsp;
                    </g:radioGroup>
                </div>
            </div>

            <div class="form-group">
                <label for="candidate.inducted"
                       class="col-md-4 control-label">Inducted</label>

                <div class="col-md-5 " aria-checked="true" aria-disabled="true">
                    <g:radioGroup values="[true, false]" labels="['yes', 'no']"
                                  name="candidate.inducted" value="true" disabled="">
                        <label class="control-label">
                            ${it.radio}&nbsp;${it.label}
                        </label>
                        &nbsp;
                    </g:radioGroup>
                </div>
            </div>
        </div>

    </div>

</div>
</div>
</div>

</div>
</div>
</div><!-- /.tab-pane -->
<div class="tab-pane" id="tab_2">
    The European languages are members of the same family. Their separate existence is a myth.
    For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ
    in their grammar, their pronunciation and their most common words. Everyone realizes why a
    new common language would be desirable: one could refuse to pay expensive translators. To
    achieve this, it would be necessary to have uniform grammar, pronunciation and more common
    words. If several languages coalesce, the grammar of the resulting language is more simple
    and regular than that of the individual languages.
</div><!-- /.tab-pane -->
</div><!-- /.tab-content -->
</div>
</div>
</div>
</g:form>

</div>
</div>
</body>
</html>