<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Product</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <!--  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>

        <jsp:include page="Menu.jsp"></jsp:include>
        <c:if test="${sessionScope.user.roleID == 3}">
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Product</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="getCategoryData"  class="btn btn-success"><span>Add New Product</span></a>
                                <!--                                <i class="material-icons">&#xE147;</i>-->


                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Sale Price</th>
                                <th>Original Price</th>
                                <th>No. in Stock</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listP}" var="o">

                                <tr>
                                    <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                            <label for="checkbox1"></label>
                                        </span>
                                    </td>
                                    <td>${o.id}</td>
                                    <td>${o.name}</td>
                                    <td>
                                        <img src="${o.thumbNailLink}" alt="Card image cap">
                                    </td>
                                    <c:if test="${o.originalSalePrice < o.salePrice}">
                                        <td>${o.originalSalePrice} VND</td>
                                        <td><del>${o.salePrice}</del> VND</td>
                                    </c:if>
                                    <c:if test="${o.originalSalePrice >= o.salePrice}">
                                        <td></td>
                                        <td>${o.salePrice} VND</td>
                                    </c:if>
                                    <td>${o.stock}</td>
                                    <td>
                                        <a href="getProductData?pID=${o.id}"  class="edit" data-toggle="modal">Edit</a> 
                                        <!--                                        <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>-->
                                        <a href="delete?pID=${o.id}" class="delete" data-toggle="modal">Delete</a>
                                        <!--                                        <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>-->
                                    </td>
                                    
                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>
                    <div class="clearfix">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${maxPages}" var="i">
                                <li class="page-item ${index == i ? "active": ""} "><a class="page-link" href="pagingManageProduct?index=${i}" ${index == i ? "active": ""}>${i}</a></li>
                                </c:forEach>

                        </ul>

                    </div>

                </div>
                <a href="home"><button type="button" class="btn btn-success">Back to home</button></a>

            </div>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>

            <script src="js/manager.js" type="text/javascript"></script>
        </c:if>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>