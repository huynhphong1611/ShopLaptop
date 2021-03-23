<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer</title>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/client/loading-spinner.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/client/css/profile-page.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/client/css/order-list.css'/>">

        <div class="breadcrumb-area pt-255 pb-170" style="background-image: url(https://www.klaviyo.com/wp-content/uploads/2016/09/abstract-background-1024x273.jpg)">
            <div class="container-fluid">
                <div class="breadcrumb-content text-center">
                    <h2>${sessionScope.customerLogin.getCustomerName()}</h2>
                    <ul>
                        <li>
                            <a href="/">home</a>
                        </li>
                        <li>thông tin khách hàng</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="container bootstrap snippet ptb-80" style="margin-bottom: 50px;">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="card-title mb-4">
                                <div class="d-flex justify-content-start">
                                    <div class="image-container">
                                        <img src="http://placehold.it/150x150" style="width: 150px; height: 150px" class="img-thumbnail" />
                                    </div>
                                    <div class="userData ml-3">
                                        <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">
                                            <a href="javascript:void(0);">${sessionScope.customerLogin.getCustomerName()}
                                            </a>
                                        </h2>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="orders-tab" data-toggle="tab" href="#orders_tab" role="tab" aria-controls="orders_tab" aria-selected="true">Đơn hàng</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="false">Thông tin</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="something-tab" data-toggle="tab" href="#something_tab" role="tab" aria-controls="something_tab" aria-selected="false">Updating</a>
                                        </li>
                                    </ul>
                                    <!--Tab-->
                                    <div class="tab-content ml-1" id="myTabContent">
                                        <div class="tab-pane fade show active" id="orders_tab" role="tabpanel" aria-labelledby="orders-tab">
                                            <div class="row">
                                                <div class="col-sm">
                                                    <h5>Lọc:</h5>
                                                </div>
                                                <div class="col-lg-11">
                                                    <select id="status-select">
                                                        <option value="0">Tất cả</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <br />
                                            <!--<h5>Nhấn (+) để hiển thị chi tiết!</h5>-->

                                            <!--                                            <div class="loader" id="loader">
                                                                                            <svg class="circular">
                                                                                            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="5" stroke-miterlimit="10"></circle>
                                                                                            </svg>
                                                                                        </div>-->
                                            <div id="order-details-partial">
                                                <div class="table-responsive table-bordered">
                                                    <table class="table">
                                                        <thead class="thead-dark">
                                                            <tr>
                                                                <th class="text-center">ID Đơn hàng</th>
                                                                <th class="text-center">Tổng tiền</th>
                                                                <th class="text-center">Ngày đặt hàng</th>
                                                                <th class="text-center">Tình Trạng</th>
                                                                <th class="text-center">Ghi chú</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${orderlist}" var="item">
                                                            <td class="text-center" >
                                                                <a href="/orderdetail/${item.getOrderID()}">${item.getOrderID()}</a>
                                                            </td>
                                                            <td class="text-center">
                                                                <a href="/orderdetail/${item.getOrderID()}"> 
                                                                    <fmt:formatNumber type = "number" 
                                                                                      maxFractionDigits = "3" 
                                                                                      value = "${item.getTotal()}" />₫
                                                                </a>


                                                            </td>
                                                            <td class="text-center">
                                                                <a href="/orderdetail/${item.getOrderID()}">
                                                                    ${item.getOrderDate()}
                                                                </a>
                                                            </td>
                                                            <th class="text-center">
                                                                <a href="/orderdetail/${item.getOrderID()}">
                                                                    ${item.getStatusName()}
                                                                </a>
                                                            </th>
                                                            <td class="text-center">
                                                                <c:choose>
                                                                    <c:when test="${item.getOrderStatusID() == 1}">
                                                                        <a class="btn btn-danger" href="profile/cancelorder/${item.getOrderID()}">
                                                                            Hủy đơn hàng
                                                                        </a>
                                                                    </c:when>
                                                                </c:choose>
                                                            </td>
                                                            </tr>
                                                            <tr class="hide-table-padding">
                                                                <td colspan="7">
                                                                    <div id="collapse-@item.OrderID" class="collapse in p-3">
                                                                        <div class="card card-body" id="@item.OrderID-product-partial">
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="tab-pane fade" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight:bold;">Họ tên</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    ${sessionScope.customerLogin.getCustomerName()}
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight:bold;">Số điện thoại</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    ${sessionScope.customerLogin.getCustomerPhone()}
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight:bold;">Email</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    ${sessionScope.customerLogin.getCustomerEmail()}
                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight:bold;">Đia chỉ</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    ${sessionScope.customerLogin.getCustomerAddress()}
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight:bold;">Username</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    ${sessionScope.customerLogin.getCustomerUsername()}
                                                </div>
                                            </div>


                                        </div>

                                        <div class="tab-pane fade" id="something_tab" role="tabpanel" aria-labelledby="something-tab">
                                            Cập nhật thông tin
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

 
        <script>
            function CancelOrder(id) {
                swal({
                    title: `Cancel order with id: ${id}?`,
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                }).then((willDelete) => {
                    if (willDelete) {
                        $.ajax({
                            type: "post",
                            url: `@Url.Action("EditOrder", "Ordered")`,
                            data: {
                                   "Orderid": id,
                                   "StatusID": 5
                            },
                            success: function (response) {
                                if (response.Status == true) {
                                    swal("Cancel success", "", "success")
                                            .then((value) => {
                                                location.reload();
                                            });
                                } else if (response.Status == false) {
                                    swal("Cancel fail", data.Message, "error");
                                }
                            },
                            error: function () {
                                swal("Cancel fail", "", "error");
                            }
                        });
                    }
                });
            }
            ;
        </script>
    </body>
</html>
