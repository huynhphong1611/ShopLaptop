<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title><dec:title/></title>
        <link rel="stylesheet" type="text/css" href="/assets/admin/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="/assets/admin/css/icons.css">
        <link rel="stylesheet" type="text/css" href="/assets/admin/css/menu.css">
        <link rel="stylesheet" type="text/css" href="/assets/admin/css/style.css">
        <script src="/assets/admin/js/jquery-3.2.1.min.js"></script>
        <script src="/assets/admin/js/popper.min.js"></script>
        <script src="/assets/admin/js/bootstrap.min.js"></script>
        <script src="/assets/admin/js/jquery.slimscroll.min.js"></script>
        <script src="/assets/admin/js/slidebars.min.js"></script>
        <script src="/assets/admin/js/jquery.app.js"></script>
    </head>

    <body class="sticky-header">
        <section>
            <%@ include file="/common/admin/leftbar.jsp" %>
            
            <div class="body-content">
                <div class="header-section">
                    <div class="logo">
                    </div>
                    <a class="toggle-btn"><i class="ti ti-menu"></i></a>
                    <div id="navbar-collapse-1" class="navbar-collapse collapse mega-menu">
                        <ul class="nav navbar-nav">
                            <li>
                                <form class="search-content" action="index.html" method="post">
                                    <input type="text" class="form-control mt-3" name="keyword" placeholder="Search...">
                                    <span class="search-button"><i class="ti ti-search"></i></span>
                                </form>
                            </li>
                        </ul>
                    </div>
                    <div class="notification-wrap">
                        <div class="right-notification">
                            <ul class="notification-menu">
                                <li>
                                    <a href="javascript:;" data-toggle="dropdown">
                                        <i class="mdi mdi-account"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right profile-menu">
                                        <a class="dropdown-item" href="#"><i class="mdi mdi-account-circle m-r-5 text-muted"></i> Profile</a>
                                        <a class="dropdown-item" href="#">
                                            <i class="mdi mdi-logout m-r-5 text-muted"></i>
                                            Logout
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <hr />
                <dec:body />
            </div>
        </section>
    </body>
</html>
