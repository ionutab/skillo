<div class="form-group duplicable">
	<div class="col-lg-2">
		<g:select name="advancedSearch.operators" from="${['AND', 'NOT']}" value="OR" class="form-control fixed-80"/>
	</div>
	<div class="col-md-8">
		<g:hiddenField class="advancedSearchSelect2Input" name="advancedSearch.qualifications" />
	</div>
	<div class="col-md-2">
		<a href="#" class="btn btn-link" onclick="SkilloAdvancedSearch.closeQualificationSelect2Widget(this)"><i class="fa fa-times"></i></a>
	</div>
</div>