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
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/client/css/order-list.css'/>">

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
                                <li class="list-group-item">${orderdetail.getOrderID()}</li>
                                <li class="list-group-item">${orderdetail.getCustomerName()}</li>
                                <li class="list-group-item">${orderdetail.getCustomerAddress()}</li>
                                <li class="list-group-item">${orderdetail.getCustomerPhone()}</li>
                                <li class="list-group-item">${orderdetail.getOrderDate()}</li>
                                <li class="list-group-item">
                                    <fmt:formatNumber type = "number" 
                                                      maxFractionDigits = "3" 
                                                      value = "${orderdetail.getTotal()}" />₫
                                </li>
                                <li class="list-group-item">
                                    <c:choose>
                                        <c:when test="${orderdetail.getOrderStatusID() == 1}">
                                            <div class="row">
                                                <div class="col-sm">
                                                    <select class="alert" id="orderstatus-${orderdetail.getOrderID()}">
                                                        <option value="1" id="">
                                                            Đang xử lý
                                                        </option>
                                                        <option value="2" id="">
                                                            Đang giao hàng
                                                        </option>
                                                        <option value="3" id="">
                                                            Đã giao hàng
                                                        </option>
                                                        <option value="4" id="">
                                                            Hàng lỗi 
                                                        </option>
                                                        <option value="5" id="">
                                                            Đã hủy
                                                        </option>

                                                    </select>
                                                    <div class="alert" role="alert" id="alert-status">
                                                        ${orderdetail.getStatusName()}
                                                    </div>
                                                </div>
                                                <div class="col-sm">
                                                    <button class="btn btn-sm btn-success"
                                                            type="submit" value="Save"
                                                            id="save-${orderdetail.getOrderID()}"
                                                            onclick="return SaveEdit('${orderdetail.getOrderID()}')">
                                                        <i class="mdi mdi-check"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${orderdetail.getOrderStatusID() == 2}">
                                            <div class="row">
                                                <div class="col-sm">
                                                    <select class="alert" id="orderstatus-${orderdetail.getOrderID()}" onchange="return ChangeOrder('${orderdetail.getOrderID()}','${orderdetail.getOrderStatusID()}')">
                                                        <option value="2" id="">
                                                            Đang giao hàng
                                                        </option>
                                                        <option value="3" id="">
                                                            Đã giao hàng
                                                        </option>
                                                        <option value="4" id="">
                                                            Hàng lỗi 
                                                        </option>
                                                        <option value="5" id="">
                                                            Đã hủy
                                                        </option>

                                                    </select>
                                                    <div class="alert" role="alert" id="alert-status">
                                                        ${orderdetail.getStatusName()}
                                                    </div>
                                                </div>
                                                <div class="col-sm">
                                                    <button class="btn btn-sm btn-success"
                                                            type="submit" value="Save"
                                                            id="save-${orderdetail.getOrderID()}"
                                                            onclick="return SaveEdit('${orderdetail.getOrderID()}')">
                                                        <i class="mdi mdi-check"></i>
                                                    </button>
                                                </div>
                                                    
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="alert" role="alert" id="alert-status">
                                                ${orderdetail.getStatusName()}
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

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

        <script src="/assets/sweetalert.min.js"></script>
        <script>
                                        $(document).ready(function () {
                                            var alert = $("#alert-status");
                                            var statusid = ${orderdetail.getOrderStatusID()};
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
        <script>

                                                function ChangeOrder(id, status) {
                                                if ($(`#orderstatus-${orderdetail.getOrderID()}`).val() == status) {
                                                $(`#save-${id}`).hide();
                                                } else {
                                                $(`#save-${id}`).show();
                                                }
                                                }
                                                function SaveEdit(id) {
                                                swal({
                                                title: `EDIT order with id: ${orderdetail.getOrderID()}?`,
                                                        icon: "warning",
                                                        buttons: true,
                                                        dangerMode: true,
                                                })
                                                        .then((willDelete) => {
                                                        if (willDelete) {
                                                        $.ajax({
                                                                type: "get",
                                                                url: `/editorder`,
                                                                data: {
                                                                        "OrderID": id,
                                                                        "StatusID": $(`#orderstatus-${orderdetail.getOrderID()}`).val()
                                                                },
                                                                dataType: "json",
                                                                contentType: "application/json",
                                                                success: function (response) {
                                                                    if (response.Status) {
                                                                        swal("Edited!", "", "success")
                                                                            .then((value) => {
                                                                            location.href = '/admin/orderlist';
                                                                        });
                                                                    } else {
                                                                        swal("Edit fail!", "", "error");
                                                                        }
                                                                    },
                                                                error: function (error) {
                                                                swal("Edit fail!", "", "error");
                                                                }
                                                        });
                                                        }
                                                        });
                                                };
        </script>
    </body>
</html>
