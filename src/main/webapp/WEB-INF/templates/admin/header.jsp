<%@include file="/WEB-INF/templates/taglib.jsp" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <nav class="navbar navbar-expand fixed-top be-top-header">
        <div class="container-fluid">
          <div class="be-navbar-header"><a class="navbar-brand" href="${pageContext.request.contextPath}/admin"></a>
          </div>
          <div class="be-right-navbar">
            <ul class="nav navbar-nav float-right be-user-nav">
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-expanded="false"><img src="${pageContext.request.contextPath}/adminUrl/assets/img/avatar.png" alt="Avatar"><span class="user-name">Túpac Amaru</span></a>
                <div class="dropdown-menu" role="menu">     
                  <div class="user-info">
                      <div class="user-name"></div>
                    <div class="user-position online">online</div>
                  </div>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/auth/logout"><span class="icon mdi mdi-power"></span>Logout</a>
                </div>
              </li>
            </ul>
            <div class="page-title"><span>S-SHOP</span></div>
          </div>
        </div>
      </nav>