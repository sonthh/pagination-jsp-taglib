<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="assets/img/logo-fav.png">
    <title>Beagle</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminUrl/assets/lib/perfect-scrollbar/css/perfect-scrollbar.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminUrl/assets/lib/material-design-icons/css/material-design-iconic-font.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminUrl/assets/css/app.css" type="text/css"/>
  </head>
  <body class="be-splash-screen">
  
	<%-- <security:authorize access="isAuthenticated()">
        <security:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MOD')">
		  <c:redirect url="/admin" />
        </security:authorize>
        <security:authorize access="hasRole('ROLE_USER')">
		  <c:redirect url="/" />
        </security:authorize>
	</security:authorize> --%>
  
    <div class="be-wrapper be-login">
      <div class="be-content">
        <div class="main-content container-fluid">
          <div class="splash-container">
            <div class="card card-border-color card-border-color-primary">
              <div class="card-header">
                <img class="logo-img" src="${pageContext.request.contextPath}/adminUrl/assets/img/logo-xx.png" alt="logo" width="102" height="27">
                <span class="splash-description">Please enter your user information.</span>
                <c:if test="${param['error'] ne null}">
                  <span class="splash-description text-danger">Sai username hoặc password.</span>
                </c:if>
               </div>
              <div class="card-body">
                <form action="${pageContext.request.contextPath}/auth/login" method="post">
                  <div class="form-group">
                    <input class="form-control" id="username" name="username" type="text" placeholder="Username" autocomplete="off">
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="password" name="password" type="password" placeholder="Password">
                  </div>
                  <div class="form-group row login-tools">
                    <div class="col-6 login-remember">
                      <label class="custom-control custom-checkbox">
                        <input name="rememberme" class="custom-control-input" type="checkbox"><span class="custom-control-label">Remember Me</span>
                      </label>
                    </div>
                    <div class="col-6 login-forgot-password"><a href="javascript:void(0)">Forgot Password?</a></div>
                  </div>
                  <div class="form-group login-submit">
                    <button class="btn btn-primary btn-xl" type="submit">Login</button>
                  </div>
                </form>
              </div>
            </div>
            <div class="splash-footer"><span>Don't have an account? <a href="javascript:void(0)">Sign Up</a></span></div>
          </div>
        </div>
      </div>
    </div>
    <script src="${pageContext.request.contextPath}/adminUrl/assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/adminUrl/assets/lib/perfect-scrollbar/js/perfect-scrollbar.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/adminUrl/assets/lib/bootstrap/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/adminUrl/assets/js/app.js" type="text/javascript"></script>
    <script type="text/javascript">
      $(document).ready(function(){
      	//-initialize the javascript
      	App.init();
      });
      
    </script>
  </body>
</html>