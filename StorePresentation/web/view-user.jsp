<%@taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Manage user" />
    </jsp:include>
    <body>
        <%@include file="header_menu.jsp" %>
        <div class="margin_60 container">
            <h3>View user</h3>
            <s:if test="%{list != null}">
                <table border="0" class="table table-hover table-responsive table-striped">
                    <thead>
                        <tr>

                            <th>Id</th>
                            <th>Email</th>
                            <th>Full Name</th>
                            <th>Phone</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="list" status="counter">
                            <tr>


                                <th scope="row"><s:property value="%{id}"/></th>
                                <td><s:property value="email" /></td>
                                <td><s:property value="firstName + ' ' + lastName" /></td>
                                <td><s:property value="phone" /></td>
                                <td><s:if test="status == 1">Normal</s:if><s:else>Banned</s:else></td>
                                    <td>
                                    <s:url value="BanUser" var="banUserLink">
                                        <s:param name="id" value="%{id}" />
                                        <s:param name="page" value="%{page}"/>
                                    </s:url>
                                    <s:url value="RestoreUser" var="restoreUserLink">
                                        <s:param name="id" value="%{id}" />
                                        <s:param name="page" value="%{page}"/>
                                    </s:url>
                                    <s:if test="status == 1"><s:a href="%{banUserLink}">Ban</s:a></s:if>
                                    <s:else><s:a href="%{restoreUserLink}">Restore</s:a></s:else>
                                        </td>
                                    </tr>
                        </s:iterator>
                    </tbody>
                </table>
                <div style="float: right;">
                    <ul class="pagination">
                    </ul>
                </div>
            </s:if>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/common_scripts_min.js"></script>
<script src="js/functions.js"></script>
<script>
    $(function () {
        var totalRecord = '<s:property value="total"/>';
        var rows = '<s:property value="rows"/>';
        var page = '<s:property value="page"/>';
        var totalPage = Math.ceil(totalRecord / rows);
        for (var i = 1; i <= totalPage; i++) {
            if (i === page) {
                $('.pagination').append('<li class="active"><a class="non-active" href="">' + i + '</a>');
            } else {
                $('.pagination').append('<li><a href="ViewUser.action?page=' + i + '">' + i + '</a></li>');
            }
        }
    });
</script>