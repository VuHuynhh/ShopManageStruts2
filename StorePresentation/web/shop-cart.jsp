<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Shop cart"/>
    </jsp:include>
    <body>
        <!--Start class site-->
        <div class="tz-site">

            <!--Start id tz header-->
            <%@include file="header_menu.jsp" %>
            <!--End id tz header-->

            <section class="shop-checkout">
                <div class="container">
                    <!--Start Breadcrumbs-->
                    <ul class="tz-breadcrumbs">
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li class="current">
                            Shop Cart
                        </li>
                    </ul>
                    <!--End Breadcrumbs-->
                    <h1 class="page-title">Shop Cart</h1>
                    <!--Start form table-->
                    <!--                    <form>-->
                    <s:if test="%{msg!=null}">
                        <p style="color: red"><i class="fa fa-times"></i><s:property value="msg" /></p>
                    </s:if>
                    <s:if test="%{#session.CART.items.size > 0}">
                        <table class="shop_table cart">
                            <!--Table header-->
                            <thead>
                                <tr>
                                    <th class="product-remove">&nbsp;</th>
                                    <th>No</th>
                                    <th class="product-thumbnail">Product</th>
                                    <th class="product-name">&nbsp;</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-subtotal">Total</th>
                                    <th>Update</th>
                                </tr>
                            </thead>
                            <!--End table header-->

                            <!--Table body-->
                            <tbody>
                                <s:iterator value="%{#session.CART.items}" status="counter">
                                    <s:form action="UpdateCart" method="POST" theme="simple">
                                        <tr class="cart_item">
                                            <td class="product-remove">
                                                <s:url var="deleteLink" value="DeleteItemAction">
                                                    <s:param name="id" value="key.id" />
                                                </s:url>
                                                <s:a href="%{deleteLink}" class="remove" title="Remove this item">
                                                    <i class="fa fa-trash"></i>
                                                </s:a>
                                            </td>
                                            <td>
                                                <s:property value="%{#counter.count}" />
                                            </td>
                                            <td class="product-thumbnail">
                                                <a href="single-product.html"><img src="<s:property value="key.imgPath" />" alt="cart" /></a>
                                            </td>
                                            <td class="product-name">
                                                <a href="#"><s:property value="key.name" /></a>
                                                <span class="color">
                                                    Color: <s:property value="key.color" />
                                                </span>
                                            </td>
                                            <td class="product-price">
                                                <span class="amount">$<s:property value="key.price" /></span>
                                            </td>

                                            <td class="product-quantity">
                                                <div class="quantity">
                                                    <input type="number" name="quantity" 
                                                           value="<s:property value="value" />" 
                                                           class="input-text qty text" />
                                                    <input type="hidden" name="id" value="<s:property value="key.id" />"/>
                                                </div>
                                            </td>

                                            <td class="product-subtotal">
                                                <span class="amount">$<s:property value="key.price * value" /></span>
                                            </td>
                                            <td>
                                                <s:submit value="Update" />
                                            </td>
                                        </tr>
                                    </s:form>
                                </s:iterator>
                                <tr>
                            <a class="back-shop" href="#"><i class="fa fa-angle-left"></i> BACK TO SHOP</a>
                            </tr>

                            </tbody>
                            <!--End table body-->
                        </table>
                    </s:if>
                    <s:else>
                        <div class="col-md-12">
                            <h1>Your shopping cart is empty</h1>
                            <h3><i class="icon-clock-1"></i>Once you add an activity to your cart, we will save your cart for 30 minutes.</h3>
                            <h3>Why is my cart empty? Sorry for any inconvenience. There are several reasons your cart may be empty:</h3>
                            <h4><i class="fa fa-circle"></i>You closed your browser. Items in your cart are not reserved until you have completed checkout.</h4>
                            <h4><i class="fa fa-circle"></i>You may be having problems using the shopping cart. If this is the case, please contact Customer Service or visit our Help Desk.</h4>
                        </div>
                    </s:else>
                    <!-- Check out form -->
                    

                    <!--                    </form>-->

                    <!--End form table-->

                    <!--Cart attr-->
                    <div class="row">
                        <div class="col-md-10 col-sm-10">
                            <!--Coupon-->
                            
                            <!--End coupon-->
                        </div>
                        <div class="col-md-2 col-sm-2">

                            <!--Cart totals-->
                            <s:if test="%{#session.CART.items.size > 0}">
                            <h2><s:a class="btn_full" href="CheckOut">Check out</s:a></h2>
                            </s:if>
                            <!--End cart totals-->

                        </div>
                    </div>
                    <!--End cart attr-->
                </div>
            </section>

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

    <!-- Mirrored from html.templaza.net/bikesport/shop-cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 17 Apr 2018 15:00:12 GMT -->
</html>