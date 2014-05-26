<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

    <%-- sidebar --%>
    <g:if test="${!layout_full_width}">
        <g:if test="${!layout_nosidebar}">
            <g:render template="/_menu/sidebar_only"/>
        </g:if>
    </g:if>

    <%-- navbar --%>
    <g:if test="${!layout_nonavbar}">
        <g:render template="/_menu/navbar_light" />
    </g:if>

</body>
</html>