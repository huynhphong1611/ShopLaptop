<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
    <div class="header-area transparent-bar ptb-55">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-4">
                    <div class="logo-small-device">
                        <a href="<c:url value="/" />"><img alt="logo" src="<c:url value='/assets/client/img/logo/logo-1.png'/>"></a>
                    </div>
                </div>
                <div class="col-lg-8 col-md-8 col-8">
                    <div class="header-contact-menu-wrapper pl-45">
                        <div class="header-contact">
                            <p style="font-size:20px;"> <b>Liên hệ với chúng tôi 036 1456 083</b></p>
                        </div>
                        <div class="menu-wrapper text-center">
                            <button class="menu-toggle">
                                <img class="s-open" alt="menu" src="<c:url value='/assets/client/img/icon-img/menu.png'/>">
                                <img class="s-close" alt="menu-close" src="<c:url value='/assets/client/img/icon-img/menu-close.png'/>">
                            </button>
                            <div class="main-menu">
                                <nav>
                                    <ul>
                                        <li><a href="<c:url value="/" />">home</a></li>
                                        <li>
                                            <a href="<c:url value="/shop" />">sản phẩm</a>
                                            <ul class="dropdown partial-content">
                                                <%@ include file="/common/client/partialview/navbrand.jsp" %>
                                            </ul>
                                        </li>
                                        <li class="active">
                                            <a href="<c:url value="/about" />">về tôi</a>
                                        </li>
                                        <li>
                                            <a href="<c:url value="/contact" />">liên hệ</a>
                                        </li>
                                        <li>
                                            <a href="<c:url value="/cart" />">giỏ hàng</a>
                                        </li>
                                        <c:choose>
                                            <c:when test="${empty sessionScope.customerLogin}">
                                                <li>
                                                    <a href="<c:url value="/login" />">đăng nhập</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li>
                                                    <a href="javascript:void(0);">
                                                        ${sessionScope.customerLogin.getCustomerName()}
                                                    </a>
                                                    <ul class="dropdown">
                                                        <li>
                                                            <a href="<c:url value="/profile" />">
                                                                thông tin tài khoản
                                                            </a>
                                                        </li>
                                                        <li><a href="<c:url value="/logout" />">đăng xuất</a></li>
                                                    </ul>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="header-cart cart-small-device cart-partial">
                        <%@ include file="/common/client/partialview/cart.jsp" %>
                    </div>
                </div>
                <!--Mobile-->
                <div class="mobile-menu-area col-12">
                    <div class="mobile-menu">
                        <nav id="mobile-menu-active">
                            <ul class="menu-overflow">
                                <li><a href="<c:url value="/" />">home</a></li>
                                <li>
                                    <a href="<c:url value="/shop" />">sản phẩm</a>
                                    <ul class="dropdown partial-content">
                                        <%@ include file="/common/client/partialview/navbrand.jsp" %>
                                    </ul>
                                </li>
                                <li class="active">
                                    <a href="<c:url value="/about" />">về tôi</a>
                                </li>
                                <li><a href="<c:url value="/contact" />">liên hệ</a></li>
                                <li>
                                    <a href="<c:url value="/cart" />">giỏ hàng</a>
                                </li>
                                <c:choose>
                                    <c:when test="${empty sessionScope.customerLogin}">
                                        <li>
                                            <a href="<c:url value="/login" />">đăng nhập</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li>
                                            <a href="javascript:void(0);">
                                                Xin chào ${sessionScope.customerLogin.getCustomerName()}
                                            </a>
                                            <ul class="dropdown">
                                                <li>
                                                    <a href="<c:url value="/profile" />">
                                                        thông tin tài khoản
                                                    </a>
                                                </li>
                                                <li><a href="<c:url value="/logout" />">đăng xuất</a></li>
                                            </ul>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-cart-wrapper">
            <div class="header-cart cart-partial">
                <%@ include file="/common/client/partialview/cart.jsp" %>
            </div>
        </div>
    </div>
</header>