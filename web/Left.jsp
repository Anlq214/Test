<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
                                <div class="card bg-light mb-3">
                                    <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories </div>
                                    <ul class="list-group category_block">
                                        <c:forEach items="${listCate}" var="c">
                                        <li class="list-group-item text-white" ${cateID == c.id ? "active":""}><a href="category?cateID=${c.id}">${c.name}</a></li>
                                        </c:forEach>

                                </ul>
                            </div>
                            <div class="card bg-light mb-3">
                                <div class="card-header bg-success text-white text-uppercase">Latest Product</div>
                                <div class="card-body">
                                    <img class="img-fluid" src="${latestProduct.thumbNailLink}" alt="Card image cap" />
                                    <h5 class="card-title">${latestProduct.name}</h5>
                                    <p class="card-text">${latestProduct.details}</p>
                                    <c:if test="${latestProduct.originalSalePrice < latestProduct.salePrice}">
                                        <p class="bloc_left_price"><a href="detail?pID=${latestProduct.id}" class="bloc_left_price">${latestProduct.originalSalePrice} VND </a></p> 
                                    <p class="bloc_left_price"><del>${latestProduct.salePrice}</del> VND</p>
                                    </c:if>
                                    <c:if test="${latestProduct.originalSalePrice >= latestProduct.salePrice}">
                                    <p class="bloc_left_price"></p> 
                                    <p class="bloc_left_price">${latestProduct.salePrice} VND</p>
                                    </c:if>
                                </div>
                            </div>
                        </div>