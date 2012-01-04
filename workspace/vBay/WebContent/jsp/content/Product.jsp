<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="custag" uri="/WEB-INF/CustomTagLibrary"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$('#tabs').tabs();

		$('.ajaxDemoLink').click(function() {
			$.post('${contextPath}/general/productdemo', {
				maMultimedia : $(this).attr('id')
			}, function(data) {
				$('#ajaxProductDemo').html(data);
			});
		});
	});
</script>

<div class="contentframe ui-widget-content ui-corner-all">
  <div class="captionbox ui-widget-header ui-corner-top">CHI TIẾT PHIÊN ĐẤU GIÁ</div>
  <div class="content">
    <h1>${sanPham.tenSanPham}</h1>
    <p>
      Người bán: <a href="../TrangCuaHang.html">${sanPham.taiKhoan.tenTaiKhoan }</a>
    </p>

    <div id="auction_detail">
      <div class="clearfloat"></div>
      <div style="float: left; width: 45%">
        <div id="ajaxProductDemo">
        <c:if test="${sanPham.multimedias.size() != 0}">
        <img src="<c:url value='${ sanPham.multimedias.toArray()[0].linkURL}'/>" />
        </c:if>
        </div>
        <c:forEach var="multimedia" items="${sanPham.multimedias }" varStatus="varStatus">
          <a class="ajaxDemoLink" id=${multimedia.maMultimedia }> <c:if
              test="${multimedia.loaiMultimedia.maLoaiMultimedia == 1}">
              <%--multimedia is an image --%>
            IMAGE
          </c:if> <c:if test="${multimedia.loaiMultimedia.maLoaiMultimedia == 2}">
              <%--multimedia is an video clip --%>
            CLIP
          </c:if>
          </a>
        </c:forEach>
      </div>
      <div style="float: right; width: 45%">
        <div id="tabs">
          <ul>
            <li><a href="#tabs-1">Chi tiết đấu giá</a></li>
            <li><a href="#tabs-2">Thông tin cửa hàng</a></li>
          </ul>
          <div id="tabs-1">
            <table>
              <tr>
                <td><b>Giá khởi điểm</b></td>
                <td><custag:GiaTienTag unit="VND" value="${sanPham.giaKhoiDiem }" /></td>
              </tr>
              <tr>
                <td><b>Giá hiện tại</b></td>
                <td><custag:GiaTienTag unit="VND" value="${sanPham.giaHienTai }" /></td>
              </tr>
              <tr>
                <td><b>Bắt đầu:</b></td>
                <td>${sanPham.ngayDang }</td>
              </tr>
              <tr>
                <td><b>Kết thúc:</b></td>
                <td>${sanPham.ngayHetHan }</td>
              </tr>
            </table>

          </div>
          <div id="tabs-2">
            <p>${sanPham.taiKhoan.tenTaiKhoan }</p>
          </div>
        </div>
      </div>
      <div class="clearfloat"></div>
    </div>
    <p>${sanPham.moTaSanPham}</p>
  </div>
</div>