<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- <div class="contentframe ui-widget-content ui-corner-all">
  <div class="captionbox ui-widget-header ui-corner-top">TÌM KIẾM TRONG CỬA HÀNG</div>
  <div class="content">
    <form method="get" action="Search.vby" name="formTimNhanh">
      <input type="text" name="khoaTimKiem" value="" style="width: 55%" />
      <input type="submit" value="Tìm kiếm" name="submitTimNhanh" style="width: 40%">
    </form>
  </div>
</div> -->


<!-- <div class="contentframe ui-widget-content ui-corner-all">
  <div class="captionbox ui-widget-header ui-corner-top">LIÊN KẾT NHANH</div>
  <div class="content">
    <ul class="vertlist">
      <li><a href="#"><strong>Xem đấu giá</strong></a></li>
      <li><a href="#"><strong>Quy định của cửa hàng</strong></a></li>
      <li><a href="#"><strong>Vận chuyển hàng</strong></a></li>
      <li><a href="#"><strong>Thanh toán</strong></a></li>
    </ul>
  </div>
</div> -->
<div class="contentframe ui-widget-content ui-corner-all">
	<div class="captionbox ui-widget-header ui-corner-top">DANH MỤC
		CHÍNH</div>
	<div class="content">
		<ul class="vertlist">
			<c:forEach var="loaiSanPham" items="${ dsLoaiSanPham}">
				<li><a
					href="ShowProducts.vby?maLoaiSanPham=${loaiSanPham.maLoaiSanPham}&tenLoaiSanPham=${loaiSanPham.tenLoaiSanPham}"><strong>${loaiSanPham.tenLoaiSanPham}</strong></a></li>
			</c:forEach>
		</ul>
	</div>
</div>