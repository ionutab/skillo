<div class="col-xs-12 text-center">

    <h2 class="bold">${clientInstance?.name }</h2>
    <h4><g:message code="client.registrationNumber.short.label" />:&nbsp;${clientInstance?.registrationNumber}</h4>

    <div class="row">
        <div class="col-xs-12">
            <table class="table text-left">

                <tbody>
                    <g:if test="${clientInstance?.telephoneNumber}">
                        <tr>
                            <td><b><g:message code="client.telephoneNumber.short.label" /></b></td>
                            <td>${clientInstance?.telephoneNumber}</td>
                        </tr>
                    </g:if>
                    <g:if test="${clientInstance?.faxNumber}">
                        <tr>
                            <td><b><g:message code="client.faxNumber.short.label"/> </b></td>
                            <td>${clientInstance?.faxNumber}</td>
                        </tr>
                    </g:if>
                    <g:if test="${clientInstance?.address?.details}">
                        <tr>
                            <td><b><g:message code="client.address.label" /></b></td>
                            <td>${clientInstance?.address?.details}</td>
                        </tr>
                    </g:if>
                    <g:if test="${clientInstance?.address?.postCode?.code}">
                        <tr>
                            <td><b><g:message code="address.postcode.label" /> </b></td>
                            <td>${clientInstance?.address?.postCode?.code}</td>
                        </tr>
                    </g:if>
                    <g:if test="${clientInstance?.website}">
                        <tr>
                            <td><b><g:message code="client.website.label" /></b></td>
                            <td><g:link base="${clientInstance?.website}" url="${clientInstance?.website}" target="_blank" >${clientInstance?.website}</g:link></td>
                        </tr>
                    </g:if>
                </tbody>

            </table>
        </div>
    </div>

</div>