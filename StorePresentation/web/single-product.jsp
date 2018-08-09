<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from html.templaza.net/bikesport/single-product.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 17 Apr 2018 15:00:13 GMT -->
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Bike Detail"/>
    </jsp:include>
    <body>
        <!--Start class site-->
        <div class="tz-site">

            <!--Start id tz header-->
            <%@include file="header_menu.jsp" %>
            <!--End id tz header-->

            <!--Start shop single-->
            <section class="tz-shop-single">
                <div class="container">

                    <!--Start Breadcrumbs-->
                    <ul class="tz-breadcrumbs">
                        <li>
                            <a href="index-2.html">Home</a>
                        </li>
                        <li class="current">
                            Category
                        </li>
                    </ul>
                    <!--End Breadcrumbs-->
                    
                    <div class="row">
                        <div class="col-md-6 col-sm-6">

                            <!--Shop images-->
                            <s:form action="AddToCart" method="POST" theme="simple">
                            <div class="shop-images">
                                <ul class="single-gallery">
                                    <li>
                                        <img src="<s:property value="product.imgPath"/>" alt="Propel Advanced Pro">
                                    </li>
                                </ul>
                                <div class="product-social">
                                    <a href="#" class="fa fa-facebook"></a>
                                    <a href="#" class="fa fa-twitter"></a>
                                    <a href="#" class="fa fa-google-plus"></a>
                                    <a href="#" class="fa fa-dribbble"></a>
                                </div>
                            </div>
                            <!--End shop image-->
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <!--Shop content-->
                            
                                <div class="entry-summary">
                                    <h1><s:property value="product.name"/></h1>
                                    <span class="p-vote">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-half-o"></i>
                                    </span>
                                    <p class="product-price">
                                        <span class="price">$<s:property value="product.price"/></span>
                                        <span class="stock">Availability:  <span>In stock</span></span>
                                    </p>
                                    <div class="description">
                                        <p>
                                            <s:property value="product.description"/>
                                        </p>
                                    </div>
                                    <form class="tz_variations_form ">
                                        <p class="form-attr">
                                            <span class="color">
                                                <label>Color:</label>
                                                <select name="color" >
                                                    <option selected=""><s:property value="product.color"/></option>
                                                </select>
                                            </span>

                                        </p>
                                        <p>
                                            <s:url var="addToCartLink" value="AddToCart">
                                                <s:param name="id" value="id"/>
                                            </s:url>
                                            <i class="fa fa-cart-plus"></i>
                                            
                                            <span style="font-size: 20px;" class="quick-view">
                                                <s:a class="add-to-cart" href="%{addToCartLink}">Add to cart</s:a>
                                            </span>
                                            </p>
                                        </form>
                                </s:form>
                            </div>
                            <!--End shop content-->
                        </div>

                    </div>
                </div>

                <!--Shop tabs-->
                <div class="tz-shop-tabs">
                    <div class="container">
                        <div class="tab-head">
                            <ul class="nav nav-tabs">
                                <li role="presentation" class="active"><a href="#information" data-toggle="tab">Information</a></li>
                                <li role="presentation"><a href="#description" data-toggle="tab">Description</a></li>
                            </ul>
                        </div>
                        <div class="tab-content">

                            <div class="tab-pane active" id="information">
                                <div class="container"> 
                                    <table class="table table-hover table-responsive">
                                        <tbody>
                                            <tr>
                                                <th>Chassis</th>
                                                <th><s:property value="product.chassis"/></th>
                                            </tr>
                                            <tr>
                                                <th>Tire</th>
                                                <th><s:property value="product.tire"/></th>
                                            </tr>
                                            <tr>
                                                <th>Color</th>
                                                <th><s:property value="product.color"/></th>
                                            </tr>
                                            <tr>
                                                <th>Fork</th>
                                                <th><s:property value="product.fork"/></th>
                                            </tr>
                                            <tr>
                                                <th>Release Date</th>
                                                <th><s:property value="product.releaseDate"/></th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane" id="description">
                                <p><s:property value="product.description"/></p>

                            </div>
                        </div>
                    </div>
                </div>
                <!--End tab-->

                <!--Tabs product-->
                <div class="container">
                    <div class="box-shadow">

                        <!--Tabs header-->
                        <div class="tz-tabs-header">
                            <h2 class="tz-tabs-title pull-left">Widget Products</h2>
                            <ul class="nav nav-tabs pull-right tz-nav-tabs">
                                <li role="presentation" class="active"><a href="#one_read" data-toggle="tab">On-Road <i class="fa fa-circle"></i></a></li>
                                <li role="presentation"><a href="#x_road" data-toggle="tab">X-Road <i class="fa fa-circle"></i></a></li>
                                <li role="presentation"><a href="#off_road" data-toggle="tab">Off-Road <i class="fa fa-circle"></i></a></li>
                                <li role="presentation"><a href="#bmx" data-toggle="tab">BMX</a></li>
                            </ul>
                        </div>
                        <!--End tab header-->

                        <!--Tab content-->
                        <div class="tab-content">

                            <!--Tab item-->
                            <div class="tab-pane active" id="one_read">
                                <div class="row row-item">
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product4.png" alt="product 4" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">Propel Advanced SL 0</a></h4>
                                                <span class="product-price">$900.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->
                                    </div>
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product5.jpg" alt="product 2" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">Defy Advanced SL</a></h4>
                                                <span class="product-price">$1,770.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product6.jpg" alt="product 3" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">FastRoad CoMax</a></h4>
                                                <span class="product-price">$900.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product7.jpg" alt="product 4" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">Propel Advanced SL 0</a></h4>
                                                <span class="product-price">$900.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                </div>
                            </div>
                            <!--End tab item-->

                            <!--Tab item-->
                            <div class="tab-pane" id="x_road">
                                <div class="row row-item">
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product5.jpg" alt="product 2" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">Defy Advanced SL</a></h4>
                                                <span class="product-price">$1,770.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product4.png" alt="product 4" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">Propel Advanced SL 0</a></h4>
                                                <span class="product-price">$900.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product6.jpg" alt="product 3" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">FastRoad CoMax</a></h4>
                                                <span class="product-price">$900.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product7.jpg" alt="product 4" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">Propel Advanced SL 0</a></h4>
                                                <span class="product-price">$900.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                </div>
                            </div>
                            <!--End tab item-->

                            <!--Tab item-->
                            <div class="tab-pane" id="off_road">
                                <div class="row row-item">
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product7.jpg" alt="product 4" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">Propel Advanced SL 0</a></h4>
                                                <span class="product-price">$900.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product4.png" alt="product 4" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">Propel Advanced SL 0</a></h4>
                                                <span class="product-price">$900.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product5.jpg" alt="product 2" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">Defy Advanced SL</a></h4>
                                                <span class="product-price">$1,770.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product6.jpg" alt="product 3" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">FastRoad CoMax</a></h4>
                                                <span class="product-price">$900.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                </div>
                            </div>
                            <!--End tab item-->

                            <!--Tab item-->
                            <div class="tab-pane" id="bmx">
                                <div class="row row-item">
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product6.jpg" alt="product 3" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">FastRoad CoMax</a></h4>
                                                <span class="product-price">$900.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product4.png" alt="product 4" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">Propel Advanced SL 0</a></h4>
                                                <span class="product-price">$900.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product5.jpg" alt="product 2" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">Defy Advanced SL</a></h4>
                                                <span class="product-price">$1,770.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                    <div class="col-md-3 col-sm-6">

                                        <!--Start product item-->
                                        <div class="product-item">
                                            <div class="product-thubnail">
                                                <img src="images/product/product7.jpg" alt="product 4" />
                                                <div class="product-meta">
                                                    <a class="add-to-cart" href="shop-cart.html">Add to cart</a>
                                                    <span class="quick-view">
                                                        <a href="#">Quick view</a>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="product-infomation">
                                                <h4><a href="single-product.html">Propel Advanced SL 0</a></h4>
                                                <span class="product-price">$900.00</span>
                                                <span class="product-attr">
                                                    <i class="fa fa-circle light-blue"></i>
                                                    <i class="fa fa-circle orange"></i>
                                                    <i class="fa fa-circle blueviolet"></i>
                                                    <i class="fa fa-circle orange-dark"></i>
                                                    <i class="fa fa-circle steelblue"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <!--End product item-->

                                    </div>
                                </div>
                            </div>
                            <!--End tab item-->

                        </div>
                        <!--End tab content-->

                    </div>
                </div>
                <!--End tabs-->

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
            </section>
            <!--End Shop single-->

            <!--Start Footer-->
            <%@include file="footer.jsp" %>
            <!--End Footer-->

        </div><!--End class site-->

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type='text/javascript' src="js/off-canvas.js"></script>
        <!--jQuery Countdow-->
        <script src="js/jquery.plugin.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <!--End Countdow-->

        <script src="js/owl.carousel.js"></script>
        <script src="js/custom.js"></script>

    </body>

    <!-- Mirrored from html.templaza.net/bikesport/single-product.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 17 Apr 2018 15:01:33 GMT -->
</html>