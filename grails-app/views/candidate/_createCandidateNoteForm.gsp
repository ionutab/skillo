<legend>
    <g:message code="candidate.form.new.candidateNote" default="New Candidate Note" />
</legend>
<g:hiddenField name="newCandidateNote.candidate.id" value="${newCandidateNote?.candidate?.id}" />
<div class="form-group  ${hasErrors(bean: newCandidateNote, field: 'note.details', 'has-error')} ">
    <div class="col-md-12">
        <g:textArea name="newCandidateNote.note.note" class="form-control" rows="3" placeholder="Type Note Here"></g:textArea>
    </div>
</div>

