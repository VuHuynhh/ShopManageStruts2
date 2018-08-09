<%@taglib uri="/struts-tags" prefix="s" %>
<header id="tz-header" class="bk-white">
    <div class="container">

        <!--Start class header top-->
        <div class="header-top">
            <ul class="pull-left">
                <li>
                    <a href="#">
                        USD
                        <span class="fa fa-angle-down tz-down"></span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="#">EURO</a>
                        </li>
                        <li>
                            <a href="#">USD</a>
                        </li>
                        <li>
                            <a href="#">EGP</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        English
                        <span class="fa fa-angle-down tz-down"></span>
                    </a>
                </li>
                <li>
                    <a href="#">Call us:   (012) 3456 7890</a>
                </li>
            </ul>
            <ul class="pull-right">
                <s:if test="%{#session.USER != null}">
                    <li>
                        <s:url value="CheckHistory" var="viewHistoryLink">
                        </s:url>
                        <s:a href="%{viewHistoryLink}" >History</s:a>
                        </li>
                </s:if>
                <li class="tz-header-login">
                    <s:if test="%{#session.USER == null}">
                        <a href="shop-login.jsp">Login</a>
                    </s:if>
                    <s:if test="%{#session.USER != null}">
                        <a href="profile.jsp">
                            <i class="fa fa-user">
                                <s:property value="#session.USER.lastName"/>
                            </i>
                        </a>
                    </s:if>
                </li>
                <li>
                    <s:if test="%{#session.USER == null}">
                        <a href="shop-register.jsp">Register</a>
                    </s:if>
                    <s:if test="%{#session.USER != null}">
                        <s:url action="Logout" var="logoutLink"></s:url>
                        <s:a href="%{logoutLink}">
                            <i class="fa fa-sign-out">Log-out</i>
                        </s:a>
                    </s:if>
                </li>
            </ul>
        </div>
        <!--End class header top-->

        <!--Start header content-->
        <div class="header-content">
            <h3 class="tz-logo pull-left"><a href="home"><img src="images/logo.png" alt="home" /></a></h3>
            <div class="tz-search pull-right">

                <!--Start form search-->
                <s:form theme="simple" action="SearchProduct">
                    <input type="text" class="tz-query" id="tz-query" value="" name="searchValue" placeholder="Enter a bike name" required="">
                    <button type="submit"></button>
                </s:form>
                <!--End Form search-->

                <!--live search-->
                <div class="live-search">
                    <ul>
                        <li>
                            <div class="live-img"><img src="images/product/product-search1.jpg" alt="product search one"></div>
                            <div class="live-search-content">
                                <h6><a href="single-product.jsp">Defy Advanced</a></h6>
                                <span class="live-meta">
                                    <a href="single-product.jsp">$2650.00</a>
                                    <span class="product-color">
                                        <i class="light-blue"></i>
                                        <i class="orange"></i>
                                        <i class="orange-dark"></i>
                                    </span>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="live-img"><img src="images/product/product-search2.jpg" alt="product search two"></div>
                            <div class="live-search-content">
                                <h6><a href="single-product.jsp">Defy Advanced</a></h6>
                                <span class="live-meta">
                                    <a href="single-product.jsp">$2650.00</a>
                                    <span class="product-color">
                                        <i class="light-blue"></i>
                                        <i class="orange"></i>
                                        <i class="blueviolet"></i>
                                        <i class="orange-dark"></i>
                                    </span>
                                </span>
                            </div>
                        </li>
                        <li>
                            <div class="live-img"><img src="images/product/product-search3.jpg" alt="product search one"></div>
                            <div class="live-search-content">
                                <h6><a href="single-product.jsp">Defy Advanced</a></h6>
                                <span class="live-meta">
                                    <a href="single-product.jsp">$2650.00</a>
                                    <span class="product-color">
                                        <i class="blueviolet"></i>
                                        <i class="light-blue"></i>
                                        <i class="orange-dark"></i>
                                        <i class="orange"></i>
                                    </span>
                                </span>
                            </div>
                        </li>
                    </ul>
                </div>
                <!--End live search-->
            </div>
        </div>
        <!--End class header content-->
    </div>

    <!--Start main menu -->
    <nav class="tz-menu-primary">
        <div class="container">

            <!--Main Menu-->
            <ul class="tz-main-menu pull-left nav-collapse">
                <li>
                    <a href="home">Home</a>
                </li>
                <li>

                    <s:url id="viewProduct" action="LoadProduct">
                        <s:param name="page" value="1"/>                                                           
                    </s:url>
                    <s:a href="%{viewProduct}">Shop</s:a>
                    </li>
                <s:if test="%{#session.USER.roleId == 1}">
                    <li>
                        <a href="ManageProduct">
                            Manage product
                        </a>


                        <ul class="sub-menu">
                            <li>
                                <a href="ViewImageAction">Upload product</a>
                            </li>
                            <li>
                                <a href="ManageProduct">Manage product</a>
                            </li>
                            <li>
                                <a href="upload-image.jsp">Upload Image</a>
                            </li>   
                        </ul>
                    </li>
                    <li>
                        <s:url id="viewuser" action="ViewUser">
                            <s:param name="page" value="1"/>                                                           
                        </s:url>
                        <s:a href="%{viewuser}">Manage Users</s:a>
                        </li>
                </s:if>
                <li>
                    <a href="contact.jsp">Contact</a>
                </li>
            </ul>
            <!--End Main menu-->

            <!--Shop meta-->
            <ul class="tz-ecommerce-meta pull-right">
                <li class="tz-menu-wishlist">
                    <a href="#"><strong>0</strong></a>
                </li>
                <li class="tz-mini-cart">
                    <a href="shop-cart.jsp">
                        <strong>
                            <s:if test="%{#session.CART != null}" >
                                <s:property value="%{#session.CART.items.size}" />
                            </s:if>
                        </strong>
                        Cart</a>
                    <!--Mini cart-->
                    <!--End mini cart-->
                </li>
            </ul>
            <!--End Shop meta-->

            <!--navigation mobi-->
            <button data-target=".nav-collapse" class="btn-navbar tz_icon_menu" type="button">
                <i class="fa fa-bars"></i>
            </button>
            <!--End navigation mobi-->
        </div>
    </nav>
    <!--End stat main menu-->

</header>