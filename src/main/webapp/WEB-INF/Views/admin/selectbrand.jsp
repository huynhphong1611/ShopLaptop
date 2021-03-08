<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Product</title>
    </head>
    <body>

        <h5>Select Brand</h5>
        <hr />

        <div class="row">
            <c:forEach var="item" items="${brand}">
                <div class="col-lg-3 col-sm">
                    <div class="card bg-white m-b-30">
                        <h4 class="card-header">
                            <i class="mdi mdi-package"></i>
                            <a href="/admin/createproduct/${item.getBrandID()}" id="save-${item.getBrandID()}">
                                ${item.getBrandName()}
                            </a>

                        </h4>
                        <div class="card-body">
                            <p class="card-text"><strong>Url:</strong> ${item.getBrandUrl()}</p>
                            <p class="card-text"><strong>Date:</strong> ${item.getCreatedDate() }</p>
                        </div>
                    </div>
                </div>

            </c:forEach>


        </div>
    </body>
    
   
    
</html>
