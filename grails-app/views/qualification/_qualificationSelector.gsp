%{-- candidateMainTrade.id --}%
%{-- mainTradeId --}%
%{-- candidateInstance?.getMainTrade()?.qualification?.id --}%

<g:hiddenField
        name="${attributeName}"
        id="${attributeId}"
        value="${qualification?.id}"
/>
<g:hiddenField
        name="${attributeName}.previousName"
        id="${attributeId}Placeholder"
        value="${qualification?.name}"
/>

<g:javascript>
    SkilloSelect2SimpleQualificationInitiator.init('<g:createLink controller="qualification" action="getQualificationsByName" />');
    SkilloSelect2SimpleQualificationInitiator.select2onID('#${attributeId}');
</g:javascript>