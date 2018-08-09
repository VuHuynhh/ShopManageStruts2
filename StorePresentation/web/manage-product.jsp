<%@taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Manage product" />
    </jsp:include>
    <body>
        <%@include file="header_menu.jsp" %>
        <main>
            <s:if test="%{msg != null}">
                <h4 style="color: #5cb85c"></i><s:property value="msg" /></h4>
                </s:if>
            <div class="margin_60 container">
                
                <h3>Manage product</h3>
                <form action="SearchManage" method="POST">
                    <div class="form-inline text-center">
                        <input class="form-control" name="searchValue" type="text" />
                        <button type="submit" class="btn-primary">Search</button>
                    </div>     
                </form>
            </div>
            <s:if test="%{listManage != null}">
                <table border="1" class="table table-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Chassis</th>
                            <th>Tire</th>
                            <th>Fork</th>
                            <th>Color</th>
                            <th>Re-date</th>
                            <th>Path</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator var="list" value="%{listManage}" status="counter">
                            <tr>
                                <td><s:property value="%{#counter.count}" /></td>
                                <td><s:property value="name" /></td>
                                <td><s:property value="chassis" /></td>
                                <td><s:property value="tire" /></td>
                                <td><s:property value="fork" /></td>
                                <td><s:property value="color" /></td>
                                <td><s:property value="releaseDate" /></td>
                                <td><img src="<s:property value="imgPath" />" class="img-manager" /></td>
                                <td>
                                    <s:url action="DeleteProduct" id="deleteLink">
                                        <s:hidden name="lastSearchValue" value="searchValue"/>
                                        <s:param name="productId" value="%{productId}" />
                                    </s:url>
                                    <s:a href="%{deleteLink}">Delete</s:a>
                                    </td>
                                    <td>
                                    <s:url action="EditProduct" id="editLink">
                                        <s:hidden name="lastSearchValue" value="searchValue"/>
                                        <s:param name="productId" value="%{productId}" />
                                    </s:url>
                                    <s:a href="%{editLink}">Update</s:a>
                                    </td>
                                </tr>
                        </s:iterator>
                    </tbody>
                </table>

            </s:if>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>


