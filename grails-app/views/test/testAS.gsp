<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <title>Test AS JS</title>
    <r:require modules="jquery,select2,application" />

    <r:layoutResources />
</head>
<body>
<div id="advancedCandidateSearch">
	<div class="duplicable">
	    <g:hiddenField class="advancedSearchSelect2Input" name="qualifications" />
	</div>
</div>
<button class="duplicator" onclick="SkilloAdvancedSearch.addQualificationSelect2Widget(event)">Add</button>
<g:javascript>

    SkilloAdvancedSearch.init({
    	initiateID: '#advancedCandidateSearch',
        ajaxQualificationsQueryURL:'<g:createLink controller="qualification" action="getQualificationsByName" />',
        ajaxWidgetURL:'<g:createLink controller="candidateSearch" action="displayQualificationSetWidget" />'
    });

</g:javascript>
    <r:layoutResources />
</body>
</html>
