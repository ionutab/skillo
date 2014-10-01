<div class="row" id="advancedSearchContent">
    <div class="col-md-12 top10">
        <div class="box box-solid">
            <div class="box-body">
                <g:form class="form-horizontal" controller="candidateSearch" action="search">
                    <div class="col-md-12" id="advancedCandidateSearch">

                        <div class="form-group duplicable">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <g:hiddenField class="advancedSearchSelect2Input" name="advancedSearch.qualifications" value="" />
                            </div>
                            <div class="col-md-2"></div>
                        </div>

                    </div>

	                <div class="row">
		                <div class="col-md-6 text-right col-md-offset-3 ">
			                <button class="btn btn-primary btn duplicator" onclick="SkilloAdvancedSearch.addQualificationSelect2Widget(event)">Add</button>
			                <input type="submit" name="search" class="btn btn-primary btn" value="Search" id="Search">
		                </div>
	                </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
<g:javascript>

    SkilloAdvancedSearch.init({
    	initiateID: '#advancedCandidateSearch',
        ajaxQualificationsQueryURL:'<g:createLink controller="qualification" action="getQualificationsByName" />',
        ajaxWidgetURL:'<g:createLink controller="candidateSearch" action="displayQualificationSetWidget" />'
    });

</g:javascript>