<%@taglib uri="/struts-tags" prefix="s" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp">
        <jsp:param name="title" value="Edit product" />
    </jsp:include>
    <body>
        <%@include file="header_menu.jsp" %>
        <main>
            <form action="UpdateProduct" method="POST">
                <div class="row">
                    <s:if test="%{msg!=null}">
                        <s:property value="msg" />
                    </s:if>
                </div>
                <div class="margin_60 container">
                    <h3>Update product</h3>
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                            <label>Product Name </label>
                            <input type="hidden" name="productId" value="<s:property value="productId" />" />
                            <input class="form-control" value="<s:property value="product.name" />" name="productName" id="first_name" type="text"  required="">
                        </div>   
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Chassis</label>
                                    <input class="form-control" value="<s:property value="product.chassis" />" name="chassis" id="first_name" type="text"  required="">
                                </div>   
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Tire</label>
                                    <input class="form-control" value="<s:property value="product.tire" />" name="tire" id="first_name" type="text"  required="">
                                </div>   
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Fork</label>
                                    <input class="form-control" value="<s:property value="product.fork" />" name="fork" id="first_name" type="text"  required="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 col-sm-3">
                                    <div class="form-group">
                                        <label>Date</label>
                                        <input class="form-group" data-date-format="dd-MM-yyyy" type="date" name="date" required="">(<s:property value="product.releaseDate" />)
                                    </div>
                                </div> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Color</label>
                                    <select class="form-control" id="duration" name="color" required="">
                                        <option value="<s:property value="product.color" />" ><s:property value="product.color" /></option>
                                        <option value="red">red</option>
                                        <option value="blue">blue</option>
                                        <option value="black">black</option>
                                        <option value="green">green</option>
                                        <option value="yellow">yellow</option>                            
                                        <option value="gray">gray</option>                            
                                        <option value="pink">pink</option>
                                        <option value="orange">orange</option>                           
                                    </select>
                                </div></div>
                        </div>
                        <div class="form-group">
                            <button href='#' id='btn' class="btn-primary">Choose product image</button>
                            <label id="product-image"></label>
                        </div>
                        <div id="myModal" class="modal">
                            <div class="modal-content">
                                <span class="close" id="xxbtn">&times;</span>
                                <select class="image-picker" name="image" data-limit="1">
                                    <s:iterator var="image" value="%{imageList}">
                                        <s:if test="%{img == #image }">
                                            <option data-img-src="<s:property value="%{#image}"/>" value="<s:property value="%{#image}"/>"  selected></option>
                                        </s:if>
                                        <s:else>
                                            <option data-img-src="<s:property value="%{#image}"/>" value="<s:property value="%{#image}"/>" ></option>
                                        </s:else>
                                    </s:iterator>
                                </select>
                                <input type="hidden" name="imagePath" value="" id="picked-image" />
                            </div>
                        </div>
                        <input type="submit" id="save-button" class="btn-success" value="Save" />
                    </div>
                </div>
            </form>
        </main>
        <%@include file="footer.jsp" %>
    </body>
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/image-picker.min.js"></script>
    <script>
        $(function () {
            $(".image-picker").imagepicker();
            $(".image-picker").val('');
            $(".image-picker").data('picker').sync_picker_with_select();
            var $modal = $('#myModal');
            $('#btn').click(function (e) {
                e.preventDefault();
                $modal.css('display', 'block');
            });
            $('#xxbtn').on('click', function () {
                $modal.css('display', 'none');
            });
            $(window).click(function (e) {
                if (e.target == $modal[0]) {
                    $modal.css('display', 'none');
                }
            });

            $('.image_picker_image').click(function () {
                var path = $(this).attr('src');
                $('#picked-image').attr('value', path);
            });
            $('#save-button').on('click', function (e) {
                if ($('.image-picker').val() == null) {
                    e.preventDefault();
                    $('#product-image').text('Please select at least 1 picture');
                } else {
                    $('#product-image').text('');
                }
            });
        });

    </script>
</html>
