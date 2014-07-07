<section class="content-header">
    <g:if test="${params.action != 'list'}">
        <g:link controller="candidate" action="list"><i class="fa fa-bars"></i>&nbsp;Candidate List</g:link>&nbsp;
    </g:if>
    <g:if test="${params.action != 'create' && params.action != 'save'}">
        <g:link controller="candidate" action="create"><i class="fa fa-plus"></i>&nbsp;New Candidate</g:link>&nbsp;
    </g:if>
</section>
