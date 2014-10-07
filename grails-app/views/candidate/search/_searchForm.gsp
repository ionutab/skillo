<div class="row" id="advancedSearchContent">
    <div class="col-md-12 top10">
        <div class="box box-solid">
            <div class="box-body">
                <g:form class="form-horizontal" controller="candidateSearch" action="search">
                    <div class="col-md-12" id="advancedCandidateSearch">
	                    <g:if test="${!candidateFilter?.getQualifications()}">
		                    <div class="form-group duplicable">
			                    <div class="col-md-2"></div>
			                    <div class="col-md-8">
				                    <g:hiddenField class="advancedSearchSelect2Input" name="advancedSearch.qualifications" value="" />
			                    </div>
			                    <div class="col-md-2"></div>
		                    </div>
	                    </g:if>
					    <g:else>
						    <g:each in="${candidateFilter?.getQualifications()}" var="qualificationSet" status="i">
							    <div class="form-group duplicable">
								    <g:if test="${i >= 1}">
									    <label class="col-md-2 control-label text-right">OR</label>
								    </g:if>
									<g:else>
										<div class="col-md-2"></div>
									</g:else>
								    <div class="col-md-8">
									    <g:hiddenField class="advancedSearchSelect2Input" name="advancedSearch.qualifications" value="" />
								    </div>
							        <g:if test="${i >= 1}">
								        <div class="col-md-2">
								            <a href="#" class="btn btn-link" onclick="SkilloAdvancedSearch.closeQualificationSelect2Widget(this)"><i class="fa fa-times"></i></a>
								        </div>
							        </g:if>
							        <g:else>
								        <div class="col-md-2"></div>
							        </g:else>
							    </div>
						    </g:each>
					    </g:else>

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

	var initSearchFormValues = ${qualificationSets};

    SkilloAdvancedSearch.init({
    	initiateID: '#advancedCandidateSearch',
        ajaxQualificationsQueryURL:'<g:createLink controller="qualification" action="getQualificationsByName" />',
        ajaxWidgetURL:'<g:createLink controller="candidateSearch" action="displayQualificationSetWidget" />',
        initValues:initSearchFormValues
    });

</g:javascript>