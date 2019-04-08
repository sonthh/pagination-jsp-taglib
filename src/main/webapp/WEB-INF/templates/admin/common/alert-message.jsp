<%@page import="com.itsontran.constant.MessageEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<c:if test="${not empty message}">
	<c:set var="alertClass" value="" />
	<c:set var="alertMessage" value="" />
	<c:choose>
		<c:when test="${message eq MessageEnum.MSG_ADD_SUCCESS}">
			<c:set var="alertClass" value="primary" />
			<c:set var="alertMessage" value="Success" />
		</c:when>
		<c:when test="${message eq MessageEnum.MSG_UPDATE_SUCCESS}">
			<c:set var="alertClass" value="success" />
			<c:set var="alertMessage" value="Success" />
		</c:when>
		<c:when test="${message eq MessageEnum.MSG_DELETE_SUCCESS}">
			<c:set var="alertClass" value="warning" />
			<c:set var="alertMessage" value="Success" />
		</c:when>
		<c:when test="${message eq MessageEnum.MSG_ERROR}">
			<c:set var="alertClass" value="danger" />
			<c:set var="alertMessage" value="Error" />
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	<div class="row">
	  	<div class="col-sm-12">
			<div
				class="alert alert-primary alert-icon alert-icon-border alert-dismissible"
				role="alert">
				<div class="icon">
					<span class="mdi mdi-check"></span>
				</div>
				<div class="message">
					<button class="close" type="button" data-dismiss="alert"
						aria-label="Close">
						<span class="mdi mdi-close" aria-hidden="true"></span>
					</button>
					<strong>${alertMessage}</strong>${message.message}
				</div>
			</div>
		</div>
	</div>
</c:if>
