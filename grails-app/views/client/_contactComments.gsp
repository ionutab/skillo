<div id="displayContactComments">
    <g:each in="${clientContactShow?.contactComments}" var="comment">
        <div class="callout callout-main-details callout-info" >
            <p><b><g:formatDate date="${comment.date}" format="${message(code:'default.dateTime.format')}" /></b>&nbsp;${comment?.consultant?.getFullName()}&nbsp;:&nbsp;<b>${clientContactShow?.getFullName()}</b></p>
            <p>${comment?.comment}</p>
        </div>
    </g:each>
</div>

<div id="newContactCommentContainer">
    <g:render template="../contact/comment/createCommentModal" model="['clientContactShow':clientContactShow]" />
</div>