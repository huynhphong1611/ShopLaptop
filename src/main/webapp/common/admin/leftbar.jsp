<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="sidebar-left position-fixed">
    <div class="sidebar-left-info">
        <div class="user-box">
            <div class="text-center text-white mt-2">
                <h6>LTNC Shop</h6>
                <p class="text-muted m-0">Admin</p>
            </div>
        </div>
        <ul class="side-navigation">
            <li>
                <h3 class="navigation-title">Home</h3>
            </li>
            <li class="active">
                <a href="/admin/home" title="Home"><i class="mdi mdi-gauge"></i> <span>Home</span></a>
            </li>
            <li>
                <h3 class="navigation-title">Management</h3>
            </li>
            <li class="">
                <a href="/admin/brand" title="Brand"><i class="mdi mdi-gauge"></i> <span>Brand</span></a>
            </li>
            <li class="">
                <ul class="child-list">
                    <li>
                        <a href="/admin/brand/branddata" title="Add new">
                            <i class="mdi mdi-tag"></i>
                            <span> Brand</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" title="List">
                            <i class="mdi mdi-format-list-bulleted"></i>
                            <span> Product List</span>
                        </a>
                    </li>
                    <li>
                        <a href="" title="Create New">
                            <i class="mdi mdi-file-document-box"></i>
                            <span> Create New</span>
                        </a>
                    </li>
                </ul>
            </li>
            
            <li class="">
                <a href="/admin/productlist" title="Brand"><i class="mdi mdi-gauge"></i> <span>Product List</span></a>
            </li>
            
            <li class="">
                <a href="/admin/orderlist">
                    <i class="mdi mdi-shopping"></i>
                    <span>Order</span>
                </a>
            </li>
            <li class="">
                <a href="/admin/report?thang=3&nam=2021" title="Statistic">
                    <i class="mdi mdi-graph-up">
                    </i> <span>Statistic</span>
                </a>
                <ul class="child-list">
                    <li>
                        <a href="/admin/orderlist" title="Orders">
                            <i class="mdi mdi-format-list-bulleted"></i>
                            <span> Order List</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>

    </div>
</div>