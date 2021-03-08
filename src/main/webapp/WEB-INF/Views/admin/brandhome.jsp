<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Brand</title>
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/client/loading-spinner.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/admin/plugins/datatables/dataTables.bootstrap4.min.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/admin/plugins/datatables/buttons.bootstrap4.min.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/admin/plugins/datatables/responsive.bootstrap4.min.css'/>">
        <h2>Create Brand</h2>

        <div class="row">
            <div class="col-lg-3">
                <form action="#" id="brand-submit-form" method="post" novalidate="novalidate"><div class="form-horizontal">
                        <hr />
                        <div class="form-group">
                            <label class="control-label col-md-6">Brand Name</label>
                            <div class="col-md-10">
                                <input class="form-control text-box single-line" type="text" name="brand-input" id="brand-input">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-6">Brand URL</label>
                            <div class="col-md-10">
                                <h5 id="brand-url">(name)</h5>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <input type="submit" value="Create" class="btn btn-primary" id="create-btn"/>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-sm" id="brand-partial">
                <div class="card-body">
                    <table class="table table-bordered" id="category-table">
                        <thead>
                            <tr>
                                <th class="text-center">
                                    ID
                                </th>
                                <th style="display:none;"></th>
                                <th class="text-center">
                                    Name
                                </th>
                                <th class="text-center">
                                    Brand URL
                                </th>
                                <th class="text-center">
                                    Created Date
                                </th>
                                <th class="text-center">Options</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${brandlist}">
                                <tr id="row-${item.getBrandID()}">
                                    <td class="text-center">${item.getBrandID()}</td>
                                    <td class="text-center brand-input" id="brand-${item.getBrandID()}-input">
                                        <input class="text-center form-control" id="brand-${item.getBrandID()}"
                                               value="${item.getBrandName()}"
                                               readonly />
                                    </td>
                                    <td class="text-center" id="brand-${item.getBrandID()}-text">
                                        ${item.getBrandName()}
                                    </td>
                                    <td class="text-center">
                                        ${item.getBrandUrl()}
                                    </td>                                                                    
                                    <td class="text-center">
                                        ${item.getCreatedDate()}
                                    </td>
                                    <td class="text-center">
                                        <button class="btn btn-sm btn-primary"
                                                type="submit" value="Edit"
                                                id="edit-${item.getBrandID()}"
                                                onclick="return EditItem('${item.getBrandID()}')">
                                            <i class="mdi mdi-border-color"></i>
                                        </button>
                                        <button class="btn btn-sm btn-danger"
                                                type="submit" value="Delete"
                                                id="delete-${item.getBrandID()}"
                                                onclick="return DeleteItem('${item.getBrandID()}')">
                                            <i class="mdi mdi-delete"></i>
                                        </button>
                                        <button class="btn btn-sm btn-success save-btn"
                                                type="submit" value="Save"
                                                id="save-${item.getBrandID()}"
                                                onclick="return SaveEdit('${item.getBrandID()}')">
                                            <i class="mdi mdi-check"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="<c:url value='/assets/sweetalert.min.js'/>"></script>
        <script src="<c:url value="/assets/jquery.validate.min.js"/>"></script>
        <script src="<c:url value="/assets/admin/plugins/datatables/jquery.dataTables.min.js"/>"></script>
        <script src="<c:url value="/assets/admin/plugins/datatables/dataTables.bootstrap4.min.js"/>"></script>
        <script src="<c:url value="/assets/admin/plugins/datatables/dataTables.responsive.min.js"/>"></script>
        <script src="<c:url value="/assets/admin/plugins/datatables/responsive.bootstrap4.min.js"/>"></script>
        <script type="text/javascript">
                                                    function slugify(text) {
                                                        return text.toString().toLowerCase()
                                                                .replace(/\s+/g, '-')           // Replace spaces with -
                                                                .replace(/[^\w\-]+/g, '')       // Remove all non-word chars
                                                                .replace(/\-\-+/g, '-')         // Replace multiple - with single -
                                                                .replace(/^-+/, '')             // Trim - from start of text
                                                                .replace(/-+$/, '');            // Trim - from end of text
                                                    }

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
                                                                            url: "/admin/brand/submitdelete",
                                                                            data: {'id': id},
                                                                            dataType: "json",
                                                                            contentType: "application/json",
                                                                            success: function (data) {
                                                                                console.log(data);
                                                                                if (data.Status == true) {
                                                                                    swal("Delete success!", "", "success")
                                                                                    window.location.reload();
                                                                                } else {
                                                                                    swal("Delete fail!", "", "error");
                                                                                }
                                                                            },
                                                                            error: function (error) {
                                                                                swal("Error deleting item!", "", "error");
                                                                            }
                                                                        });
                                                                    }
                                                                });
                                                    }
                                                    ;

                                                    function SaveEdit(id) {
                                                        swal({
                                                            title: "EDIT item with id:" + id + "?",
                                                            icon: "warning",
                                                            buttons: true,
                                                            dangerMode: true,
                                                        })
                                                                .then((willDelete) => {
                                                                    if (willDelete) {
                                                                        $.ajax({
                                                                            type: "get",
                                                                            url: `/admin/brand/submitedit`,
                                                                            data: {
                                                                                "id": id,
                                                                                "BrandName": $("#brand-" + id).val()
                                                                            },
                                                                            dataType: "json",
                                                                            contentType: "application/json",
                                                                            success: function (data) {
                                                                                if (data.Status == true) {
                                                                                    swal("Edit success", "", "success")
                                                                                            .then((value) => {
                                                                                                location.reload();
                                                                                            });
                                                                                } else if (data.Status == false) {
                                                                                    swal("Edit fail", data.Message, "error");
                                                                                }
                                                                            },
                                                                            error: function (error) {
                                                                                swal("Fail editing item", "", "error");
                                                                            }
                                                                        });
                                                                    }
                                                                });
                                                    }
                                                    ;

                                                    function EditItem(id) {
                                                        $("#edit-" + id).toggleClass('active');

                                                        if ($("#edit-" + id).hasClass('active')) {
                                                            $("#delete-" + id).hide();
                                                            $("#save-" + id).show();

                                                            $("#brand-" + id + "-input").show();
                                                            $("#brand-" + id + "-text").hide();

                                                            $("#brand-" + id).removeAttr('readonly');

                                                        } else {
                                                            $("#delete-" + id).show();
                                                            $("#save-" + id).hide();

                                                            $("#brand-" + id + "-input").hide();
                                                            $("#brand-" + id + "-text").show();

                                                            $("#brand-" + id).prop('readonly', 'true');
                                                        }
                                                        ;
                                                    }
                                                    ;

        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".brand-input").each(function () {
                    $(this).hide();
                });
                $(".save-btn").each(function () {
                    $(this).hide();
                });

                $('#category-table').DataTable();

                $("input[name=brand-input]").on('input', function (e) {
                    $("#brand-url").text(slugify($("input[name=brand-input]").val()));
                });

                $("#brand-submit-form").validate({
                    rules: {
                        'brand-input': "required"
                    },
                    messages: {
                        'brand-input': "Please enter brand name!"
                    },
                    submitHandler: function () {
                        $("#create-btn").prop("disabled", true);

                        $.ajax({
                            url: "<c:url value="/admin/brand/submitcreate" />",
                            type: "get",
                            contentType: "application/json",
                            dataType: "json",
                            data: {
                                "BrandName": $("#brand-input").val()
                            },
                            success: function (data) {
                                swal("Add success!", "", "success")
                                        .then((value) => {
                                            location.reload();
                                        });
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                swal({
                                    title: "Error ",
                                    icon: "warning"
                                });
                            }, complete: function (jqXHR, textStatus) {
                                $("#create-btn").prop("disabled", false);
                            }
                        });
                    }
                });
            });
        </script>
    </body>
</html>

