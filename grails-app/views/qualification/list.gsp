<%@ page import="skillo.Qualification" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="admin_lte_layout"/>
    <g:set var="entityName" value="${message(code: 'qualification.label', default: 'Qualification')}"/>
    <title><g:message code="qualification.list.label" args=" "/></title>
</head>

<body>
<div class="row">
    <div class="col-md-12">
        <g:form controller="qualification" action="list" method="post" id="qualificationSearchForm" role="form">

            <div class="row">
                <div class="col-xs-2">
                    <g:textField class="form-control" name="name"
                                 placeholder="${message(code: 'candidateQualification.search.name.label', default: 'Name')}"
                                 value="${params.name}"/>
                </div>
                <div class="col-xs-2">
                    <g:submitButton name="list" class="btn btn-primary"
                                    value="${message(code: 'default.button.search.label')}"/>
                    <button type="submit" id="resetQualificationSearchForm" class="btn btn-info" name="reset" value="true">
                    <i class="fa fa-refresh"></i>
                    </button>
                    <g:javascript>

                        $('#resetQualificationSearchForm').on('click', function () {
                            var form = $("#qualificationSearchForm");
                            var validator = form.validate(); // clear out the validation errors
                            validator.resetForm();
                        });
                    </g:javascript>
                </div>
            </div>

        </g:form>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <g:if test="${QualificationList}">
            <g:render template="template/list"/>
        </g:if>
        <g:else>
            <g:render template="template/qualificationList"/>
        </g:else>
    </div>
</div>

</body>
</html>