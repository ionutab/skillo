<%@ page import="skillo.Qualification" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="admin_lte_layout" />
    <g:set var="entityName" value="${message(code: 'qualification.label', default: 'Qualification')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<section id="show-qualification" class="first">

    <table class="table">
        <tbody>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="qualification.code.label" default="Code" /></td>

            <td valign="top" class="value">${fieldValue(bean: qualificationInstance, field: "code")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="qualification.name.label" default="Name" /></td>

            <td valign="top" class="value">${fieldValue(bean: qualificationInstance, field: "name")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="qualification.description.label" default="Description" /></td>

            <td valign="top" class="value">${fieldValue(bean: qualificationInstance, field: "description")}</td>

        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="qualification.mainTrade.label" default="Main Trade" /></td>

            <td valign="top" class="value">${fieldValue(bean: qualificationInstance, field: "canBeMainTrade")}</td>

        </tr>

        </tbody>
    </table>
</section>
</body>
</html>