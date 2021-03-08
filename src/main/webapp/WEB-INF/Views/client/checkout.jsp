<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Out</title>
    </head>
    <body>
        <div class="breadcrumb-area pt-255 pb-170" style="background-image: url(https://www.klaviyo.com/wp-content/uploads/2016/09/abstract-background-1024x273.jpg)">
            <div class="container-fluid">
                <div class="breadcrumb-content text-center">
                    <h2>thanh toán</h2>
                    <ul>
                        <li>
                            <a href="/">home</a>
                        </li>
                        <li>thanh toán</li>
                    </ul>
                </div>
            </div>
        </div>

        <c:set var="subtotal" value="${0}"/>
        <c:set var="total" value="${0}"/>

        <div class="checkout-area pt-130 pb-100">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="coupon-accordion">
                            <h3>
                                Thanh toán nặc danh! <b><a href="/">Đăng nhập ngay</a></b>
                            </h3>
                        </div>
                    </div>
                </div>
                <form action="#" id="checkout-form">
                    <div class="row">
                        <div class="col-lg-6 col-md-12 col-12">
                            <div class="checkbox-form">
                                <h3>Billing Details</h3>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="checkout-form-list">
                                            <label>Họ tên<span class="required">*</span></label>
                                            <input type="text" placeholder="Họ tên..." name="customer-fullname" id="customer-fullname" />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="checkout-form-list">
                                            <label>Địa chỉ <span class="required">*</span></label>
                                            <input type="text" placeholder="Địa chỉ..." name="customer-address" id="customer-address" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="checkout-form-list">
                                            <label>Điện thoại  <span class="required">*</span></label>
                                            <input type="tel" placeholder="Điện thoại..." name="customer-phone" id="customer-phone" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="checkout-form-list">
                                            <label>Email</label>
                                            <input type="email" placeholder="Email..." name="customer-email" id="customer-email" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-12 col-12">
                            <div class="your-order">
                                <h3>Đơn hàng của bạn:</h3>
                                <div class="your-order-table table-responsive">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="product-name">sản phẩm</th>
                                                <th class="product-total">giá</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach var="item" items="${sessionScope.cartlist}">
                                                <tr class="cart_item">
                                                    <td class="product-name">
                                                        ${item.product.getProductName()}
                                                        <strong class="product-quantity"> × ${item.quantity}</strong>
                                                    </td>
                                                    <td class="product-total">
                                                        <c:choose>
                                                            <c:when test="${empty item.product.getPromotionPrice()}">
                                                                <c:set var="subtotal" value="${subtotal + item.product.getProductPrice() * item.quantity}" />
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set var="subtotal" value="${subtotal + item.product.getPromotionPrice() * item.quantity}" />
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <span class="amount">
                                                            <fmt:formatNumber type = "number" 
                                                                              maxFractionDigits = "3" 
                                                                              value = "${subtotal}" />₫
                                                        </span>
                                                    </td>
                                                </tr>
                                                <c:set var="total" value="${total + subtotal}" />
                                                <c:set var="subtotal" value="${0}" />
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr class="order-total">
                                                <th>Tổng</th>
                                                <td>
                                                    <strong>
                                                        <span class="amount">
                                                            <fmt:formatNumber type = "number" 
                                                                              maxFractionDigits = "3" 
                                                                              value = "${total}" />₫
                                                        </span>
                                                    </strong>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="payment-method mt-40">
                                    <div class="payment-accordion">
                                        <h5 class="text-center text-danger" id="checkout-info-text"></h5>
                                        <div class="order-button-payment">

                                            <input type="submit" value="Thanh toán" id="checkout-btn"/>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <h5 id="timer-text"></h5>
                                            </div>
                                            <div class="col-sm-2">
                                                <h5 id="timer"></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="modal fade" id="no-account-modal" tabindex="-1" role="dialog" aria-labelledby="no-account-modal-label" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="no-account-modal-label">Chú ý</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Bạn đang thanh toán mà <b>không có tài khoản!</b>
                        Bạn không thể kiểm tra tình trạng hàng trong thời gian đặt hàng...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="go-to-login">Đăng nhập</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Tắt</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="<c:url value="assets/jquery.validate.min.js"/>"></script>
        <script>
            $(document).ready(function () {
                console.log("Run");
                $("#checkout-form").validate({
                    rules: {
                        'customer-fullname': "required",
                        'customer-address': "required",
                        'customer-phone': "required",
                        'customer-email': {
                            email: true
                        }
                    },
                    messages: {
                        'customer-fullname': "Không thể trống",
                        'customer-address': "Không thể trống",
                        'customer-phone': "Không thể trống",
                        'customer-email': {
                            email: "Không đúng định dạng email"
                        }
                    },
                    submitHandler: function () {
                        var data = {
                            "CustomerName": $("#customer-fullname").val(),
                            "CustomerPhone": $("#customer-phone").val(),
                            "CustomerAddress": $("#customer-address").val(),
                            "Total": "${total}"
                        };
                        $("#checkout-btn").attr("disabled", true);
                        event.preventDefault();
                        $.ajax({
                            type: "get",
                            url: "/submitcheckout",
                            data: data,
                            dataType: "json",
                            contentType: "application/json",
                            success: function (data) {
                                if (data.Status) {
                                    swal("Success", `${data.Message}`, "success").then(function () {
                                        location.href = "/";
                                    });
                                } else {
                                    swal("Fail", `${data.Message}`, "error");
                                    $("#checkout-btn").attr("disabled", false);
                                }
                            }, error: function () {
                                swal("Fail", `Fail to create your order`, "success");
                                $("#checkout-btn").attr("disabled", false);
                            }
                        });
                    }
                });
            });
        </script>

    </body>
</html>
