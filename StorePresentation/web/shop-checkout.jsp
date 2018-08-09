<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">

    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Shop check-out"/>
    </jsp:include>
    <body>
        <!--Start class site-->
        <div class="tz-site">

            <!--Start id tz header-->
            <%@include file="header_menu.jsp" %>
            <!--End id tz header-->

            <section class="shop-cart">
                <div class="container">
                    <!--Start Breadcrumbs-->
                    <ul class="tz-breadcrumbs">
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li class="current">
                            Checkout
                        </li>
                    </ul>
                    <!--End Breadcrumbs-->

                    <div class="row">
                        <div class="col-md-6">
                            <h1 class="page-title">Checkout Successful</h1>

                            <!--Shop info-->
                            <div class="shop-info">
                                <p style="color: #204d74">#Dear <s:property value="%{#session.USER.firstName}" /></p>
                                <p>Thank you for booking with our web-site, You order has been 
                                    successfully placed at <s:date name="%{date}" format="dd-MM-yyyy" />, and we're processing it now.</p>
                            </div>
                            <!--End shop info-->
                            <s:a href="home">Do you want to looking for more new bike?</s:a>

                        </div>
                        <div class="col-md-6">
                            <h3>Please see details below</h3>
                            <!--Order review-->
                            <div id="order_review">
                                <h3>Your Order</h3>

                                <!--Shop table-->
                                <table class="shop_table">
                                    <thead>
                                        <tr>
                                            <th class="product-name">Product</th>
                                            <th class="product-total">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <s:iterator var="item" value="%{cart.items}">
                                            <tr class="cart_item">
                                                <td class="product-name">
                                                    <s:property value="key.name" />
                                                    <strong class="product-quantity">x <s:property value="value"/></strong>
                                                </td>
                                                <td class="product-total">
                                                    <span class="amount">$<s:property value="key.price * value"/></span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </s:iterator>
                                    <tr class="order-total">
                                        <th>Order Total</th>
                                        <td><strong><span class="amount">$<s:property value="%{total}" /></span></strong> </td>
                                    </tr>
                                </table>
                                <!--End shop table-->

                                <!--Start payment-->
                                <div id="payment" class="checkout-payment">
                                    <ul class="payment_methods methods">
                                        <li class="payment_method_bacs">
                                            <input id="payment_method_bacs" type="radio" class="input-radio" name="payment_method" value="bacs" checked="checked">

                                            <label for="payment_method_bacs">
                                                Direct Bank Transfer
                                            </label>
                                            <div class="payment_box payment_method_bacs">
                                                <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                                            </div>
                                        </li>
                                    </ul>

                                    <div class="clear"></div>
                                </div>
                                <!--End payment-->

                            </div>
                            <!--End order review-->

                        </div>
                    </div>

                </div>
            </section>

            <!--Start Footer-->
            <%@include file="footer.jsp" %>
            <!--End Footer-->

        </div><!--End class site-->

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/off-canvas.js"></script>
        <script src="js/custom.js"></script>

    </body>

    <!-- Mirrored from html.templaza.net/bikesport/shop-checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 17 Apr 2018 15:00:13 GMT -->
</html>