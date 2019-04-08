<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="pag" uri="/WEB-INF/taglibs/PaginationTaglib.tld" %>    
<%@include file="/WEB-INF/templates/taglib.jsp" %>    
<script type="text/javascript">
document.getElementById('user').classList.add('active');
</script>  
        <div class="page-head">
          <h2 class="page-head-title">User</h2>
          <nav aria-label="breadcrumb" role="navigation">
            <ol class="breadcrumb page-head-nav">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Admin</a></li>
              <li class="breadcrumb-item active">User</li>
            </ol>
          </nav>
        </div>
        <div class="main-content container-fluid">
		      <jsp:include page="/WEB-INF/templates/admin/common/alert-message.jsp"></jsp:include>	
			
			    <div class="row mb-1">
			      <div class="col-sm-4">
	            <a href="${pageContext.request.contextPath}/admin/user/add"><button class="btn btn-space btn-primary"><i class="icon icon-left mdi mdi-plus"></i>Add</button></a>
		       	  <button id="deleteSelected" class="btn btn-space btn-danger"><i class="icon icon-left mdi mdi-delete"></i>Delete</button>
	          </div>
	          <div class="col-sm-8">
		          <form class="row" action="${pageContext.request.contextPath}/admin/user/search" method="get">
		            <div class="col-4">
		              <input class="form-control form-control-sm" style="height: 31px;" required="required" value="${param['q']}" name="q" id="" type="text" placeholder="Search">
		            </div>
		            <div class="col-2">
		              <button class="btn btn-space btn-primary" type="submit"><span class="icon icon-left mdi mdi-search"></span>Search</button>
		            </div>
		          </form>
	          </div>
			    </div>		
	        <div class="row">
	          <div class="col-sm-12">
	            <div class="card card-table">
	              <div class="card-header">User table
	              </div>
	              <div class="card-body">
	                <div class="table-responsive noSwipe">
	                  <table class="table table-striped table-hover table-bordered" style="border: 1px solid #dee2e6;">
	                    <thead>
	                      <tr>
	                        <th style="width:4%;">
	                          <label class="custom-control custom-control-sm custom-checkbox">
	                            <input id="checkAll" class="custom-control-input" type="checkbox"><span class="custom-control-label"></span>
	                          </label>
	                        </th>
	                        <th style="width:10%;">Id</th>
	                        <th style="width:10%;">Username</th>
	                        <th style="width:10%;">Name</th>
	                        <th style="width:10%;">Gender</th>
	                        <th style="width:10%;">Email</th>
	                        <th style="width:20%;" class="text-right">Action</th>
	                      </tr>
	                    </thead>
	                    <tbody>
	                      <c:choose>
	                        <c:when test="${not empty users}">
	                          <c:forEach items="${users}" var="itemUser">
	                            <tr class="">
	                               <td>
	                                <label class="custom-control custom-control-sm custom-checkbox">
	                                  <input value="${itemProduct.id}" name="checkItem" class="custom-control-input" type="checkbox"><span class="custom-control-label"></span>
	                                </label>
	                              </td>
	                              <td class="cell-detail"><span>${itemUser.id}</span></td>
	                              <c:set var="styleSearchString" value="<span class='d-inline' style='color: red'>${param['q']}</span>"></c:set>
	                              <td class="cell-detail"> <span>${fn:replace(itemUser.username, param['q'], styleSearchString)}</span></td>
	                              <td class="cell-detail"><span>${itemUser.name}</span></td>
	                              <td class="cell-detail">
	                                <span>
	                              		<c:choose>
	                              			<c:when test="${itemUser.gender == false}">Female</c:when>
	                              			<c:otherwise>Male</c:otherwise>
	                              		</c:choose>
								               </span>
							                </td>
	                              <td class="cell-detail"><span>${itemUser.email}</span></td>
	                              <td class="text-right">
	                                <a href="${pageContext.request.contextPath}/admin/user/edit/${itemUser.id}?page=${page}">
	                                  <button class="btn btn-space btn-success"><i class="icon icon-left mdi mdi-edit"></i>Edit</button>
	                                </a>
	                                <a href="${pageContext.request.contextPath}/admin/user/delete/${itemUser.id}?page=${page}" onclick="return confirm('Bạn có muốn xóa ${itemUser.username}')">
	                                	<button class="btn btn-space btn-danger"><i class="icon icon-left mdi mdi-delete"></i>Delete</button>
	                                </a>
	                              </td>
	                            </tr>
	                          </c:forEach>
	                        </c:when>
	                        <c:otherwise>
	                          <td class="cell-detail text-center" colspan="10"><span>No user find.</span></td>
	                        </c:otherwise>
	                      </c:choose>
	                    </tbody>
	                  </table>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
          <div class="row">
				    <div class="col-sm-12 d-sm-flex justify-content-sm-center">
				    	<pag:paginate numberOfPagesDisplay="7" currentPage="${page}" uri="${pageContext.request.contextPath}/admin/user/search?q=${param['q']}" numberOfPages="${numberOfPages}"/>
		        </div>
		      </div>
        </div>
