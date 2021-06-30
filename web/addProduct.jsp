<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Product</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<!--        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>Edit Product</title>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <c:if test="${sessionScope.user.roleID == 3}">
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2 >Manage <b>Product</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="manageProduct"><button type="button" class="btn btn-success">Back</button></a>


                            </div>
                        </div>
                    </div>
                    <div id="addProduct" class="">
                        <div class="modal-dialog" >
                            <div class="modal-content">
                                <form action="add" method="post">
                                    <div class="modal-header">						
                                        <h3 class="modal-title">Add <b>Product</b></h3>

                                    </div>
                                    <div class="modal-body">	
                                        
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input  name="name" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Image/ Thumbnail Link</label>
                                            <input  name="thumbnail" type="text" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Sale Price (VND)</label>
                                            <input  name="originSalePrice" type="number" class="form-control" >
                                        </div>
                                        <div class="form-group">
                                            <label>Original Price (VND)</label>
                                            <input  name="salePrice" type="number" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>No. in Stock</label>
                                            <input  name="stock" class="form-control" type="number" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Description</label>
                                            <textarea name="description" class="form-control" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Category</label>
                                            <select name="cateID" class="form-select" aria-label="Default select example">
                                                <c:forEach items="${listCate}" var="o">
                                                    <option  value="${o.id}">${o.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group">

                                            <label>Status </label>
                                            <select name="status" class="form-select" aria-label="Default select example">
                                                <option  value="true" selected >True</option>
                                                <option  value="fase">False</option>
                                                <option  value="null">NULL</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label>Sale Status </label>
                                            <select name="saleStatus" class="form-select" aria-label="Default select example">
                                                <option  value="true" selected >True</option>
                                                <option  value="fase">False</option>
                                                <option  value="null">NULL</option>
                                            </select>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <a href="manageProduct"><input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel"></a>
                                        <input type="submit" class="btn btn-info" value="Add">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
