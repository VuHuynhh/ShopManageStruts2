<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Page not found"/>
    </jsp:include>
    <body>
        <%@include file="header_menu.jsp" %>
        <div class="margin_60 container">
            <h1>Page not found</h1>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
