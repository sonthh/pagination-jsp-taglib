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
    <script type="text/javascript">
      $(document).ready(function(){
    	  $('#deleteSelected').click(function() {
	    	  var checked = [];
	    	  $("input[name='aRow']:checked").each(function () {
	    	      checked.push(parseInt($(this).val()));
	    	  });
	    	  console.log(checked);
	    	  if (checked.length > 0) {
	    		  var check = confirm('Bạn có muốn xóa ' + checked.length + ' product');
	    		  if (check == true) {
    		    	  $.ajax({
    		    		  type: "post",
    		    		  url: "<%=request.getContextPath()%>/admin/product/deleteSelected",
    		    		  data: {checked: checked},
    		    		  cache: false,
    		    		  success: function(data){
    		    		    alert('Bạn vừa xóa' + data + ' product');
    		    		    window.location.reload(true);
    		    		  },
    		    		  error: function() {
    		    			  console.log('lỗi');
    		    		  }
    		    	  });
	    		  }
	    	  } else {
			  		alert('Chưa chọn item nào!');
	    	  }
    	  });
    	  
    	  
    	  
    	  //khi click vào nut checkAll thì tất cả các row được check
    	  var $checkAll = $('#checkAll'); 
    	  $checkAll.click(function() {
    		  var checkAll = this.checked;
    		  $("input[name='aRow']").each(function () {
		      		this.checked = checkAll;
		      });
    	  });
    	  
    	  //khi tất cả các row được check hoặc tồn tại một row ko được check thì phải cập nhật nút checkAll
    	  $("input[name='aRow']").click(function() {
    		  $checkAll[0].checked = isCheckedAll();
    	  });
    	  function isCheckedAll() {
    		  var check = true;
    		  $("input[name='aRow']").each(function () {
    		  	if (this.checked == false) {
    		  		check = false;
    		  		return;
    		  	}
    		  });
    		  return check;
    	  }
      });
    </script>