<%-- 
    Document   : upload-image
    Created on : Apr 27, 2018, 10:08:16 PM
    Author     : Dell
--%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Upload Images" />
    </jsp:include>
    <body>
        <%@include file="header_menu.jsp" %>

        <main>
            <div class="margin_60 container">
                <h3>Please choose an image</h3>
            </div>

            <form action="UploadImage" id="upload" enctype="multipart/form-data" method="POST">                
                <div class="margin_60 container">
                    <div class="row">
                        <font color="green">
                        
                        <s:if test="%{#request.msg!=null}">
                            <i class="fa fa-check"></i>
                            <s:property value="#request.msg"/>
                        </s:if>
                        </font>
                    </div>
                    <h3>Upload Image (Allow size : < 4mb)</h3>
                    <div class="form-inline upload_1">
                        <div class="form-group">
                            <input type="file" name="file" id="js-upload-files" accept="image/*">
                        </div>
                        <button type="submit" class="btn_1 green" id="js-upload-submit">Upload file</button>
                    </div>
                </div>
            </form>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
