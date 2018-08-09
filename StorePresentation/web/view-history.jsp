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
            <h3>View History</h3>
            <s:if test="%{listOrder == null}">
                You din't buy anything before
            </s:if>
            <s:if test="%{listOrder != null}">
                <table border="1" class="table table-hover table-responsive table-striped">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Name</th>
                            <th>Creation date</th>
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="%{listOrder}" status="counter">
                        <tr>
                            <td>
                                <s:property value="%{#counter.count}" />
                            </td>
                            <td><s:property value="name" /></td>
                            <td><s:property value="date" /></td>
                            <td><s:property value="quantity" /></td>
                            <td>$<s:property value="price" /></td>
                        </tr>
                        </s:iterator>
                    </tbody>
                </table>

            </s:if>
            
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
