<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order List</title>
    </head>
    <body>

        <link href="/assets/admin/plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="/assets/admin/plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="/assets/admin/plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="/assets/loading-spinner.css" rel="stylesheet" />

        <center><h1>Doanh số bán hàng tháng ${thang} năm ${nam}</h1></center>

        <div class="row">
            <div class="col-sm" id="order-partial">
                <table class="table table-bordered" id="order-table">
                    <thead>
                        <tr>
                            <th>
                                Tổng số đơn hàng
                                
                            </th>
                            <th>
                                Tổng số đơn hàng bị hủy
                            </th>

                            <th>
                                Tổng số đơn hàng đã giao
                                
                            </th>
                            <th>
                                Doanh số bán tháng ${thang}
                            </th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                                <td>
                                    ${soluong}
                                </td>
                                <td>
                                    ${soluongfail}
                                </td>

                                <td>
                                    ${soluongsucces}
                                </td>
                                <td>
                                    ${total}
                                </td>

                    </tbody>
                </table>
            </div>
        </div>
        <br/>
        <br/>
        <center><h1>Các sản phẩm bán chạy nhất tháng tháng ${thang} năm ${nam}</h1></center>
        <div class="card-body">
            

            <table class="table table-bordered" id="product-table">
                <thead>
                    <tr>
                        <th>
                            Top
                        </th>
                        <th>
                            Image
                        </th>
                        <th class="text-center">
                            Name
                        </th>
                        <th class="text-center">
                            Price
                        </th>

                        <th class="text-center">
                            CreatedDate
                        </th>
                        <th class="text-center">
                            Số lượng bán trong tháng
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${orderlist}">

                        <tr>
                            <td>
                                ${orderlist.indexOf(item) + 1}
                            </td>
                            <td>
                                <img src="${item.getProductImage()}" style="max-height: 50px;" />
                            </td>
                            <td class="text-center">
                                ${item.getProductName()}
                            </td>
                            <td class="text-center">
                                ${item.getProductPrice()}
                            </td>
                            <td class="text-center">
                                ${item.getCreatedDate()}
                            </td>
                            <td>
                                <center>
                                ${qualityProduct.get(orderlist.indexOf(item))}
                                </center>
                            </td>

                        </tr>

                    </c:forEach>

                </tbody>
            </table>


        </div>

        <script src="/assets/admin/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="/assets/admin/plugins/datatables/dataTables.bootstrap4.min.js"></script>
        <script src="/assets/admin/plugins/datatables/dataTables.responsive.min.js"></script>
        <script src="/assets/admin/plugins/datatables/responsive.bootstrap4.min.js"></script>
        <script>
//                                                $(document).ready(function () {
//                                                @foreach (var item in Model)
//                                                {
//                                                <text>
//        $("#save-@item.OrderID").hide();
//        $.get("@Url.Action("StatusList", "Ordered")",
//        {//
//                                                        "id": "${item.getOrderStatusID()}"
//            },
//            function (data) {//
//                                                        var select = $("#orderstatus-${item.getOrderID()}");
//                                                for (let i = 0; i < data.length; i++) {
//                                                select.append(
//                                                        `<option value="${data[i].StatusID}">${data[i].StatusName}</option>`);
//                                                }
//                            }
//                            );
//                                </text>//
//                                                }
//                                                $(function () {
//                                                $('#order-table').DataTable()
//                                                });
//                                                });
        </script>


        <script src="/assets/sweetalert.min.js"></script>
        <script>

                                                function ChangeOrder(id, status) {
                                                if ($(`#orderstatus-${id}`).val() == status) {
                                                $(`#save-${id}`).hide();
                                                } else {
                                                $(`#save-${id}`).show();
                                                }
                                                }
                                                function SaveEdit(id) {
                                                swal({
                                                title: `EDIT order with id: ${id}?`,
                                                        icon: "warning",
                                                        buttons: true,
                                                        dangerMode: true,
                                                })
                                                        .then((willDelete) => {
                                                        if (willDelete) {
                                                        $.ajax({
                                                        type: "post",
                                                                url: `@Url.Action("EditOrder", "Ordered")`,
                                                                data: {
                                                                "Orderid": id,
                                                                        "StatusID": $(`#orderstatus-${id}`).val()
                                                                },
                                                                success: function (response) {
                                                                if (response.Success == 1) {
                                                                swal("Edited!", "", "success");
                                                                window.location.reload();
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
