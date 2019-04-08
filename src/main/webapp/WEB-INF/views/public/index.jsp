<%@page import="com.itsontran.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="tag" uri="/WEB-INF/taglibs/PaginationTaglib.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	select {
		font-size: 25px;
	}
	option.level-1 {
		color: red;
		/* font-size: 25px */
		
	}
	option.level-2 {
		color: blue;
		/* font-size: 21px; */
	}
	option.level-3 {
		color: yellow;
		/* font-size: 18px; */
	}
	option.level-4 {
		color: green;
		/* font-size: 15px; */
	}
	option.level-5 {
		color: pink;
		/* font-size: 12px; */
	}
</style>
</head>
<body>
	<%
		CategoryService categoryService = (CategoryService) request.getAttribute("categoryService");
		categoryService.createMenu(out, request);
	%>
	<div id="selectCat">
		<select>
			<%
			categoryService.createOption(out, -1, -1);
			%>
		</select>
	</div>
	 <div>
            <tag:paginate numberOfPagesDisplay="7" currentPage="1" uri="google.com" numberOfPages="5"/>
            </div>
	
	<script src="${pageContext.request.contextPath}/adminUrl/assets/lib/jquery/jquery.min.js" type="text/javascript"></script>
</body>
</html>