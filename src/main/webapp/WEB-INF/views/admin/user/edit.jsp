<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %> 
<script type="text/javascript">
document.getElementById('user').classList.add('active');
</script>    
        <div class="page-head">
          <h2 class="page-head-title">User</h2>
          <nav aria-label="breadcrumb" role="navigation">
            <ol class="breadcrumb page-head-nav">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Admin</a></li>
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/user">User</a></li>
              <li class="breadcrumb-item active">Edit</li>
            </ol>
          </nav>
        </div>
        
        <div class="main-content container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card card-border-color card-border-color-primary">
                <div class="card-header card-header-divider">User edit<span class="card-subtitle">Edit user.</span></div>
                <div class="card-body">
                  <form action="" method="post">

                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="username">Username</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="username" name="username" value="${user.username}" type="text" placeholder="Username">
                        <form:errors path="user.username" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="password">Password</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="password" name="password" value="" type="password" placeholder="Password">
                        <form:errors path="user.password" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="repassword">RePassword</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="repassword" name="repassword" value="" type="password" placeholder="RePassword">
                        <form:errors path="user.password" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="name">Name</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="name" name="name" value="${user.name}" type="text" placeholder="Name">
                        <form:errors path="user.name" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="roles">Roles</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                      	<c:forEach items="${roles}" var="itemRole">
                      	  <c:set var="checked" value="" />
                      	  <c:forEach items="${user.roles}" var="item">
                      	    <c:if test="${itemRole.name eq item.name}">
                      	      <c:set var="checked" value="checked" />
                      	    </c:if>
                      	  </c:forEach>
	                        <label class="custom-control custom-checkbox">
	                          <input class="custom-control-input" value="${itemRole.id}" type="checkbox" name="r" ${checked}><span class="custom-control-label">${itemRole.name}</span>
	                        </label>
                        </c:forEach>
                        <form:errors path="user.roles" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                      
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="gender">Gender</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <div class="form-check form-check-inline">
                        
                          <c:set var="isMale" value="" />
                          <c:set var="isFemale" value="" />
                          <c:choose>
                            <c:when test="${user.gender == true}">
                              <c:set var="isMale" value="checked" />
                            </c:when>
                            <c:otherwise>
                              <c:set var="isFemale" value="checked" />
                            </c:otherwise>
                          </c:choose>
                          
                          <label class="custom-control custom-radio custom-radio-icon custom-control-inline">
                          	<input class="custom-control-input" id="gender" type="radio" name="gender" value="true" ${isMale}><span class="custom-control-label"><i class="mdi mdi-male-alt"></i></span>
                          </label>
                          <label class="custom-control custom-radio custom-radio-icon custom-control-inline">
                            <input class="custom-control-input" id="" type="radio" name="gender" value="false" ${isFemale}><span class="custom-control-label"><i class="mdi mdi-female"></i></span>
                          </label>
                        </div>
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="identifyCard">Indentify Cart</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="identifyCard" name="identifyCard" value="${user.identifyCard}" type="number" placeholder="Indentify Cart">
                        <form:errors path="user.identifyCard" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="phoneNumber">Phone Number</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" type="number" placeholder="Phone Number">
                        <form:errors path="user.phoneNumber" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="address">Address</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="address" name="address" value="${user.address}" type="text" placeholder="Address">
                        <form:errors path="user.address" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="email">Email</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="email" name="email" value="${user.email}" type="text" placeholder="Email">
                        <form:errors path="user.email" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="row pt-3">
                      <div class="col-sm-12">
                        <p class="text-right">
                          <button class="btn btn-space btn-primary" type="submit"><i class="icon icon-left mdi mdi-edit"></i> Edit</button>
                        </p>
                      </div>
                    </div>
                    
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
     