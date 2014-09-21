<div class="row" id="advancedSearchContent">
    <div class="col-md-12 top10">
        <div class="box box-solid">
            <div class="box-body">
                <g:form controller="candidate" action="advancedSearch" class="form-horizontal">
                    <div class="row">
                        <div class="col-md-12">

                            <div class="form-group duplicable">
                                <div class="col-md-2"></div>
                                <div class="col-md-8" style="background-color: lightgoldenrodyellow">
	                                <g:hiddenField class="advancedSearchSelect2Input" name="qualifications" />
                                </div>
                                <div class="col-md-2"></div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 text-right col-md-offset-3 " style="background-color: lightsalmon" >
	                                <button class="btn btn-primary btn " onclick="SkilloAdvancedSearch.addQualificationSelect2Widget()">Add</button>
                                    <input type="submit" name="search" class="btn btn-primary btn" value="Search" id="Search">
                                </div>
                            </div>

                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>