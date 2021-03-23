<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Trang Chủ</title>

    </head>
    <body>
        <div class="blog-area pt-150 pb-110">
            <div class="container">
                <div class="sidebar-search" style="padding-bottom: 20px">
                    <h3 class="sidebar-widget" style="text-align: center; font-size: 30px">Tìm kiếm</h3>
                    <form action="shop/searchresult" method="get">
                        <input class="search-box" type="text" placeholder="Tìm kiếm..." name="search" id="search-product">
                        <button type="submit"><i class="ti-search"></i></button>
                    </form>
                </div>
                <div class="section-title text-center mb-60">
                    <h2 style="font-size:70px;">Được Xem Nhiều</h2>
                </div>
                <div class="row" id="top-view-product">
                    <c:forEach items="${viewcount}" var="item">
                        <div class="col-lg-3 col-md-6">
                            <div class="blog-hm-wrapper mb-40">
                                <div class="blog-img">
                                    <a href="<c:url value="/product/${item.getProductURL()}/${item.getProductID()}"/>">
                                        <img src="${item.getProductImage()}" width="480" height="320" alt="${item.getProductName()}">
                                    </a>
                                </div>
                                <div class="blog-hm-content">
                                    <h3>
                                        <a href="<c:url value="/product/${item.getProductURL()}/${item.getProductID()}"/>">
                                            ${item.getProductName()}
                                        </a>
                                    </h3>
                                    <p>
                                        <span>
                                            <fmt:formatNumber type = "number" 
                                                              maxFractionDigits = "3" 
                                                              value = "${item.getProductPrice()}" />₫
                                        </span> 
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="blog-area pt-150 pb-110">
            <div class="container">
                <div class="section-title text-center mb-60">
                    <h2 style="font-size:70px;">Sản phẩm mới nhất</h2>
                </div>
                <div class="row" id="newest-product">
                    <c:forEach items="${lastest}" var="item">
                        <div class="col-lg-3 col-md-6">
                            <div class="blog-hm-wrapper mb-40">
                                <div class="blog-img">
                                    <a href="<c:url value="/product/${item.getProductURL()}/${item.getProductID()}"/>">
                                        <img src="${item.getProductImage()}" width="480" height="320" alt="${item.getProductName()}">
                                    </a>
                                </div>
                                <div class="blog-hm-content">
                                    <h3>
                                        <a href="<c:url value="/product/${item.getProductURL()}/${item.getProductID()}"/>">
                                            ${item.getProductName()}
                                        </a>
                                    </h3>
                                    <p>
                                        <span>
                                            <fmt:formatNumber type = "number" 
                                                              maxFractionDigits = "3" 
                                                              value = "${item.getProductPrice()}" />₫
                                        </span> 
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="overview-area pt-135">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-12" >
                        <img class="tilter" src="<c:url value="http://quality-egypt.com/image/cache/catalog/Q121_03_%20Omen%20X%202S%20artwork%20-%201920%20x%20682%20px-1920x682.jpg" />" 
                             style="width: 1200px" alt="">
                        <div class="overview-img">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

