
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/admin/plugins/datatables/dataTables.bootstrap4.min.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/admin/plugins/datatables/buttons.bootstrap4.min.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/admin/plugins/datatables/responsive.bootstrap4.min.css'/>">


        <link href="/assets/client/loading-spinner.css" rel="stylesheet" />

        <div class="card-body">
            <h1 class="header-title">Product List</h1>
            <p class="text-muted">
                <a href="/admin/product/selectbrand" style="color: blue;">Create New</a>
            </p>

            <table class="table table-bordered" id="product-table">
                <thead>
                    <tr>
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
                            Option
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${product}">

                        <tr>
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

                            <td class="text-center">

                                <button class="btn btn-sm btn-primary"
                                        type="submit" value="Edit"
                                        id="edit-${item.getProductID()}"
                                        onclick="return EditItem('${item.getProductID()}')">
                                    <i class="mdi mdi-border-color"></i>
                                </button>
                                <button class="btn btn-sm btn-danger"
                                        type="submit" value="Delete"
                                        id="delete-${item.getProductID()}"
                                        onclick="return DeleteItem('${item.getProductID()}')">
                                    <i class="mdi mdi-delete"></i>
                                </button>
                            </td>

                        </tr>

                    </c:forEach>

                </tbody>
            </table>


        </div>

        <script src="/assets/sweetalert.min.js"></script>
        <script src="/assets/admin/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="/assets/admin/plugins/datatables/dataTables.bootstrap4.min.js"></script>
        <script src="/assets/admin/plugins/datatables/dataTables.responsive.min.js"></script>
        <script src="/assets/admin/plugins/datatables/responsive.bootstrap4.min.js"></script>
        <script>
                                            $(document).ready(function () {
                                                $(function () {
                                                    $('#product-table').DataTable();
                                                });
                                            });

                                            function DeleteItem(id) {
                                                swal({
                                                    title: "DELETE item with id: " + id + "?",
                                                    icon: "warning",
                                                    buttons: true,
                                                    dangerMode: true,
                                                })
                                                        .then((willDelete) => {
                                                            if (willDelete) {
                                                                $.ajax({
                                                                    type: "get",
                                                                    url: "/admin/product/submitdelete",
                                                                    data: {'id': id},
                                                                    dataType: "json",
                                                                    contentType: "application/json",
                                                                    success: function (data) {
                                                                        console.log(data);
                                                                        if (data.Status) {
                                                                            swal("Delete success!", "", "success")
                                                                                    .then((value) => {
                                                                                        location.reload();
                                                                                    });
                                                                        } else {
                                                                            swal("Delete fail!", "", "error");
                                                                        }

                                                                    },
                                                                    error: function (data) {
                                                                        console.log(data);
                                                                        swal("Error deleting item!", "", "error");
                                                                    }
                                                                });
                                                            }
                                                        });
                                            }
                                            ;
                                            function EditItem(id) {
                                                window.location.href = `/admin/editproduct/` + id;
                                            }
                                            ;
        </script>
    </body>

</html>
