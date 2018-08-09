<!DOCTYPE html>
<html lang="en">

    <style media="screen" type="text/css">
        .errorMessage {
            color: red;
        }
    </style>
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Login"/>
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
                        <h2>Login to shopping</h2>

                        <!--Start form-->
                        <form action="Login" method="post">
                            <s:if test="%{#request.error!=null}">
                                <div class="alert-danger" ><s:property value="#request.error"/></div>
                            </s:if>
                            <s:if test="%{#request.requireLogin!=null}">
                                <div class="alert-danger" ><s:property value="#request.requireLogin"/></div>
                            </s:if>
                            <p class="form-row form-row-wide">
                                <label for="username">Email address</label>
                                <s:textfield type="text" class="input-text" name="email" />
                            </p>
                            <p class="form-row form-row-wide">
                                <label for="password">Password</label>
                                <s:textfield class="input-text" type="password" name="password" />
                            </p>

                            <p class="form-row">
                                <input type="submit" class="button" name="btnLogin" value="Login">
                            </p>
                        </form>
                        <!--End form-->

                    </div>
                </div>
            </section>
            <!--End create an account-->

            <!--Start Footer-->
            <footer class="tz-footer">
                <div class="footer-widget">
                    <div class="container">

                        <!--Start footer left-->
                        <div class="footer-left">
                            <div class="contact-info widget">
                                <h3 class="widget-title">Contact info</h3>
                                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium</p>
                                <ul>
                                    <li>
                                        <span>Address :</span>
                                        <address>
                                            123 Sky Tower address name, Los Algeles, ,<br> USA, Country, 01234
                                        </address>
                                    </li>
                                    <li>
                                        <span>Phone :</span>
                                        (012) 345 6789
                                    </li>
                                    <li>
                                        <span>Email :</span>
                                        info@templaza.com
                                    </li>
                                </ul>
                            </div>
                            <div class="widget">
                                <form class="tz-subcribe">
                                    <input type="text" name="sub" value="" placeholder="Enter your email...">
                                    <input type="submit" name="subscribe" value="Subscribe">
                                </form>
                            </div>
                            <div class="widget">
                                <ul class="tz-social">
                                    <li>
                                        <a class="fa fa-facebook" href="#"></a>
                                    </li>
                                    <li>
                                        <a class="fa fa-twitter" href="#"></a>
                                    </li>
                                    <li>
                                        <a class="fa fa-google-plus" href="#"></a>
                                    </li>
                                    <li>
                                        <a class="fa fa-tumblr" href="#"></a>
                                    </li>
                                    <li>
                                        <a class="fa fa-flickr" href="#"></a>
                                    </li>
                                    <li>
                                        <a class="fa fa-pinterest" href="#"></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!--End footer left-->

                        <!--Start footer right-->
                        <div class="footer-right">
                            <div class="tz-widget-clients widget">
                                <h3 class="widget-title">What clients say?</h3>
                                <div class="tz-widget-say">
                                    <img src="images/say.jpg" alt="Kathy Young">
                                    <div class="entry-say">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor     incididunt ut labore et dolore magna aliqua.</p>
                                        <span>Kathy Young</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="widget widget_nav_menu">
                                        <h3 class="widget-title">HOW TO BUY</h3>
                                        <ul>
                                            <li>
                                                <a href="#">Contact Us</a>
                                            </li>
                                            <li>
                                                <a href="#">Returns</a>
                                            </li>
                                            <li>
                                                <a href="#">Site Map</a>
                                            </li>
                                            <li>
                                                <a href="#">Brands</a>
                                            </li>
                                            <li>
                                                <a href="#">Gift Vouchers</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="widget widget_nav_menu">
                                        <h3 class="widget-title">MY ACCOUNT</h3>
                                        <ul>
                                            <li>
                                                <a href="#">My Account</a>
                                            </li>
                                            <li>
                                                <a href="#">Order History</a>
                                            </li>
                                            <li>
                                                <a href="#">Wish List</a>
                                            </li>
                                            <li>
                                                <a href="#">Newsletter</a>
                                            </li>
                                            <li>
                                                <a href="#">Specials</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="widget widget_nav_menu">
                                        <h3 class="widget-title">Infomation</h3>
                                        <ul>
                                            <li>
                                                <a href="#">About Us</a>
                                            </li>
                                            <li>
                                                <a href="#">Returns</a>
                                            </li>
                                            <li>
                                                <a href="#">Contact Us</a>
                                            </li>
                                            <li>
                                                <a href="#">Term & Conditions</a>
                                            </li>
                                            <li>
                                                <a href="#">Privacy Policy</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End footer right-->

                    </div>
                </div>

                <!--Copy right-->
                <div class="tz-copyright">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <p>Copyright &copy; 2015 <a href="http://templaza.com/" target="_blank">BikeSport</a> by TemPlaza. All rights reserved.</p>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="pull-right">
                                    <span class="payments-method">
                                        <a href="#"><img src="images/Visa.png" alt="visa"></a>
                                        <a href="#"><img src="images/Intersection.png" alt="Intersection"></a>
                                        <a href="#"><img src="images/ebay.png" alt="ebay"></a>
                                        <a href="#"><img src="images/Amazon.png" alt="Amazon"></a>
                                        <a href="#"><img src="images/Discover.png" alt="Discover"></a>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End copy right-->
            </footer>
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

    </body>

    <!-- Mirrored from html.templaza.net/bikesport/shop-register.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 17 Apr 2018 14:58:19 GMT -->
</html>