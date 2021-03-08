<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
    </head>
    <body>
        <link href="<c:url value="assets/client/loading-spinner.css"/>" rel="stylesheet" />

        <div class="breadcrumb-area pt-255 pb-170" style="background-image: url(https://www.klaviyo.com/wp-content/uploads/2016/09/abstract-background-1024x273.jpg)">
            <div class="container-fluid">
                <div class="breadcrumb-content text-center">
                    <h2>Đăng Nhập</h2>
                    <ul>
                        <li>
                            <a href="<c:url value="/"/>">home</a>
                        </li>
                        <li>Đăng nhập</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="login-register-area ptb-130">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 ml-auto mr-auto">
                        <div class="login-register-wrapper">
                            <div class="login-register-tab-list nav">
                                <a class="active" data-toggle="tab" href="#lg1">
                                    <h4> Đăng Nhập </h4>
                                </a>
                                <a data-toggle="tab" href="#lg2">
                                    <h4> Tạo Tài Khoản </h4>
                                </a>
                            </div>
                            <div class="tab-content">
                                <!--Login-->
                                <div id="lg1" class="tab-pane active">
                                    <div class="login-form-container">
                                        <div class="login-form">
                                            <form action="#" method="post" id="login-form">
                                                <input type="text" id="log-name" name="log-name" placeholder="Username">
                                                <input type="password" id="log-password" name="log-password" placeholder="Password">
                                                <div class="button-box">
                                                    <h5 class="text-danger info-login-text text-center"></h5>
                                                    <div class="login-toggle-btn">
                                                        <input id="remember-me-box" type="checkbox">
                                                        <label>Ghi nhớ</label>
                                                        <a href="javascript:void(0)">Quên Mật Khẩu ?</a>
                                                    </div>
                                                    <button type="submit" class="btn-style cr-btn" id="login-btn">
                                                        <div class="loader" id="login-loader" style="max-height: 50px;">
                                                            <svg class="circular">
                                                            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="5" stroke-miterlimit="10"></circle>
                                                            </svg>
                                                        </div>
                                                        <span id="login-button-text">Đăng Nhập</span>
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!--Register-->
                                <div id="lg2" class="tab-pane">
                                    <div class="login-form-container">
                                        <div class="login-form">
                                            <form action="#" method="post" id="register-form">
                                                <input type="text" id="reg-name" name="reg-name" placeholder="Username*">
                                                <input type="password" id="reg-password" name="reg-password" placeholder="Password*">
                                                <input type="password" name="confirm-password" placeholder="Xác nhận mật khẩu*">
                                                <input type="text" id="reg-fullname" name="reg-fullname" placeholder="Họ tên*">
                                                <input type="text" id="reg-email" name="reg-email" placeholder="Email">
                                                <input type="tel" id="reg-phone" name="reg-phone" placeholder="Số điện thoại">
                                                <input type="text" id="reg-address" name="reg-address" placeholder="Địa chỉ">
                                                <div class="button-box">
                                                    <h5 class="text-danger info-register-text text-center"></h5>
                                                    <button type="submit" class="btn-style cr-btn" id="signup-btn">
                                                        <div class="loader" id="reg-loader" style="max-height: 50px;">
                                                            <svg class="circular">
                                                            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="5" stroke-miterlimit="10"></circle>
                                                            </svg>
                                                        </div>
                                                        <span id="reg-button-text">Tạo Tài Khoản</span>
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="<c:url value="assets/jquery.validate.min.js"/>"></script>
        <script>
            $(document).ready(function () {
                $("#login-loader").hide();
                $("#reg-loader").hide();

                $("#login-form").validate({
                    rules: {
                        'log-name': "required",
                        'log-password': {
                            required: true,
                            minlength: 6
                        }
                    },
                    messages: {
                        'log-name': "Nhập Username",
                        'log-password': {
                            required: "Nhập Password",
                            minlength: "Password tối thiểu 6 kí tự"
                        },
                    },
                    submitHandler: function () {
                        event.preventDefault();
                        $("#login-btn").attr("disabled", true);
                        $("#login-loader").show();
                        $("#login-button-text").hide();
                        var data = {
                            "CustomerUsername": $("#log-name").val(),
                            "CustomerPassword": $("#log-password").val(),
                            "RememberMe": $("#remember-me-box").prop('checked')
                        };
                        $.ajax({
                            url: "<c:url value="/customer/vaidate"/>",
                            type: "get",
                            data: {
                                CustomerUsername: $("#log-name").val(),
                                CustomerPassword: $("#log-password").val()
                            },
                            dataType: "json",
                            contentType: "application/json",
                            success: function (response) {
                                console.log(response);
                                if (response.Status) {
                                    $("#login-button-text").text("Login Success");
                                    window.location.href = "/profile";
                                } else
                                    $("#login-button-text").text("Login Fail");
                            },
                            error: function (response) {
                                $("#login-button-text").text("Error while logging in!");
                            },
                            complete: function (jqXHR, textStatus) {
                                $("#login-loader").hide();
                                $("#login-button-text").show();
                                $("#login-btn").attr("disabled", false);
                            }
                        });
                    }
                });
                //--register form
                $("#register-form").validate({
                    rules: {
                        'reg-name': "required",
                        'reg-password': {
                            required: true,
                            minlength: 6
                        },
                        'confirm-password': {
                            minlength: 6,
                            equalTo: "#reg-password"
                        },
                        'reg-fullname': "required",
                        'reg-email': {
                            email: true
                        }
                    },
                    messages: {
                        'reg-name': "Please enter your username",
                        'reg-password': {
                            required: "Please enter your password",
                            minlength: "Your password must be at least 6 characters long"
                        },
                        'confirm-password': {
                            minlength: "Your password must be at least 6 characters long",
                            equalTo: "Your password does not match"
                        },
                        'reg-fullname': "Please enter your name",
                        'reg-email': {
                            email: "Not correct email format"
                        }
                    },
                    submitHandler: function () {
                        $("#signup-btn").attr("disabled", true);
                        $("#reg-loader").show();
                        $("#reg-button-text").hide();
                        var data = {
                            "CustomerUsername": $("#reg-name").val(),
                            "CustomerPassword": $("#reg-password").val(),
                            "CustomerName": $("#reg-fullname").val(),
                            "CustomerPhone": $("#reg-phone").val(),
                            "CustomerEmail": $("#reg-email").val(),
                            "CustomerAddress": $("#reg-address").val()
                        };
                        $.ajax({
                            url: "<c:url value="/customer/signup"/>",
                            type: "get",
                            data: data,
                            dataType: "json",
                            contentType: "application/json",
                            success: function (response) {
                                console.log(response);
                                $("#reg-button-text").text(response.Message);
                            },
                            error: function (response) {
                                $("#reg-button-text").text("Error while register your account!");
                            },
                            complete: function (jqXHR, textStatus) {
                                $("#reg-loader").hide();
                                $("#reg-button-text").show();
                                $("#signup-btn").attr("disabled", false);
                            }
                        });
                    }
                });
            });
        </script>
    </body>
</html>
