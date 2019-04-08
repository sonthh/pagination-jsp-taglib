<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<script type="text/javascript">
document.getElementById('dashboard').classList.add('active');
</script>  
        <div class="main-content container-fluid">
          <div class="row">
          
            <div class="col-12 col-lg-6 col-xl-3">
              <div class="widget widget-tile">
                <i class="icon mdi mdi-accounts text-danger" style="font-size: 40px"></i>
                <div class="data-info">
                  <div class="desc">Users</div>
                  <div class="value"><span class="number" data-toggle="counter" data-end="${countUser}">0</span>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-12 col-lg-6 col-xl-3">
              <div class="widget widget-tile">
                <i class="icon mdi mdi-phone-in-talk text-success" style="font-size: 40px"></i>
                <div class="data-info">
                  <div class="desc">Contact</div>
                  <div class="value"><span class="number" data-toggle="counter" data-end="${countContact}">0</span>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-12 col-lg-6 col-xl-3">
              <div class="widget widget-tile">
                <i class="icon mdi mdi-shopping-cart text-warning" style="font-size: 40px"></i>
                <div class="data-info">
                  <div class="desc">Order</div>
                  <div class="value"><span class="number" data-toggle="counter" data-end="${countOrder}">0</span>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="col-12 col-lg-6 col-xl-3">
              <div class="widget widget-tile">
                <i class="icon mdi mdi-shopping-basket text-primary" style="font-size: 40px"></i>
                <div class="data-info">
                  <div class="desc">Product</div>
                  <div class="value"><span class="number" data-toggle="counter" data-end="${countProduct}">0</span>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 col-lg-6 col-xl-3">
              <div class="widget widget-tile">
                <i class="icon mdi mdi-slideshow text-warning" style="font-size: 40px"></i>
                <div class="data-info">
                  <div class="desc">Slide</div>
                  <div class="value"><span class="number" data-toggle="counter" data-end="${countSlide}">0</span>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 col-lg-6 col-xl-3">
              <div class="widget widget-tile">
                <i class="icon mdi mdi-storage text-danger" style="font-size: 40px"></i>
                <div class="data-info">
                  <div class="desc">Category</div>
                  <div class="value"><span class="number" data-toggle="counter" data-end="${countCategory}">0</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-lg-6">
              <div class="card">
                <div class="card-header">Gần đây.</div>
                <div class="card-body">
                  <ul class="user-timeline user-timeline-compact">
                    <li class="latest">
                      <div class="user-timeline-date">Just Now</div>
                      <div class="user-timeline-title">Sản phẩm</div>
                      <div class="user-timeline-description">Mới nhập hàng Hàn Quốc chất lượng.</div>
                    </li>
                    <li>
                      <div class="user-timeline-date">Today - 15:35</div>
                      <div class="user-timeline-title">Thanh toán</div>
                      <div class="user-timeline-description">Thanh toán điện tử payment.</div>
                    </li>
                    <li>
                      <div class="user-timeline-date">Yesterday - 10:41</div>
                      <div class="user-timeline-title">Shipper</div>
                      <div class="user-timeline-description">Giao hàng giá rẻ trên toàn quốc.</div>
                    </li>
                    <li>
                      <div class="user-timeline-date">Yesterday - 3:02</div>
                      <div class="user-timeline-title">Chế độ.</div>
                      <div class="user-timeline-description">Thêm chế độ khách VIP.</div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-12 col-lg-6">
            </div>
          </div>
        </div>
