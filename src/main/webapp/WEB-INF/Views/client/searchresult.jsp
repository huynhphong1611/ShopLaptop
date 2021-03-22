<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản phẩm</title>
    </head>
    <body>
        <style type="text/css">
            a.disabled {
                pointer-events: none;
                cursor: default;
            }
        </style>
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/client/loading-spinner.css'/>">

        <c:set value="${productlist}" var="productPageList" />
        <div class="breadcrumb-area pt-255 pb-170" style="background-image: url(https://shophangngoai.vn/wp-content/uploads/2018/11/Tu-van-chon-mua-laptop-xach-tay-shop-cu-theo-khoang-gia1.jpg)">
            <div class="container-fluid">
                <div class="breadcrumb-content text-center">
                    <h2>cửa hàng</h2>
                    <ul>
                        <li>
                            <a href="<c:url value="/"/>">home</a>
                        </li>
                        <li>cửa hàng</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="shop-wrapper fluid-padding-2 pt-120 pb-150">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="product-sidebar-area pr-60">
                            <div class="sidebar-widget pb-55">
                                <h3 class="sidebar-widget">Tìm kiếm</h3>
                                <div class="sidebar-search">
                                    <form action="searchresult" method="get">
                                        <input class="search-box" type="text" placeholder="Tìm kiếm..." name="search" id="search-product">
                                        <button type="submit"><i class="ti-search"></i></button>
                                    </form>
                                </div>
                            </div>
                            <div class="sidebar-widget pb-50">
                                <h3 class="sidebar-widget">Lọc theo hãng</h3>
                                <div class="widget-categories">
                                    <ul id="category-content">
                                        <li><a href="#">Tất cả</a></li>
                                            <%@ include file="/common/client/partialview/navbrand.jsp" %>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="shop-topbar-wrapper">
                            <div class="grid-list-options">
                                <ul class="view-mode">
                                    <li class="active"><a href="#product-grid" data-view="product-grid"><i class="ti-layout-grid2"></i></a></li>
                                    <li><a href="#product-list" data-view="product-list"><i class="ti-view-list"></i></a></li>
                                </ul>
                            </div>
                            <div class="product-sorting">
                                <div class="sorting sorting-bg-1">
                                    <form>
                                        <select class="select" id="sort-filter">
                                            <option value="default">Mặc định </option>
                                            <option value="name_asc">Tên A -> Z</option>
                                            <option value="name_desc">Tên Z -> A</option>
                                            <option value="price_asc">Giá thấp nhất</option>
                                            <option value="price_desc">Giá cao nhất</option>
                                        </select>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="grid-list-product-wrapper tab-content">
                            <div class="product-grid product-view tab-pane active">
                                <div class="row" id="product-content">
                                    <c:forEach items="${productPageList.pageList}" var="item">
                                        <div class="product-width col-md-4 col-xl-3 col-lg-4">
                                            <div class="product-wrapper mb-35">
                                                <div class="product-img">
                                                    <a href="<c:url value="/product/${item.getProductURL()}/${item.getProductID()}"/>">
                                                        <img src="${item.getProductImage()}" alt="${item.getProductName()}">
                                                    </a>
                                                    <div class="product-action">
                                                        <a class="action-plus-2 p-action-none addtocart" title="Thêm vào giỏ hàng"
                                                           href="javascript:void(0);" data-value="${item.getProductID()}">
                                                            <i class="ti-shopping-cart"></i>
                                                        </a>
                                                    </div>
                                                    <div class="product-content-wrapper">
                                                        <div class="product-title-spreed">
                                                            <h4>
                                                                <a href="<c:url value="/product/${item.getProductURL()}/${item.getProductID()}"/>">
                                                                    ${item.getProductName()}
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div class="product-price">
                                                            <c:choose>
                                                                <c:when test="${empty item.getPromotionPrice()}">
                                                                    <span>
                                                                        <fmt:formatNumber type = "number" 
                                                                                          maxFractionDigits = "3" 
                                                                                          value = "${item.getProductPrice()}" />₫
                                                                    </span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span>
                                                                        <fmt:formatNumber type = "number" 
                                                                                          maxFractionDigits = "3" 
                                                                                          value = "${item.getPromotionPrice()}" />₫
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product-list-details">
                                                    <h2>
                                                        <a href="<c:url value="/product/${item.getProductURL()}/${item.getProductID()}"/>">
                                                            ${item.getProductName()}
                                                        </a>
                                                    </h2>
                                                    <div class="quick-view-rating">
                                                        <i class="fa fa-star reting-color"></i>
                                                        <i class="fa fa-star reting-color"></i>
                                                        <i class="fa fa-star reting-color"></i>
                                                        <i class="fa fa-star reting-color"></i>
                                                        <i class="fa fa-star reting-color"></i>
                                                    </div>
                                                    <div class="product-price">
                                                        <c:choose>
                                                            <c:when test="${empty item.getPromotionPrice()}">
                                                                <span>
                                                                    <fmt:formatNumber type = "number" 
                                                                                      maxFractionDigits = "3" 
                                                                                      value = "${item.getProductPrice()}" />₫
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span>
                                                                    <fmt:formatNumber type = "number" 
                                                                                      maxFractionDigits = "3" 
                                                                                      value = "${item.getPromotionPrice()}" />₫
                                                                </span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <p>${item.getProductDescription()}</p>
                                                    <div class="shop-list-cart">
                                                        <a class="addtocart" href="javascript:void(0);" data-value="${item.getProductID()}"><i class="ti-shopping-cart"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!--Pagin Btn-->
                        <div class="paginations text-center mt-20">
                            <ul>
                                <c:forEach begin="1" end="${productPageList.pageCount}" step="1"  varStatus="tagStatus">
                                    <c:choose>
                                        <c:when test="${(productPageList.page + 1) == tagStatus.index}">
                                            <li ><a class="disabled" href="#">${tagStatus.index}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <c:url value="/shop/${tagStatus.index}" var="url" />                  
                                            <li>
                                                <a href='<c:out value="${url}" />'>${tagStatus.index}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="<c:url value="/assets/client/js/jquery-ui.js"/>"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".addtocart").each(function () {
                    $(this).click(function (event) {
                        event.preventDefault();
                        var prodid = $(this).data("value");
                        $.ajax({
                            url: "<c:url value="/cart/addtocart" />",
                            type: "get",
                            data: {
                                prodid: prodid,
                                quantity: "1"
                            },
                            dataType: "json",
                            contentType: "application/json",
                            success: function (data) {
                                if (data.Status == true) {
                                    swal("Success", "Add to cart success!", "success")
                                            .then((value) => {
                                                location.reload();
                                            });
                                } else if (data.Status == false) {
                                    swal("Failed", data.Message, "error");
                                }
                            },
                            error: function (response) {
                                swal("Failed", "Add to cart failed!", "error");
                            }
                        });
                    })
                });
            });
        </script>

    </body>
</html>
