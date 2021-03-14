<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
    </head>
    <body>
        <div class="breadcrumb-area pt-255 pb-170" style="background-image: url(https://www.klaviyo.com/wp-content/uploads/2016/09/abstract-background-1024x273.jpg)">
            <div class="container-fluid">
                <div class="breadcrumb-content text-center">
                    <h2>giỏ hàng</h2>
                    <ul>
                        <li>
                            <a href="<c:url value="/"/>">home</a>
                        </li>
                        <li>giỏ hàng</li>
                    </ul>
                </div>
            </div>
        </div>

        <c:set var="subtotal" value="${0}"/>
        <c:set var="total" value="${0}"/>

        <div class="product-cart-area pt-120 pb-130">
            <c:choose>
                <c:when test="${empty sessionScope.cartlist}">
                    <h1 class="text-center">
                        Giỏ hàng trống
                        <img src="<c:url value="/assets/client/img/cart/empty-cart.png"/>"/>
                    </h1>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="cart-shiping-update">
                                <div class="cart-shipping">
                                    <a class="btn-style cr-btn" href="<c:url value="/shop" />">
                                        <span>bắt đầu mua hàng...</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="table-content table-responsive">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="product-name text-center">#</th>
                                                <th class="product-price text-center">Tên</th>
                                                <th class="product-price text-center">Số lượng</th>
                                                <th class="product-name text-center">Đơn giá</th>
                                                <th class="product-quantity text-center">Tổng</th>
                                                <th class="product-subtotal text-center">Tùy chọn</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${sessionScope.cartlist}">
                                                <tr>
                                                    <td class="product-thumbnail text-center">
                                                        <a href="#">
                                                            <img src="${item.product.getProductImage()}" alt="${item.product.getProductName()}" style="width: 80px;">

                                                        </a>
                                                    </td>
                                                    <td class="product-name text-center">
                                                        <a href="<c:url value="/product/${item.product.getProductURL()}/${item.product.getProductID()}"/>">
                                                            ${item.product.getProductName()}
                                                        </a>
                                                    </td>
                                                    <td class="product-quantity text-center">
                                                        <span class="amount">
                                                            <input type="number" value="${item.quantity}" >
                                                        </span>
                                                    </td>
                                                    <td class="product-price text-center">
                                                        <c:choose>
                                                            <c:when test="${empty item.product.getPromotionPrice()}">
                                                                <span>
                                                                    <fmt:formatNumber type = "number" 
                                                                                      maxFractionDigits = "3" 
                                                                                      value = "${item.product.getProductPrice()}" />₫
                                                                </span>
                                                                <c:set var="subtotal" value="${subtotal + item.product.getProductPrice() * item.quantity}" />
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span>
                                                                    <fmt:formatNumber type = "number" 
                                                                                      maxFractionDigits = "3" 
                                                                                      value = "${item.product.getPromotionPrice()}" />₫
                                                                </span>
                                                                <c:set var="subtotal" value="${subtotal + item.product.getPromotionPrice() * item.quantity}" />
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="product-subtotal text-center">
                                                        <fmt:formatNumber type = "number" 
                                                                          maxFractionDigits = "3" 
                                                                          value = "${subtotal}" />₫
                                                    </td>
                                                    <td class="product-cart-icon product-subtotal text-center">
                                                        <a href="/cart/deletefromcart?prodid=${item.product.getProductID()}" >
                                                            <i class="ti-trash"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <c:set var="total" value="${total + subtotal}" />
                                                <c:set var="subtotal" value="${0}" />
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="cart-shiping-update">
                                    <div class="cart-shipping">
                                        <a class="btn-style cr-btn" href="<c:url value="/shop"/>">
                                            <span>tiếp tục mua hàng</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-7 col-sm-6">
                            </div>
                            <div class="col-md-5 col-sm-6">
                                <div class="shop-total">
                                    <h3>chi tiết giỏ hàng</h3>
                                    <ul>
                                        <li>
                                            đơn giá
                                            <span>
                                                <fmt:formatNumber type = "number" 
                                                                  maxFractionDigits = "3" 
                                                                  value = "${total}" />₫
                                            </span>
                                        </li>
                                        <li class="order-total">
                                            vận chuyển
                                            <span>0</span>
                                        </li>
                                        <li>
                                            tổng đơn hàng
                                            <span>
                                                <fmt:formatNumber type = "number" 
                                                                  maxFractionDigits = "3" 
                                                                  value = "${total}" />₫
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="continue-shopping-btn text-center">
                                    <a href="<c:url value="/shop"/>">tiếp tục mua hàng</a>
                                </div>
                                <div class="cart-btn text-center mb-15">
                                    <a href="<c:url value="/checkout"/>">thanh toán</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
    <script>
        $(document).ready(function (proid) {
            $("#submit-btn").click(function () {
                event.preventDefault();
                let prodid = ${product.getProductID()};
                $.ajax({
                    url: "<c:url value="/cart/deletefromcart" />",
                    type: "get",
                    data: {
                        prodid: prodid
                    },
                    dataType: "json",
                    contentType: "application/json",
                    success: function (data) {
                        console.log(data);
                        if (data.Status == true) {
                            swal("Success", "Delete from success!", "success")
                                    .then((value) => {
                                        location.reload();
                                    });
                        } else {
                            swal("Failed", data.message, "error");
                        }
                    },
                    error: function (response) {
                        swal("Failed", "failed!", "error");
                    }
                });
            });
        });
    </script>    
</html>
