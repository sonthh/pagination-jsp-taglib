<%@page import="com.itsontran.service.CategoryService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %> 
<script type="text/javascript">
document.getElementById('product').classList.add('active');
</script>    
        <div class="page-head">
          <h2 class="page-head-title">Product</h2>
          <nav aria-label="breadcrumb" role="navigation">
            <ol class="breadcrumb page-head-nav">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Admin</a></li>
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/product">Product</a></li>
              <li class="breadcrumb-item active">Add</li>
            </ol>
          </nav>
        </div>
        <div class="main-content container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card card-border-color card-border-color-primary">
                <div class="card-header card-header-divider">Product table<span class="card-subtitle">Thêm một sản phẩm bạn muốn bán.</span></div>
                <div class="card-body">
                  <form action="" method="post" enctype="multipart/form-data">

                    <div class="form-group row pt-1">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right">Category</label>
                      <div class="col-12 col-sm-10 col-lg-6">
                      	<select name="categoryId" class="form-control">
                      		<%
								CategoryService categoryService = (CategoryService) request.getAttribute("categoryService");
								categoryService.createOption(out, -1, -1);
							%>
                      	</select>
                      </div>
                    </div>
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="name">Name</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" id="name" name="name" value="${objProduct.name}" type="text" placeholder="Name">
                        <form:errors path="objProduct.name" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="description">Description</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <textarea class="form-control" id="description" name="description" placeholder="Desciption">${objProduct.description}</textarea>
                        <form:errors path="objProduct.description" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="content">Content</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <textarea class="form-control" id="content" name="content">${objProduct.content}</textarea>
                        <form:errors path="objProduct.content" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row pt-1">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="price">Price</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" name="price" value="${objProduct.price}" id="price" type="number" min="1" value="">
                        <form:errors path="objProduct.price" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row pt-1">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="discount">Discount</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" name="discount" id="discount" value="${objProduct.discount}" type="number" min="0" value="">
                        <form:errors path="objProduct.discount" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row pt-1">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="countRemain">Count Remain</label>
                      <div class="col-12 col-sm-10 col-lg-10">
                        <input class="form-control" name="countRemain" id="countRemain" value="${objProduct.countRemain}" type="number" min="0" value="">
                        <form:errors path="objProduct.countRemain" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="picture">Images</label>
                      <div class="col-12 col-sm-10">
                        <input onchange="changeInput(this)" accept="image/gif, image/jpeg, image/png" class="inputfile" id="picture" 
                        type="file" name="picture" data-multiple-caption="{count} files selected" >
                        <label class="btn-secondary" for="picture"> <i class="mdi mdi-upload"></i><span>Browse images...</span></label>
                        <form:errors path="objProduct.image" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    <div class="form-group row d-none" id="filePreview">
                      <div class="col-12 col-sm-2"></div>
                      <div class="col-12 col-sm-10">
                      	<div class="row">
                      	  <div class="col-12 col-sm-12" id="imagesPreview">
                      	  </div>
                      	</div>
                      </div>
                    </div>
                    <script type="text/javascript">
                    	function readURL(input) {
                   			if (input.files && input.files[0]) {
                   		    	var reader = new FileReader();
                   		    	reader.onload = function(e) {
                   		    		var img = $("<img class='w-25 img-thumbnail rounded' style='height: 200px' />");
                                    img.attr('src', event.target.result);
                                    img.appendTo($('#imagesPreview'));
                   		    	}
                   		    	reader.readAsDataURL(input.files[0]);
                   		  	}
                   		}
                    	function changeInput(input) {
                    		$('#filePreview').removeClass('d-none');
                    		$('#imagesPreview').html('');
                    		readURL(input);
                    	}
                    </script>
                    
                    <div class="form-group row">
                      <label class="col-12 col-sm-2 col-form-label text-sm-right" for="pictures">Images Detail</label>
                      <div class="col-12 col-sm-10">
                        <input onchange="changeInputMultiple(this)" accept="image/gif, image/jpeg, image/png" class="inputfile"
                         id="pictures" name="pictures" type="file" name="images" data-multiple-caption="{count} files selected" multiple>
                        <label class="btn-primary" for="pictures"> <i class="mdi mdi-upload"></i><span>Browse images...</span></label>
                        <form:errors path="objProduct.imageList" cssClass="parsley-errors-list filled d-block mt-2" />
                      </div>
                    </div>
                    
                    <div class="form-group row d-none" id="filePreviewMuliple">
                      <div class="col-12 col-sm-2"></div>
                      <div class="col-12 col-sm-10">
                      	<div class="row">
                      	  <div class="col-12 col-sm-12" id="imagesPreviewMultiple">
                      	  </div>
                      	</div>
                      </div>
                    </div>
                    
                    <script type="text/javascript">
                        function readURLMultiple(input) {
                 			if (input.files && input.files[0]) {
                 	            for (i = 0; i < input.files.length; i++) {
                 	                var reader = new FileReader();
                 	             	reader.onload = function(e) {
                    		      		var img = $("<img class='w-25 img-thumbnail rounded' style='height: 200px' />");
                                        img.attr('src', event.target.result);
                                        img.appendTo($('#imagesPreviewMultiple'));
                  		    		}
                 	             	reader.readAsDataURL(input.files[i]);
                 	            }
                 		  	}
                        }
                      	function changeInputMultiple(input) {
                      		$('#filePreviewMuliple').removeClass('d-none');
                      		$('#imagesPreviewMultiple').html('');
                      		readURLMultiple(input);
                      	}
                    </script>
                    <div class="row pt-3">
                      <div class="col-sm-12">
                        <p class="text-right">
                          <button class="btn btn-space btn-primary" type="submit"><i class="icon icon-left mdi mdi-plus"></i> Add</button>
                        </p>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
     