<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script type="text/javascript" src="<%=request.getContextPath()%>/libraries/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/libraries/ckfinder/ckfinder.js"></script>
    <script>
      var editor = CKEDITOR.replace('content');
      CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/libraries/ckfinder/');
    </script>
