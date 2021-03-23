<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach var="item" items="${menu}">
    <li>
        <a href="<c:url value="/shop/searchresult?search=${item.getBrandName()}"/>">
            ${item.getBrandName()}
        </a>
    </li>
</c:forEach>