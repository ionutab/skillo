<g:set var="editable" value="${params.action == 'edit'}" />

<div class="col-md-12">
<div class="box box-solid">
<div class="box-header">

    <g:if test="${!editable}">
        <div class="box-tools pull-right">
            <g:link controller="candidate" action="edit" id="${candidateInstance?.id}" class="btn btn-sm bg-yellow"><i class="fa fa-pencil append-icon"></i>Edit</g:link>
        </div>
    </g:if>

</div>

<div class="box-body">
    <g:form controller="candidate" action="save" class="form-horizontal" autocomplete="off">

        <g:hiddenField name="id" value="${candidateInstance?.id}" />
        <g:hiddenField name="version" value="${candidateInstance?.version}" />

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="candidate.firstName" class="col-md-3 control-label">
                        <g:message code="candidate.firstName.label" default="First Name" />
                    </label>

                    <div class="col-sm-9">
                        <g:textField name="candidate.firstName" class="form-control" value="${candidateInstance?.firstName}" disabled="${!editable}" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="candidate.birthDate"
                           class="col-md-3 control-label">
                        <g:message code="candidate.birthDate.label"
                                   default="Birth Date"/>
                    </label>

                    <div class="col-sm-9">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <g:field type="textField" name="candidate.birthDate" id="candidateBirthDate" class="form-control datepicker" value="${formatDate(date: candidateInstance?.birthDate)}" default="none" disabled="${!editable}" />
                            <g:javascript>
                                $("#candidateBirthDate").inputmask("d/m/y", { "placeholder": "dd/mm/yyyy" });
                            </g:javascript>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="telephoneNumber"
                           class="col-md-3 control-label">
                        <g:message
                                code="candidate.telephoneNumber.label"
                                default="Telephone Number"/>
                    </label>

                    <div class="col-md-9">
                        <div class="input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <g:textField type="tel" id="telephoneNumber" name="candidate.telephoneNumber" class="form-control" value="${candidateInstance?.telephoneNumber}" disabled="${!editable}"/>
                            <g:javascript>
                                $("#telephoneNumber").inputmask("99999-999-999", {"placeholder":"_____-___-___"});
                            </g:javascript>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="candidate.email"
                           class="col-md-3 control-label">
                        <g:message code="candidate.email.label"
                                   default="Email"/>
                    </label>

                    <div class="col-md-9">
                        <g:textField name="candidate.email" class="form-control" value="${candidateInstance?.email}" disabled="${!editable}" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="candidate.sponsored"
                           class="col-md-3 control-label">Sponsored</label>

                    <div class="col-md-9">
                        <g:if test="${editable}">
                            <g:radioGroup values="[true, false]" labels="['yes', 'no']" name="candidate.sponsored" value="${candidateInstance?.sponsored}" >
                                <label class="control-label">
                                    ${it.radio}&nbsp;${it.label}
                                </label>
                                &nbsp;
                            </g:radioGroup>
                        </g:if>
                        <g:else>
                            <label class="control-label">${candidateInstance?.sponsored ? "yes" : "no"}</label>
                        </g:else>

                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="lastName" class="col-md-3 control-label">
                        <g:message code="candidate.lastName.label" default="Last Name"/>
                    </label>

                    <div class="col-sm-9">
                        <g:textField name="candidate.lastName" class="form-control" value="${candidateInstance?.lastName}" disabled="${!editable}" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="address.details"
                           class="col-md-3 control-label">
                        <g:message code="candidate.address.label"
                                   default="Address"/>
                    </label>

                    <div class="col-md-9">
                        <g:textArea rows="2" name="address.details" class="form-control" value="${candidateInstance?.address?.details}" disabled="${!editable}" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="postCodeId"
                           class="col-md-3 control-label">
                        <g:message code="postCode.code.label" default="Post Code"/>
                    </label>

                    <div class="col-md-9">
                        <g:if test="${editable}">

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
                                            return "No Post Code selected";
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
                        </g:if>
                        <g:else>
                            <g:if test="${candidateInstance?.address?.postCode == null}">
                                <label class="control-label">No Post Code selected for address</label>
                            </g:if>
                            <g:else>
                                <label class="control-label">${candidateInstance?.address?.postCode?.code} - ${candidateInstance?.address?.postCode?.country}</label>
                            </g:else>
                        </g:else>
                    </div>
                </div>

                <div class="form-group">
                    <label for="candidate.driver"
                           class="col-md-3 control-label">Driver</label>

                    <div class="col-md-9 " aria-checked="true" aria-disabled="true">

                        <g:if test="${editable}">
                            <g:radioGroup values="[true, false]" labels="['yes', 'no']" name="candidate.driver" value="${candidateInstance?.driver}" >
                                <label class="control-label">
                                    ${it.radio}&nbsp;${it.label}
                                </label>
                                &nbsp;
                            </g:radioGroup>
                        </g:if>
                        <g:else>
                            <label class="control-label">${candidateInstance?.driver ? "yes" : "no"}</label>
                        </g:else>

                    </div>
                </div>

                <div class="form-group">
                    <label for="candidate.carOwner"
                           class="col-md-3 control-label">Car owner</label>

                    <div class="col-md-9">
                        <g:if test="${editable}">
                            <g:radioGroup values="[true, false]" labels="['yes', 'no']" name="candidate.carOwner" value="${candidateInstance?.carOwner}">
                                <label class="control-label">
                                    ${it.radio}&nbsp;${it.label}
                                </label>
                                &nbsp;
                            </g:radioGroup>
                        </g:if>
                        <g:else>
                            <label class="control-label">${candidateInstance?.carOwner ? "yes" : "no"}</label>
                        </g:else>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <g:if test="${editable}">
                    <g:submitButton name="Save" class="btn btn-success" />
                    <g:link uri="/" class="btn btn-warning" name="Cancel">Cancel</g:link>
                </g:if>
            </div>
        </div>
    </g:form>
</div><!-- /.box-body -->
%{--  <div class="box-footer">
      <code>.box-footer</code>
  </div><!-- /.box-footer-->--}%
</div>

</div>
