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

        <h2>Order List</h2>

        <div class="row">
            <div class="col-sm" id="order-partial">
                <table class="table table-bordered" id="order-table">
                    <thead>
                        <tr>
                            <th>
                                ID
                            </th>
                            <th>
                                Tên KH
                            </th>

                            <th>
                                Địa chỉ
                            </th>
                            <th>
                                Sđt
                            </th>
                            <th>
                                Trạng thái
                            </th>
                            <th>
                                Ngày đặt
                            </th>
                            <th>
                                Tổng
                            </th>
                            <th>Options</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${orderlist}">
                            <tr>
                                <td>
                                    ${item.getOrderID()}
                                </td>
                                <td>
                                    ${item.getCustomerName()}
                                </td>

                                <td>
                                    ${item.getCustomerAddress()}
                                </td>
                                <td>
                                    ${item.getCustomerPhone()}
                                </td>
                                <td>
    <!--                                <select id="orderstatus-${item.getOrderID()}" onchange="return ChangeOrder('${item.getOrderID()}', '${item.getOrderStatusID()}')">
                                        <option value="${item.getOrderStatusID()}" selected="selected">@${item.getOrderStatusID()}</option>
                                        
                                    </select>-->
                                    <b>${item.getStatusName()}</b>
                                </td>
                                <td>
                                    ${item.getOrderDate()}
                                </td>
                                <td>

                        <fmt:formatNumber type = "number" 
                                          maxFractionDigits = "3" 
                                          value = "${item.getTotal()}" />₫
                        </td>
                        <td>
<!--                            <button class="btn btn-sm btn-success"
                                    type="submit" value="Save"
                                    id="save-${item.getOrderID()}"
                                    onclick="return SaveEdit('${item.getOrderID()}')">
                                <i class="mdi mdi-check"></i>
                            </button>-->
                            <button class="btn btn-sm btn-info" onclick="window.location.href='/admin/orderdetail/${item.getOrderID()}'">
                                <i class="mdi mdi-format-list-bulleted"></i>
                            </button>
                        </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
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
