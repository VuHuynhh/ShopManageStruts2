<%-- 
    Document   : profile
    Created on : Apr 27, 2018, 10:55:56 AM
    Author     : Dell
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <style media="screen" type="text/css">
        .errorMessage {
            color: red;
        }
    </style>
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Profile" />
    </jsp:include>
    <body>
        <%@include file="header_menu.jsp" %>
        <s:if test="%{#request.success != null}">
            <h4 style="color: #5cb85c"><i class="fa fa-check"></i><s:property value="#request.success" /></h4>
        </s:if><s:elseif test="%{#request.error != null}">
            <h4 style="color: #cb1d1d"><i class="fa fa-times"></i><s:property value="#request.error" /></h4>
        </s:elseif>

        <div class="tz-shop-tabs">
            <div class="container">
                <div class="tab-head">
                    <ul class="nav nav-tabs">
                        <li role="presentation" class="active"><a href="#information" data-toggle="tab">Profile</a></li>
                        <li role="presentation"><a href="#description" data-toggle="tab">Settings</a></li>
                    </ul>
                </div>
                <div class="tab-content">

                    <div class="tab-pane active" id="information">
                        <div class="container"> 
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <h3>Your profile</h3>
                                    <ul id="profile_summary">
                                        <li>Email <span><s:property value="#session.USER.email"/></span>
                                        </li>
                                        <li>First name <span><s:property value="#session.USER.firstName"/></span>
                                        </li>
                                        <li>Last name <span><s:property value="#session.USER.lastName"/></span>
                                        </li>
                                        <li>Phone number <span><s:property value="#session.USER.phone"/></span>
                                        </li>

                                    </ul>
                                </div>

                            </div>

                            <div class="divider"></div>
                            <form id="update-form" action="UpdateProfile" method="POST">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h3>Edit profile</h3>
                                    </div>

                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label>First name</label>
                                            <input class="form-control" value="<s:property value="#session.USER.firstName"/>" name="firstName" id="first_name" type="text" required="true">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label>Last name</label>
                                            <input class="form-control" value="<s:property value="#session.USER.lastName"/>" name="lastName" id="last_name" type="text" required="true">
                                        </div>
                                    </div>
                                </div>
                                <!-- End row -->

                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="form-group">
                                            <label>Phone number</label>
                                            <input class="form-control" value="<s:property value="#session.USER.phone"/>" name="phone" id="phone" type="text" pattern="^\d{10}$" title="Invalid phone ! Phone is number & Phone length = 10" required="true">
                                        </div>
                                    </div>

                                </div>
                                <hr>
                                <button type="submit" class="btn btn-success">Update Profile</button>
                            </form>
                        </div>
                    </div>
                    <div class="tab-pane" id="description">
                        <form action="UpdatePassword" method="POST">
                            <div class="row">
                                <div class="col-md-12">
                                    <h4>Change your password</h4>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <label>Old password</label>
                                    <p class="form-row form-row-wide">
                                        <s:textfield class="input-text" name="password" type="password" size="40" />
                                    </p>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <label>New password</label>
                                    <p class="form-row form-row-wide">
                                        <s:textfield class="input-text" name="newPassword" id="new_password" type="password" size="40" />
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <label>Confirm new password</label>
                                    <p class="form-row form-row-wide">
                                        <s:textfield class="input-text" name="confirm" id="confirm_new_password" type="password" size="40" />
                                    </p>
                                </div>
                            </div>
                            <br>
                            <button type="submit" class="btn btn-success">Update Password</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type='text/javascript' src="js/off-canvas.js"></script>
        <!--jQuery Countdow-->
        <script src="js/jquery.plugin.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <!--End Countdow-->
        <script src="js/jquery.validate.js"></script>
        <script src="js/jquery-2.2.4.min.js"></script>
        <script src="js/owl.carousel.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
