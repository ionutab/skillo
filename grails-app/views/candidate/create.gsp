<%@ page import="skillo.Candidate" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="entityName" value="${message(code: 'candidate.label', default: 'Candidate')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <r:require modules="forms" />
</head>

<body>
<div class="row">
<div class="col-md-5">
    <div class="box box-solid">
        <div class="box-body">
            <g:form controller="candidate" action="save" class="form-horizontal" autocomplete="off" name="candidateCreateForm">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="form-group">
                            <label for="candidate.firstName" class="col-md-3 control-label">
                                <g:message code="candidate.firstName.label" default="First Name" />
                            </label>
                            <div class="col-md-9">
                                <g:textField class="form-control" id="firstName" name="candidate.firstName" value="${candidateInstance?.firstName}" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="candidate.lastName" class="col-md-3 control-label">
                                <g:message code="candidate.lastName.label" default="Last Name" />
                            </label>

                            <div class="col-md-9">
                                <g:textField class="form-control" id="lastName" name="candidate.lastName" value="${candidateInstance?.lastName}" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="candidate.birthDate" class="col-md-3 control-label">
                                <g:message code="candidate.birthDate.label" default="Birth Date" />
                            </label>

                            <div class="col-md-5">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <g:field type="textField" name="candidate.birthDate" id="candidateBirthDate" class="form-control datepicker" value="${formatDate(date: candidateInstance?.birthDate)}" default="none" />
                                    <g:javascript>
                                        $("#candidateBirthDate").inputmask("d/m/y", { "placeholder": "dd/mm/yyyy" });
                                    </g:javascript>
                                </div><!-- /.input group -->
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="candidate.telephoneNumber" class="col-md-3 control-label">
                                <g:message code="candidate.telephoneNumber.label" default="Telephone Number" />
                            </label>
                            <div class="col-md-5">
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-phone"></i>
                                    </div>
                                    <g:textField type="tel" name="candidate.telephoneNumber" class="form-control" value="${candidateInstance?.telephoneNumber}" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="address.details" class="col-md-3 control-label">
                                <g:message code="candidate.address.label" default="Address" />
                            </label>
                            <div class="col-md-9">
                                <g:textArea rows="2" name="address.details" id="address.details" class="form-control" value="${candidateInstance?.address?.details}" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="postCode.id" class="col-md-3 control-label">
                                <g:message code="postCode.code.label" default="Post Code" />
                            </label>
                            <div class="col-md-9">
                                <g:hiddenField
                                        name="postCode.id"
                                        id="postCodeId"
                                        value="${candidateInstance?.address?.postCode?.id}"
                                />
                                <g:hiddenField
                                        name="postCode.previousCode"
                                        id="postCodePlaceholder"
                                        value="${candidateInstance?.address?.postCode?.code} - ${candidateInstance?.address?.postCode?.country}"
                                />

                                <g:javascript>
                                        function formatPostCodeSelection(item) {
                                            return item.code + ' - ' + item.country;
                                        };

                                        function formatPostCodeResult(item) {
                                            return item.code + ' - ' + item.country;
                                        };
                                        function doWeHaveAPostCodeAlready(){
                                            return "Search for a Post Code";
                                        }
                                        $("#postCodeId").select2({
                                            placeholder: doWeHaveAPostCodeAlready,
                        //                                  VERY IMPORTANT
                                            minimumInputLength: 4,
                                            ajax:{
                                                url: '<g:createLink controller="postCode" action="getPostCodes" />',
                                                dataType: 'json',
                                                data: function(term, page){
                                                    return {inputCode: term};
                                                },
                                                results: function (data, page) {
                                                    return {results: data};
                                                }
                                            },
                                            initSelection: function(element, callback) {
                                                var id=$("#postCodeId").val();
                                                if (id!=="") {
                                                    $("#s2id_postCodeId .select2-chosen").html($("#postCodePlaceholder").val());
                                                }
                                            },
                                            formatSelection: formatPostCodeSelection,
                                            formatResult: formatPostCodeResult,
                                            escapeMarkup: function (m) { return m; }
                                        });
                                </g:javascript>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="candidate.email" class="col-md-3 control-label">
                                <g:message code="candidate.email.label" default="Email" />
                            </label>
                            <div class="col-md-9">
                                <g:field type="email" name="candidate.email" class="form-control" value="${candidateInstance?.email}" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="candidateMainTrade.id" class="col-md-3 control-label">
                                <g:message code="candidate.mainTrade.label" default="Main Trade" />
                            </label>
                            <div class="col-md-9">
                                <g:hiddenField
                                        name="candidateMainTrade.id"
                                        id="mainTradeId"
                                        class="form-control"
                                        value="${candidateInstance?.candidateQualifications?.asList()?.first()?.qualification?.id}"
                                />
                                <g:javascript>
                                    function formatCandidateQualification(item) { return item.name; };
                                    $("#mainTradeId").select2({
                                            data: {results:${AvailableMainTrades}, text:'name'},
                                            formatSelection: formatCandidateQualification,
                                            formatResult: formatCandidateQualification,
                                            placeholder: "Select a Qualification",
                                            allowClear:true
                                        }
                                    );
                                </g:javascript>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="candidate.driver" class="col-md-3 control-label">Driver</label>
                            <div class="col-md-9">
                                <g:radioGroup values="[true, false]" labels="['yes','no']" name="candidate.driver" value="${candidateInstance?.driver}">
                                    <label class="control-label">
                                        ${it.radio}&nbsp;${it.label}
                                    </label>
                                    &nbsp;
                                </g:radioGroup>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="candidate.sponsored" class="col-md-3 control-label">Sponsored</label>
                            <div class="col-md-9">
                                <g:radioGroup values="[true, false]" labels="['yes','no']" name="candidate.sponsored" value="${candidateInstance?.sponsored}">
                                    <label class="control-label">
                                        ${it.radio}&nbsp;${it.label}
                                    </label>
                                    &nbsp;
                                </g:radioGroup>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="candidate.carOwner" class="col-md-3 control-label">Car owner</label>
                            <div class="col-md-9">
                                <g:radioGroup values="[true, false]" labels="['yes','no']" name="candidate.carOwner" value="${candidateInstance?.carOwner}">
                                    <label class="control-label">
                                        ${it.radio}&nbsp;${it.label}
                                    </label>
                                    &nbsp;
                                </g:radioGroup>
                            </div>
                        </div>

                        <div class="col-md-offset-3">
                            <g:submitButton name="Finish" class="btn btn-success" />
                            %{--<g:actionSubmit value="Save And Edit" action="two" class="btn btn-success" />--}%
                            <g:link uri="/" class="btn btn-warning" name="Cancel">Cancel</g:link>
                        </div>

                    </div>

                </div>
            </g:form>
        </div>
    </div>
</div>

<g:render template="matches" />

</div>
</body>
</html>
