<!DOCTYPE html>
<%@taglib uri="/struts-tags" prefix="s" %>
<html lang="en">
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Home"/>
    </jsp:include>
<body>
    <!--Start class site-->
    <div class="tz-site">
        <%@include file="header_menu.jsp" %>
        <!--SATRT REVOLUTION SLIDER-->
        <%@include file="slider.jsp" %>
        <!--END REVOLUTION SLIDER-->


        <!--Start Custom content-->
        <div class="container">
            <div class="box-shadow section-small">
                <div class="row">
                    <div class="col-md-4">
                        <div class="custom-content">
                            <h3>FREE UK DELIVERY</h3>
                            <p>International delivery available</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="custom-content border-left">
                            <h3>Gift Cards & Wrapping</h3>
                            <p>The perfect way to bring a smile</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="custom-content border-left">
                            <h3>QUALIFIED OPTICIANS</h3>
                            <p>Prescription Experts</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End custom content-->

        <!--Start section large top for tabs content-->
        <div class="section-large-top">
            <div class="container">
                <!--Tabs Shop-->
                <div class="tz-shortcode-tabs">

                    <!--Tabs Header-->
                    <div class="tz-tabs-header">
                        <h2 class="tz-tabs-title pull-left"></h2>
                        <ul class="nav nav-tabs pull-right tz-nav-tabs">
                            <li role="presentation" class="active"><a href="#one_read" data-toggle="tab">On-Road <i class="fa fa-circle"></i></a></li>
                            <li role="presentation"><a href="#x_road" data-toggle="tab">X-Road <i class="fa fa-circle"></i></a></li>
                            <li role="presentation"><a href="#off_road" data-toggle="tab">Off-Road <i class="fa fa-circle"></i></a></li>
                            <li role="presentation"><a href="#bmx" data-toggle="tab">BMX</a></li>
                        </ul>
                    </div>
                    <!--End tab header-->

                    <!--Tab content-->
                    <%@include file="product.jsp" %>
                    <!--End tab content-->

                </div>
                <!--End Tabs Shop-->
            </div>
        </div>
        <!--End section large top for tabs content-->

        <!--Start parallax-->
        <section class="parallax background-parallax">
            <div class="container">

                <!--Get In Touch-->
                <div class="get-in-touch">
                    <h3>GET IN TOUCH</h3>
                    <p>Have an idea or a project, lets collaborate and build some awesome stuff</p>
                    <a class="buynow" href="shop.html">Buy now</a>
                </div>
                <!--End Get In Touch-->

            </div>
        </section>
        <!--End Start parallax-->

        <!--Start section lager-->
        <section class="section-large">
            <div class="container">
                <div class="box-shadow section-small2">
                    <h2 class="tz-title-black">From our Blog <span>Latest news & event of our bike</span></h2>
                    <div class="row">
                        <div class="col-md-6 col-sm-6">

                            <!--Start new blog-->
                            <div class="tz-new-blog">
                                <div class="tzthumbnail">
                                    <img src="images/Blog/Blog1.jpg" alt="Blog">
                                </div>
                                <div class="tz-new-content">
                                    <h4><a href="single-blog.html">Gulf Today Report On KGS Carnival – 2015</a></h4>
                                    <span class="post-date">Posted at March 19. 2015</span>
                                    <p>Excellence is never an accident. It is always the result of high intention and intelligent execution; it represents the wise choice of many alternatives.</p>
                                    <a href="#" class="continue">Continue Reading</a>
                                </div>
                            </div>
                            <!--End new blog-->

                        </div>
                        <div class="col-md-6 col-sm-6">

                            <!--Start new blog-->
                            <div class="tz-new-blog">
                                <div class="tzthumbnail">
                                    <img src="images/Blog/Blog2.jpg" alt="Blog">
                                </div>
                                <div class="tz-new-content">
                                    <h4><a href="blog.html">Excepteur sint ipsum dolor sit amet conse ctetur</a></h4>
                                    <span class="post-date">Posted at March 19. 2015</span>
                                    <p>Excellence is never an accident. It is always the result of high intention and intelligent execution; it represents the wise choice of many alternatives.</p>
                                    <a href="#" class="continue">Continue Reading</a>
                                </div>
                            </div>
                            <!--End new blog-->

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--End section large-->

        <!--Start partners-->
        <div class="container">
            <ul class="tz-partners">
                <li>
                    <a href="#">
                        <img src="images/clients/partner1.jpg" alt="partner">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="images/clients/partner2.jpg" alt="partner">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="images/clients/partner3.jpg" alt="partner">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="images/clients/partner4.jpg" alt="partner">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="images/clients/partner5.jpg" alt="partner">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="images/clients/partner6.jpg" alt="partner">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="images/clients/partner1.jpg" alt="partner">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="images/clients/partner2.jpg" alt="partner">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="images/clients/partner5.jpg" alt="partner">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="images/clients/partner3.jpg" alt="partner">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="images/clients/partner4.jpg" alt="partner">
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="images/clients/partner6.jpg" alt="partner">
                    </a>
                </li>
            </ul>
        </div>
        <!--End partners-->

        <!--Start Footer-->
        <%@include file="footer.jsp" %>
        <!--End Footer-->

    </div>
    <!--End class site-->

    <script type='text/javascript' src="js/jquery.min.js"></script>
    <script type='text/javascript' src="js/bootstrap.min.js"></script>
    <script type='text/javascript' src="js/off-canvas.js"></script>
    <!--jQuery Countdow-->
    <script type='text/javascript' src="js/jquery.plugin.min.js"></script>
    <script type='text/javascript' src="js/jquery.countdown.min.js"></script>
    <!--End Countdow-->
    <script type='text/javascript' src="js/jquery.parallax-1.1.3.js"></script>
    <script type='text/javascript' src="js/owl.carousel.js"></script>
    <script type='text/javascript' src="js/custom.js"></script>
    <script type='text/javascript' src='rs-plugin/js/jquery.themepunch.tools.min.js'></script>
    <script type='text/javascript' src='rs-plugin/js/jquery.themepunch.revolution.min.js'></script>
    <script type='text/javascript' src='rs-plugin/js/custom-rs.js'></script>
</body>

<!-- Mirrored from html.templaza.net/bikesport/ by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 17 Apr 2018 14:57:18 GMT -->
</html>