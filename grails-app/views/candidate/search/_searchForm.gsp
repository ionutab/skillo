<div class="row" id="advancedSearchContent">
    <div class="col-md-12 top10">
        <div class="box box-solid">
            <div class="box-body">
                <g:form controller="candidate" action="advancedSearch" class="form-horizontal">
                    <div class="row">
                        <div class="col-md-9">

                            <div class="row">
                                <div class="form-group ">
                                    <label for="qualification"
                                           class="col-sm-2 control-label">Where qualification</label>

                                    <div class="col-md-3">
                                        <g:render template="../qualification/qualificationSelector"
                                                  model="['attributeName':'qualification1',
                                                          'attributeId':'qualification1' ,
                                                          'qualification':null]"/>
                                    </div>

                                    <label class="col-md-1 control-label" >OR</label>

                                    <div class="col-md-3">
                                        <g:render template="../qualification/qualificationSelector"
                                                  model="['attributeName':'qualification2',
                                                          'attributeId':'qualification2' ,
                                                          'qualification':null]"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group ">
                                    <label for="qualification"
                                           class="col-sm-2 control-label">AND</label>

                                    <div class="col-md-3">
                                        <g:render template="../qualification/qualificationSelector"
                                                  model="['attributeName':'qualification3',
                                                          'attributeId':'qualification3' ,
                                                          'qualification':null]"/>
                                    </div>

                                    <label class="col-md-1 control-label" >OR</label>

                                    <div class="col-md-3">
                                        <g:render template="../qualification/qualificationSelector"
                                                  model="['attributeName':'qualification4',
                                                          'attributeId':'qualification4' ,
                                                          'qualification':null]"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group ">
                                    <label for="postcode"
                                           class="col-sm-2 control-label">Where postcode</label>

                                    <div class="col-md-3">
                                        <g:textField name="postcode1" id="postcode1" class="form-control" />
                                    </div>

                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-8">
                                    <input type="submit" name="search" class="btn btn-primary btn" value="Search" id="Update">
                                </div>
                            </div>

                        </div>
                        <div class="col-md-3">
                            <g:checkBox name="search.registered" />&nbsp;${message(code:'payroll.registered.label')}
                            <br/>
                            <g:checkBox name="search.sponsored" />&nbsp;${message(code:'candidate.sponsored.label')}
                            <br/>
                            <g:checkBox name="search.carOwner" />&nbsp;${message(code:'candidate.carOwner.label')}
                            <br/>
                            <g:checkBox name="search.driver" value="true" />&nbsp;${message(code:'candidate.driver.label')}
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>