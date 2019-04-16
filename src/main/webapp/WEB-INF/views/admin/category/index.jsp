<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/templates/taglib.jsp" %>    
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Spring</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminUrl/css/bootstrap.css" type="text/css">
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
                    <div class="collapse navbar-collapse" id="">
                        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                            <li class="nav-item ${categoryLinkActive ? 'active' : ''}">
                                <a class="nav-link" href="#">Category</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Link</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        Table
                    </div>
                    <div class="card-body">
                            <a class="btn btn-secondary mb-2" href="#">Add</a>
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Aciton</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${categories}" var="category">
	                                <tr>
	                                    <td>${category.id}</td>
	                                    <td>${category.name}</td>
	                                    <td>
	                                        <a id="" class="btn btn-sm btn-secondary" href="#">Edit</a>
	                                        <a id="" class="btn btn-sm btn-danger" href="#">Delete</a>
	                                    </td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <nav aria-label="Page navigation">
                                        <!-- <ul class="d-flex justify-content-end pagination pagination-sm">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>

                                            <li class="page-item active">
                                                <a class="page-link" href="#">1</a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" href="#">2</a>
                                            </li>

                                            <li class="page-item">
                                                <a class="page-link" href="#">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>

                                        </ul> -->
                                        <pagination:paginate currentPage="${page}" uri="${pageContext.request.contextPath}/admin/category" numberOfPages="${numberOfPages}"/>
                                        <%-- <pagination:paginate numberOfPagesDisplay="7" currentPage="${page}" uri="${pageContext.request.contextPath}/admin/category" numberOfPages="${numberOfPages}"/> --%>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <div class="col-sm-12">

            </div>
        </div>

    </div>

    <script src="${pageContext.request.contextPath}/adminUrl/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/adminUrl/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/adminUrl/js/popper.min.js"></script>
</body>

</html>