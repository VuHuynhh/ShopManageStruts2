<%@taglib uri="/struts-tags" prefix="s" %>
<div class="tab-content">
    <!--Tab item-->
    <div class="tab-pane active" id="one_read">
        <div class="row">

            <s:iterator value="%{productList}">
                <div class="col-md-4 col-sm-6">
                    <!--Start product item-->
                    <div class="product-item">
                        <div class="product-thubnail">


                            <img src="<s:property value="imgPath" />" class="img-main-product" />
                            <div class="product-meta">
                                <s:url var="addToCartLink" value="AddToCart">
                                    <s:param name="id" value="id"/>
                                </s:url>
                                <s:a class="add-to-cart" href="%{addToCartLink}">Add to cart</s:a>
                                    <span class="quick-view">
                                    <s:url var="viewProductLink" value="ViewProduct">
                                        <s:param name="id" value="id"/>
                                    </s:url>
                                    <s:a href="%{viewProductLink}">Quick view</s:a>
                                    </span>
                                </div>
                            </div>
                            <div class="product-infomation">
                                <h4><a href="single-product.jsp"><s:property value="name"/></a></h4>
                            <span class="product-price">$<s:property value="price"/></span>
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
            </s:iterator>

        </div>
    </div>
    <!--End tab item-->
</div>