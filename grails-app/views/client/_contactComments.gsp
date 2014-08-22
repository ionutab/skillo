<div id="displayContactComments">
    <g:each in="${clientContactShow?.contactComments}" var="comment">
        <div class="callout callout-main-details callout-info" >
            <p><b><g:formatDate date="${comment.date}" />&nbsp;${comment?.consultant?.getFullName()}&nbsp;:&nbsp;${clientContactShow?.getFullName()}</b></p>
            <p>${comment?.comment}</p>
        </div>
    </g:each>
</div>