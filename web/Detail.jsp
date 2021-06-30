<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <section class="jumbotron text-center">
                <div class="container">
                    <h1 class="jumbotron-heading"><b>SWP</b> Bakery </h1>
                    <p class="lead text-muted mb-0">High Quality Products Only</p>
                </div>
            </section>
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
            <div class="container">
                <div class="row">
                    <div class="container">
                        <div class="row">
                        <jsp:include page="Left.jsp"></jsp:include>
                            <div class="col-sm-9">
                                <div class="container">
                                    <div class="card">
                                        <div class="row">
                                            <aside class="col-sm-5 border-right">
                                                <article class="gallery-wrap"> 
                                                    <div class="img-big-wrap">
                                                        <div> <a href="#"><img src="${p.thumbNailLink}" alt="Card image cap"></a></div>
                                                </div> <!-- slider-product.// -->
                                                <div class="img-small-wrap">
                                                </div> <!-- slider-nav.// -->
                                            </article> <!-- gallery-wrap .end// -->
                                        </aside>
                                        <aside class="col-sm-7">
                                            <article class="card-body p-5">
                                                <h3 class="title mb-3">${p.name}</h3>

                                                <p class="price-detail-wrap"> 
                                                    <span class="price h3 text-warning"> 
                                                        <span class="currency">VND: </span><span class="num">${p.originalSalePrice}</span> <br>
                                                        <span class="currency">VND: </span><span class="num"><del>${p.salePrice}</del></span>
                                                    </span> 
                                                </p> <!-- price-detail-wrap .// -->
                                                <dl class="item-property">
                                                    <dt>Description</dt>
                                                    <dd><p>
                                                            ${p.details}
                                                        </p></dd>
                                                </dl>

                                                <hr>
                                                <div class="row">
                                                    <div class="col-sm-5">
                                                        <dl class="param param-inline">
                                                            <dt>In Stock: ${p.stock} </dt>
                                                            <dd>
                                                                <select class="form-control form-control-sm" style="width:70px;">
                                                                    <option> 1 </option>
                                                                    <option> 2 </option>
                                                                    <option> 3 </option>
                                                                </select>
                                                            </dd>
                                                        </dl>  <!-- item-property .// -->
                                                    </div> <!-- col.// -->

                                                </div> <!-- row.// -->
                                                <hr>
                                                <a href="#" class="btn btn-lg btn-primary text-uppercase"> Buy now </a>
                                                <a href="#" class="btn btn-lg btn-outline-primary text-uppercase"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
                                            </article> <!-- card-body.// -->
                                        </aside> <!-- col.// -->
                                    </div> <!-- row.// -->
                                </div> <!-- card.// -->
                                <ul class="pagination">
                                    <c:forEach begin="1" end="${maxPages}" var="i">
                                        <li class="page-item"><a class="page-link" href="paging?index=${i}">${i}</a></li>
                                        </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">

                                </ol>

                            </nav> 

                        </div>
                        <div class="clearfix">


                        </div>

                    </div>
                </div>
                <jsp:include page="Footer.jsp"></jsp:include>
                </body>
                </html>
