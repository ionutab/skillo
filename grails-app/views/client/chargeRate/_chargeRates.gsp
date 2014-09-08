

<g:if test="${clientInstance.chargeRates}">
    <div class="row">
        <div class="col-xs-12">
            <h2 class="bold">Charge Rates</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <table class="table text-left">
                <g:each in="${clientInstance?.chargeRates}" var="chargeRate">
                    <tr>
                        <td>
                            ${chargeRate?.qualification?.name}
                        </td>
                        <td>
                            <input type="text" value="${chargeRate?.rate}"/>
                        </td>
                        <td>
                            <g:formatDate date="${chargeRate?.lastUpdated}" />
                        </td>
                        <td>
                            Delete
                        </td>
                    </tr>
                </g:each>
            </table>
        </div>
    </div>
</g:if>

<g:form controller="client" action="addClientChargeRate" role="form" name="addClientChargeRateForm" id="addClientChargeRateForm">
    <div class="row">
        <div class="col-xs-4">
            <g:render template="../qualification/qualificationSelector"
                      model="['attributeName':'chargeRateQualification.id',
                              'attributeId':'chargeRateQualificationId']"/>
        </div>
        <div class="col-xs-4">
            <g:textField name="addChargeRate.rate" id="addChargeRateRate" value="" class="form-control" />
            <g:javascript>
                /*[0-9]+[0-9]{2}*/
                $("#addChargeRateRate").inputmask('Regex', {regex:"[0-9]+"});
            </g:javascript>
        </div>
        <div class="col-xs-4">
            <g:submitButton name="Add" class="btn btn-success" />
        </div>
    </div>
</g:form>
