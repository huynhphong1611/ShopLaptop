<%-- 
    Document   : editproduct
    Created on : Nov 10, 2020, 10:23:59 AM
    Author     : FR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <link rel='stylesheet' href='/assets/materialize.min.css'>
        <h2>
            ${product.getProductName()} Details
        </h2>

        <form action="#" method="post" id="update-product-form">
            <div class="row">
                <div class="input-field col-lg-2 s12">
                    <label>ID</label>
                </div>
                <div class="input-field col s12">
                    <input readonly value="${product.getProductID()}">
                </div>
            </div>

            <div class="row">
                <div class="input-field col-lg-2 s12">
                    <label>Brand</label>
                </div>
                <div class="input-field col s12">
                    <input readonly value="${product.getBrandID()}">
                </div>
            </div>

            <div class="row">
                <div class="input-field col-lg-2 s12">
                    <label>Name</label>
                </div>
                <div class="input-field col s12">
                    <input id="product-name" name="product-name" type="text" class="validate" value="${product.getProductName()}">
                </div>
            </div>

            <div class="row">
                <div class="input-field col-lg-2 s12">
                    <label>URL</label>
                </div>
                <div class="input-field col s12">
                    <input id="product-url" type="text" readonly value="${product.getProductURL()}">
                </div>
            </div>

            <div class="row">
                <div class="input-field col-lg-2 s12">
                    <label>Price</label>
                </div>
                <div class="input-field col s12">
                    <input id="product-price" name="product-price" type="number" class="validate" value="${product.getProductPrice()}">
                </div>
            </div>
            <div class="row">
                <div class="input-field col-lg-2 s12">
                    <label>Promotion Price</label>
                </div>
                <div class="input-field col s12">
                    <input id="product-promotion" name="product-promotion" type="number" class="validate" value="${product.getPromotionPrice()}">
                </div>
            </div>
            <div class="row">
                <div class="input-field col-lg-2 s12">
                    <label>Stock</label>
                </div>
                <div class="input-field col s12">
                    <input id="product-stock" name="product-stock" type="number" class="validate" value="${product.getProductStock()}">
                </div>
            </div>
            <div class="row">
                <div class="input-field col-lg-2 s12">
                    <label>Show Image 1</label>
                </div>
                <div class="input-field col s12">
                    <input id="product-image" type="text" class="validate" value="${product.getProductImage()}">
                </div>
            </div>
            <div class="row">
                <div class="input-field col-lg-2 s12">
                    <label>Status</label>
                </div>
                <div class="input-field col s12">
                    <input id="status-checkbox" type="checkbox" checked="checked" />
                    <label for="status-checkbox" id="checkbox-label">Active</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col-lg-2 s12">
                    <label>Decription</label>
                </div>
                <div class="input-field col s12">
                    <textarea placeholder="Decription" id="text-area" name="area" value="${product.getProductDescription()}"></textarea>
                </div>
            </div>

            <button class="btn waves-effect waves-light" type="submit" name="action">
                <span>Save changes </span><i class="mdi mdi-send"></i>
            </button>
        </form>

        <script src='/assets/materialize.min.js'></script>
        <script src="/assets/sweetalert.min.js"></script>
        <script src="/assets/jquery.validate.min.js"></script>
        <script>
            $(document).ready(function () {
                $('select').material_select();
                $("#status-checkbox").click(function () {
                    if ($(this).is(":checked")) {
                        $("#checkbox-label").text("Active");
                    } else {
                        $("#checkbox-label").text("Inactive");
                    }
                    ;
                });
                $("#product-name").on('input', function (e) {
                    $("#product-url").val(slugify($("#product-name").val()));
                });
                function slugify(text) {
                    return text.toString().toLowerCase()
                            .replace(/\s+/g, '-')           // Replace spaces with -
                            .replace(/[^\w\-]+/g, '')       // Remove all non-word chars
                            .replace(/\-\-+/g, '-')         // Replace multiple - with single -
                            .replace(/^-+/, '')             // Trim - from start of text
                            .replace(/-+$/, '');            // Trim - from end of text
                }
                $("#update-product-form").validate({
                    rules: {
                        'product-name': "required",
                        'product-price': {
                            required: true
                        },
                        'product-stock': {
                            digits: true
                        }
                    },
                    messages: {
                        'product-name': "Please enter product name",
                        'product-price': {
                            required: "Please enter product price"
                        },
                        'product-stock': "Not a correct format"
                    },
                    submitHandler: function () {
                        let data = {
                            "ProductID": "${product.getProductID()}",
                            "ProductName": $("#product-name").val(),
                            "ProductPrice": $("#product-price").val(),
                            "PromotionPrice": $("#product-promotion").val(),
                            "ProductStock": $("#product-stock").val(),
                            "BrandID": "${product.getBrandID()}",
                            "ProductImage": $("#product-image").val(),
                            "ProductDescription": $("#text-area").val(),
                            "ProductStatus": $("#status-checkbox").is(":checked")
                        };
                        $.ajax({
                            url: "/admin/product/submitedit",
                            type: "get",
                            data: data,
                            dataType: "json",
                            contentType: "application/json",
                            success: function (response) {
                                console.log(response);
                                if (response.Status) {
                                    swal("Update successfuly", "", "success")
                                            .then((value) => {
                                                location.href = '/admin/productlist';
                                            });
                                } else
                                    swal("Update fail!", "", "success");
                            },
                            error: function (error) {
                                swal("Error updating product!", "", "success");
                            }
                        });
                    }
                });
            });
        </script>
    </body>
</html>
