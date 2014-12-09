<div class="row" id="advancedSearchContent">
    <div class="col-md-12 top10">
        <div class="box box-solid">
            <div class="box-body">
                <g:form class="form-horizontal" method="GET">
                    <div class="col-md-12" id="advancedCandidateSearch">
	                    <g:if test="${!candidateFilter?.getQualifications()}">
		                    <div class="form-group duplicable">
			                    <div class="col-md-2"></div>
			                    <div class="col-md-8">
				                    <g:hiddenField class="advancedSearchSelect2Input" name="advancedSearch.qualifications" value="" />
			                    </div>
			                    <div class="col-md-2">
				                    <g:actionSubmit value="Reset" name="reset" action="reset" class="btn btn-info" />
			                    </div>
		                    </div>
	                    </g:if>
					    <g:else>
						    <g:each in="${candidateFilter?.getQualifications()}" var="qualificationSet" status="i">
							    <div class="form-group duplicable">
								    <g:if test="${i >= 1}">
									    <g:set var="iOp" value="${i - 1}" />
									    <div class="col-md-2">
										    <g:select name="advancedSearch.operators" from="${['AND', 'NOT']}" value="${candidateFilter?.getOperators()?.get(iOp)}" class="form-control fixed-80"/>
									    </div>
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
								        <div class="col-md-2">
									        <g:actionSubmit value="Reset" name="reset" action="reset" class="btn btn-info btn" />
								        </div>
							        </g:else>
							    </div>
						    </g:each>
					    </g:else>
                    </div>
	                <div class="col-md-12">
		                <div class="col-md-6 col-md-offset-2 text-left">
		                    <g:checkBox name="advancedSearch.isRegistered" value="${candidateFilter?.getIsRegistered()?.booleanValue()}"/><label for="advancedSearch.isRegistered" class="control-label">&nbsp;Registered&nbsp;</label>
		                    <g:checkBox name="advancedSearch.isInducted" value="${candidateFilter?.getIsInducted()}"/><label for="advancedSearch.isInducted" class="control-label">&nbsp;Inducted&nbsp;</label>
			                <g:checkBox name="advancedSearch.isSponsored" value="${candidateFilter?.getIsSponsored()}"/><label for="advancedSearch.isSponsored" class="control-label">&nbsp;Sponsored&nbsp;</label>
			                <g:checkBox name="advancedSearch.isDriver" value="${candidateFilter?.getIsDriver()}"/><label for="advancedSearch.isDriver" class="control-label">&nbsp;Driver&nbsp;</label>
		                    <g:checkBox name="advancedSearch.isCarOwner" value="${candidateFilter?.getIsCarOwner()}"/><label for="advancedSearch.isCarOwner" class="control-label">&nbsp;Car Owner&nbsp;</label>

			                %{--<label for="advancedSearch.isRegistered" class="control-label">&nbsp;Driver&nbsp;</label>
			                <g:select name="advancedSearch.isRegistered" noSelection="${['null':'-']}" from="${['YES','NO']}" keys="${['true','false']}" value="${candidateFilter?.getIsDriver()}" class="form-control fixed-80 inline" />
			                <label for="advancedSearch.isRegistered" class="control-label">&nbsp;Car Owner&nbsp;</label>
			                <g:select name="advancedSearch.isRegistered" noSelection="${['null':'-']}" from="${['YES','NO']}" keys="${['true','false']}" value="${candidateFilter?.getIsCarOwner()}" class="form-control fixed-80 inline" />--}%
		                </div>
	                </div>
					<div class="col-md-12">
						<div class="col-md-6 col-md-offset-2 text-left">
							<span class="irs">
								<span class="irs-line">
									<span class="irs-line-left"></span>
									<span class="irs-line-mid"></span>
									<span class="irs-line-right"></span>
								</span>
							</span>
							<span class="irs-from">0</span>
							<span style="left: 95.5px;" class="irs-single">17 500 light years</span>
							<span style="left: 125px;" class="irs-slider single"></span>
							%{--<span class="irs-to">100</span>--}%
						</div>
					</div>

                    <div class="col-md-12">
                        <div class="col-md-6 col-md-offset-2 ">
                            <g:render template="../postCode/postCodeSelector"
                                      model="['attributeName': 'postCode.id',
                                              'attributeId'  : 'postCodeId',
                                              'postCode'     : candidateInstance?.address?.postCode]"/>
                        </div>
                        <div class="col-md-2 text-right">
                            <button class="btn btn-primary btn duplicator" onclick="SkilloAdvancedSearch.addQualificationSelect2Widget(event)">Add</button>
                            %{--<input type="submit" name="search" class="btn btn-primary btn" value="Search" id="Search">--}%
                            <g:actionSubmit value="Search" name="search" action="search" class="btn btn-primary btn" />
                        </div>
                    </div>

                </g:form>
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
</div>
