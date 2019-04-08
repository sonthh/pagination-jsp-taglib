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
  
    <div class="be-wrapper be-login">
      <div class="be-content">
        <div class="main-content container-fluid">
          <div class="splash-container">
            <div class="card card-border-color card-border-color-primary">
              <div class="card-header"><img class="logo-img" src="${pageContext.request.contextPath}/adminUrl/assets/img/logo-xx.png" alt="logo" width="102" height="27">
                <span class="splash-description">Warning message.</span>
              </div>
              <div class="card-body text-center">
              
                <c:choose>
                  <c:when test="${param['msg'] eq 'success'}">
                    Confirm password thành công!
                  </c:when>
                  <c:otherwise>
                    Có lỗi gì đó xảy ra vui lòng liên hệ với chúng tôi, tranhuuhongson@gmail.com
                  </c:otherwise>
                </c:choose>
              
              </div>
            </div>
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