<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from html.templaza.net/bikesport/shop.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 17 Apr 2018 15:02:04 GMT -->
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Shop"/>
    </jsp:include>
    <body>
        <!--Start class site-->
        <div class="tz-site">

            <!--Start id tz header-->
            <%@include file="header_menu.jsp" %>
            <!--End id tz header-->

            <!--Start shop-->
            <div class="tz-shop">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <!--Start for shop sidebar-->
                            <div class="tz-shop-sidebar">
                                <aside class="widget widget_product_categories">
                                    <h3 class="widget-title">Bikes product</h3>
                                    <ul class="product-categories">
                                        <li>
                                            <a href="shop.html">On-Road</a>
                                        </li>
                                        <li class="cat-parent">
                                            <a href="shop.html">X-Road</a>
                                            <ul class="children">
                                                <li>
                                                    <a href="shop.html">Aero Race <span>(3)</span></a>
                                                </li>
                                                <li>
                                                    <a href="shop.html">City <span>(3)</span></a>
                                                </li>
                                                <li>
                                                    <a href="shop.html">Comfort<span>(1)</span></a>
                                                </li>
                                                <li>
                                                    <a href="shop.html">Cruiser<span>(1)</span></a>
                                                </li>
                                                <li>
                                                    <a href="shop.html">Endurance <span>(4)</span></a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="shop.html">Off-Road</a>
                                        </li>
                                        <li>
                                            <a href="shop.html">BMX</a>
                                        </li>
                                    </ul>
                                </aside>
                                <aside class="product-catlog widget">
                                    <h3 class="widget-title">Catalog</h3>
                                    <div class="widget_price_filter">
                                        <h4 class="widget-title-children">
                                            Price Filter
                                        </h4>
                                        <form>
                                            <div id="slider-range"></div>
                                            <div class="price_label">
                                                <button type="submit" class="button">Filter</button>
                                                <span class="value-price">
                                                    <span class="from"></span>
                                                    -
                                                    <span class="to"></span>
                                                </span>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="widget_color_filter">
                                        <h4 class="widget-title-children">
                                            Color filter
                                        </h4>
                                        <ul>
                                            <li>
                                                <a href="shop.html" class="light-blue"></a>
                                            </li>
                                            <li>
                                                <a href="shop.html" class="orange"></a>
                                            </li>
                                            <li>
                                                <a href="shop.html" class="blueviolet"></a>
                                            </li>
                                            <li>
                                                <a href="shop.html" class="orange-dark"></a>
                                            </li>
                                            <li>
                                                <a href="shop.html" class="steelblue"></a>
                                            </li>
                                            <li>
                                                <a href="shop.html" class="red-light"></a>
                                            </li>
                                            <li>
                                                <a href="shop.html" class="cyan-dark"></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="widget-size-filter">
                                        <h4 class="widget-title-children">
                                            Size Filter
                                        </h4>
                                        <ul>
                                            <li>
                                                <a href="shop.html">S - Small  <span>(24)</span></a>
                                            </li>
                                            <li>
                                                <a href="shop.html">M - Medium  <span>(18)</span></a>
                                            </li>
                                            <li>
                                                <a href="shop.html">L - Large <span>(9)</span></a>
                                            </li>
                                            <li>
                                                <a href="shop.html"> XL - Extra Large <span>(39)</span></a>
                                            </li>
                                            <li>
                                                <a href="shop.html">xtra Extra Large  <span>(24)</span></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="widget-size-filter">
                                        <h4 class="widget-title-children">
                                            Brand Filter
                                        </h4>
                                        <ul>
                                            <li>
                                                <a href="shop.html">S - Small  <span>(24)</span></a>
                                            </li>
                                            <li>
                                                <a href="shop.html">M - Medium  <span>(18)</span></a>
                                            </li>
                                            <li>
                                                <a href="shop.html">L - Large <span>(9)</span></a>
                                            </li>
                                            <li>
                                                <a href="shop.html"> XL - Extra Large <span>(39)</span></a>
                                            </li>
                                            <li>
                                                <a href="shop.html">xtra Extra Large  <span>(24)</span></a>
                                            </li>
                                        </ul>
                                    </div>
                                </aside>

                            </div>
                            <!--End shop sidebar-->

                        </div>

                        <div class="col-md-9">

                            <!--Start shop content-->
                            <div class="tz-shop-content">
                                <ul class="tz-breadcrumbs">
                                    <li>
                                        <a href="#">Home</a>
                                    </li>
                                    <li class="current">
                                        Category
                                    </li>
                                </ul>
                                <div class="shop-banner">
                                    <img src="images/product/banner.jpg" alt="banner">
                                </div>
                                <div class="catalog-meta">
                                    <div class="catalog_top">
                                        <span class="style-switch">
                                            <a class="nav-grid-view fa fa-th-large active"></a>
                                            <a class="nav-list-view fa fa-list"></a>
                                        </span>
                                        <form class="shop-order">
                                            <label class="form-arrow">
                                                <select class="number-item" name="number_item">
                                                    <option value="12">12 items/page</option>
                                                    <option value="6">6 items/page</option>
                                                    <option value="3">3 items/page</option>
                                                </select>
                                            </label>
                                            <label class="form-arrow">
                                                <select name="orderby" class="orderby">
                                                    <option value="'">Sort By: Position</option>
                                                    <option value="rating">Sort by rating</option>
                                                    <option value="date">Sort by newness</option>
                                                </select>
                                            </label>
                                        </form>
                                    </div>
                                </div>

                                <div class="tz-product row grid-eff">

                                    <!--Product item-->

                                    <s:iterator value="list">
                                        <div class="product-item col-md-4 col-sm-6">
                                            <div class="item">
                                                <div class="product-item-inner">
                                                    <div class="product-thumb">
                                                        <img src="<s:property value="imgPath" />" alt="Liv Race Day Short Finger..">
                                                    </div>
                                                    <div class="product-info">
                                                        <h4><a href="shop.html"><s:property value="name"/></a></h4>
                                                        <span class="p-meta">
                                                            <span class="p-price">$<s:property value="price"/></span>
                                                            <span class="p-vote">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-half-o"></i>
                                                            </span>
                                                        </span>
                                                        <span class="p-color">
                                                            <i class="fa fa-circle light-blue"></i>
                                                            <i class="fa fa-circle orange"></i>
                                                            <i class="fa fa-circle blueviolet"></i>
                                                            <i class="fa fa-circle orange-dark"></i>
                                                            <i class="fa fa-circle steelblue"></i>
                                                        </span>
                                                        <p>
                                                            Excellence is never an accident. It is always the result of high intention and intelligent execution; it represents the wise choice of many alternatives.
                                                        </p>
                                                        <span class="p-mask">
                                                            <s:url var="addToCartLink" value="AddToCart">
                                                                <s:param name="id" value="id"/>
                                                            </s:url>
                                                            <span class="quick-view">
                                                                <s:a class="add-to-cart" href="%{addToCartLink}">Add to cart</s:a>
                                                                </span>
                                                                <a href="#" class="add-to-wishlist"><i class="fa fa-heart"></i> Add to wishlist</a>
                                                            <s:url var="viewProductLink" value="ViewProduct">
                                                                <s:param name="id" value="id"/>
                                                            </s:url>
                                                            <span class="quick-view">
                                                                <s:a href="%{viewProductLink}">Quick view</s:a>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </s:iterator>
                                    <!--End product item-->

                                </div>

                                <nav class="">
                                    <ul class="pagination pull-right">
                                       
                                    </ul>
                                </nav>
                            </div>
                            <!--End shop content-->
                        </div>
                    </div>
                </div>
            </div>
            <!--End Shop-->

            <!--Start Footer-->
            <%@include file="footer.jsp" %>
            <!--End Footer-->

        </div><!--End class site-->

        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type='text/javascript' src="js/off-canvas.js"></script>
        <!--jQuery Countdow-->
        <script src="js/jquery.plugin.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <!--End Countdow-->
        <script src="js/jquery-2.2.4.min.js"></script>
        <script src="js/common_scripts_min.js"></script>
        <script src="js/functions.js"></script>
        <script src="js/owl.carousel.js"></script>
        <script src="js/custom.js"></script>
        <script>
            jQuery(function () {
                jQuery("#slider-range").slider({
                    range: true,
                    min: 0,
                    max: 500,
                    values: [75, 300],
                    slide: function (event, ui) {
                        jQuery('.from').text('$' + ui.values[ 0 ]);
                        jQuery('.to').text('$' + ui.values[ 1 ]);
                    }
                });
                jQuery('.from').text('$' + jQuery("#slider-range").slider("values", 0));
                jQuery('.to').text('$' + jQuery("#slider-range").slider("values", 1));
            });

        </script>
        <script>
            $(function () {
                var totalRecord = '<s:property value="total"/>';
                var rows = '<s:property value="rows"/>';
                var page = '<s:property value="page"/>';
                var totalPage = Math.ceil(totalRecord / rows);
                for (var i = 1; i <= totalPage; i++) {
                    if (i === page) {
                        $('.pagination').append('<li"><a href="">' + i + '</a>');
                    } else {
                        $('.pagination').append('<li><a href="LoadProduct.action?page=' + i + '">' + i + '</a></li>');
                    }
                }
            });
        </script>
    </body>

   
</html>