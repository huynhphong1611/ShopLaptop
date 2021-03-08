<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${product.getProductName()}</title>
    </head>
    <body>
        <div class="breadcrumb-area pt-255 pb-170" style="background-image: url(https://shophangngoai.vn/wp-content/uploads/2018/11/Tu-van-chon-mua-laptop-xach-tay-shop-cu-theo-khoang-gia1.jpg)">
            <div class="container-fluid">
                <div class="breadcrumb-content text-center">
                    <h2>${product.getProductName()}</h2>
                    <ul>
                        <li>
                            <a href="<c:url value="/" />">home</a>
                        </li>
                        <li>
                            <a href="<c:url value="/shop" />">cửa hàng</a>
                        </li>
                        <li>${product.getProductName()}</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="product-details-area fluid-padding-3 ptb-130">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="product-details-img-content">
                            <div class="product-details-tab mr-40">
                                <div class="product-details-large tab-content">
                                    <div class="tab-pane active" id="pro-details1">
                                        <div class="easyzoom easyzoom--overlay">
                                            <a href="javascript:void(0);">
                                                <img src="${product.getProductImage()}" alt="${product.getProductImage()}">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-details-small nav mt-12 product-dec-slider owl-carousel">
                                    <a class="active" href="#pro-details1">
                                        <img src="${product.getProductImage()}" alt="${product.getProductImage()}">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="product-details-content">
                            <h2>${product.getProductName()}</h2>
                            <div class="quick-view-rating">
                                <i class="fa fa-star reting-color"></i>
                                <i class="fa fa-star reting-color"></i>
                                <i class="fa fa-star reting-color"></i>
                                <i class="fa fa-star reting-color"></i>
                                <i class="fa fa-star reting-color"></i>
                            </div>
                            <div class="product-price">
                                <h5 class="pd-sub-title">Giá</h5>
                                <c:choose>
                                    <c:when test="${item.getPromotionPrice() == 0 || empty item.getPromotionPrice()}">
                                        <div class="original-price">
                                            <fmt:formatNumber type = "number" 
                                                              maxFractionDigits = "3" 
                                                              value = "${product.getProductPrice()}" />₫
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="discount-price">
                                            <fmt:formatNumber type = "number" 
                                                              maxFractionDigits = "3" 
                                                              value = "${product.getProductPrice()}" />₫
                                        </div>
                                        <span class="original-price">
                                            <fmt:formatNumber type = "number" 
                                                              maxFractionDigits = "3" 
                                                              value = "${product.getPromotionPrice()}" />₫
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="product-overview">
                                <h5 class="pd-sub-title">Tổng quan</h5>
                                <p>${product.getProductDescription()}</p>
                            </div>
                            <div class="quickview-plus-minus">
                                <div class="cart-plus-minus">
                                    <input type="text" value="01" name="qtybutton" class="cart-plus-minus-box" id="quantity-input">
                                </div>
                                <div class="quickview-btn-cart">
                                    <a class="btn-style cr-btn" href="javascrip:void(0);" id="submit-btn">
                                        <span>
                                            <i class="ti-shopping-cart" id="btn-icon"></i> thêm vào giỏ hàng
                                        </span>
                                    </a>
                                </div>
                                <div id="alerts"></div>
                            </div>
                            <div id="config-detail">
                                <div class="product-overview">
                                    <h5 class="pd-sub-title">Chi tiết</h5>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Thông số kỹ thuật</th>
                                                <th>${product.getProductName()}</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Java</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>C</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>C++</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="product-share">
                                <h5 class="pd-sub-title">Chia sẻ</h5>
                                <ul>
                                    <li>
                                        <a href="javascript:void(0)"><i class="icofont icofont-social-facebook"></i></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)"><i class="icofont icofont-social-twitter"></i></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)"><i class="icofont icofont-social-pinterest"></i></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)"> <i class="icofont icofont-social-instagram"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $("#submit-btn").click(function () {
                event.preventDefault();
                let prodid = ${product.getProductID()};
                let quantity = $("#quantity-input").val();

                $.ajax({
                    url: "<c:url value="/cart/addtocart" />",
                    type: "get",
                    data: {
                        prodid: prodid,
                        quantity: quantity
                    },
                    dataType: "json",
                    contentType: "application/json",
                    success: function (data) {
                        console.log(data);
                        if (data.Status == true) {
                            swal("Success", "Add to cart success!", "success")
                                    .then((value) => {
                                        location.reload();
                                    });
                        } else {
                            swal("Failed", data.message, "error");
                        }
                    },
                    error: function (response) {
                        swal("Failed", "Add to cart failed!", "error");
                    }
                });
            });
        });
    </script>        
</body>
</html>
