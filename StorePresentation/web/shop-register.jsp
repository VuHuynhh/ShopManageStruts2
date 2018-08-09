<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
    <style media="screen" type="text/css">
        .errorMessage {
            color: red;
        }
    </style>
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Register"/>
    </jsp:include>
    <body>
        <!--Start class site-->
        <div class="tz-site">

            <!--Start id tz header-->
            <%@include file="header_menu.jsp" %>
            <!--End id tz header-->

            <!--Start create an account-->
            <section class="default-page">
                <div class="container">
                    <div class="tz-register">
                        <h2>Create an account</h2>
                        <!--Start form-->
                        <form id="register-form" action="register" method="POST">
                            <s:if test="%{exMess != null}">
                                <h5><font color="red">Sorry this email is already existed, please try again</font></h5>
                                </s:if>
                            <p class="form-row form-row-wide">
                                <label for="email">Email address</label>
                                <s:textfield type="text" class="input-text" name="email" />
                            </p>

                            <p class="form-row form-row-wide">
                                <label for="password">Password</label>
                                <s:textfield class="input-text" type="password" name="password" />
                            </p>
                            <p class="form-row form-row-wide">
                                <label for="confirm">Confirm</label>
                                <s:textfield class="input-text" type="password" name="confirm" />
                            </p>
                            <div class="alert-danger"></div>
                            <p class="form-row form-row-wide">
                                <label for="firstname">First name</label>
                                <s:textfield class="input-text" type="text" name="firstName" />
                            </p>
                            <p class="form-row form-row-wide">
                                <label for="lastname">Last name</label>
                                <s:textfield class="input-text" type="text" name="lastName" />
                            </p>
                            <p class="form-row form-row-wide">
                                <label for="phone">Phone</label>
                                <s:textfield class="input-text" type="text" name="phone" />
                            </p>
                            <p class="form-row">
                                <input type="submit" class="button" value="Create an account" />
                            </p>

                            <!--End form-->
                        </form>
                    </div>
                </div>
            </section>
            <!--End create an account-->

            <!--Start Footer-->
            <%@include file="footer.jsp" %>
            <!--End Footer-->

        </div><!--End class site-->

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/off-canvas.js"></script>
        <!--jQuery Countdow-->
        <script src="js/jquery.plugin.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <!--End Countdow-->

        <script src="js/owl.carousel.js"></script>
        <script src="js/custom.js"></script>
        <script src="js/jquery.validate.js"></script>
    </body>
</html>

