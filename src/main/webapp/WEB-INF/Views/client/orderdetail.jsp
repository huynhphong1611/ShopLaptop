<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/client/loading-spinner.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/client/css/profile-page.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/client/css/order-list.css'/>">

        <div class="breadcrumb-area pt-255 pb-170" style="background-image: url(https://www.klaviyo.com/wp-content/uploads/2016/09/abstract-background-1024x273.jpg)">
            <div class="container-fluid">
                <div class="breadcrumb-content text-center">
                    <ul>
                        <li>
                            <a href="/">home</a>
                        </li>
                        <li>thông tin đơn hàng</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="container bootstrap snippet ptb-80" style="margin-bottom: 50px;">
            <div class="row">
                <div class="col-12">
                    <br />

                    <div class="row">
                        <div class="col-md-3">
                            <ul class="list-group">
                                <li class="list-group-item">Order ID</li>
                                <li class="list-group-item">Customer Name</li>
                                <li class="list-group-item">Customer Address</li>
                                <li class="list-group-item">Customer Phone</li>
                                <li class="list-group-item">Created Date</li>
                                <li class="list-group-item">Total</li>
                                <li class="list-group-item">Status</li>
                            </ul>
                        </div>
                        <div class="col-sm">
                            <ul class="list-group">
                                <li class="list-group-item">${customerdetail.getOrderID()}</li>
                                <li class="list-group-item">${customerdetail.getCustomerName()}</li>
                                <li class="list-group-item">${customerdetail.getCustomerAddress()}</li>
                                <li class="list-group-item">${customerdetail.getCustomerPhone()}</li>
                                <li class="list-group-item">${customerdetail.getOrderDate()}</li>
                                <li class="list-group-item">
                                    <fmt:formatNumber type = "number" 
                                                      maxFractionDigits = "3" 
                                                      value = "${customerdetail.getTotal()}" />₫
                                </li>
                                <li class="list-group-item">
                                    <div class="alert" role="alert" id="alert-status">
                                        ${customerdetail.getStatusName()}
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <br />

                    <table class="table table-bordered" id="order-table">
                        <thead>
                            <tr>
                                <th>
                                    #
                                </th>
                                <th>
                                    Ten Sp
                                </th>
                                <th>
                                    Gia
                                </th>
                                <th>
                                    So luong
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${productlist}" var="item">
                                <tr>
                                    <td>
                                        <img src="${item.getProductImage()}" style="max-height: 50px;" />
                                    </td>
                                    <td>${item.getProductName()}</td>
                                    <td>
                                        <fmt:formatNumber type = "number" 
                                                          maxFractionDigits = "3" 
                                                          value = "${item.getProductPrice()}" />₫
                                    </td>
                                    <td>${item.getProductStock()}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                var alert = $("#alert-status");
                var statusid = ${customerdetail.getOrderStatusID()};
                if (statusid === 1) {
                    alert.addClass('alert-secondary');
                } else if (statusid === 2) {
                    alert.addClass('alert-primary');
                } else if (statusid === 3) {
                    alert.addClass('alert-success');
                } else if (statusid === 4 || statusid === 5) {
                    alert.addClass('alert-danger');
                }
            })
        </script>
    </body>
</html>
