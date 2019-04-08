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
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/adminUrl/assets/img/logo-fav.png">
    <title>S-Shop</title>
	<tiles:insertAttribute name="css"></tiles:insertAttribute>
  </head>
  <body>
    <div class="be-wrapper">
    
      <tiles:insertAttribute name="header"></tiles:insertAttribute>
      
      <tiles:insertAttribute name="left-sidebar"></tiles:insertAttribute>
      
      <div class="be-content">
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
      </div>

	<tiles:insertAttribute name="right-sidebar"></tiles:insertAttribute>
	
    </div>
	
	<tiles:insertAttribute name="js"></tiles:insertAttribute>
	
  </body>
</html>