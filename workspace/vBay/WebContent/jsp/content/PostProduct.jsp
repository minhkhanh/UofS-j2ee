<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="<c:url  value='/ckeditor/ckeditor.js'/>"></script>

<script>
	$(function() {
		$("#ngayHetHan").datetimepicker({
			minDate : 1
		});

		$("#formChiTietSP .hinhAnh").each(function(i) {
			if (i != 0) {
				$(this).hide();
			}
		});

		$("#themAnh").click(function() {
			$("#formChiTietSP .hinhAnh:hidden").first().show();
		});

		$('#formChiTietSP').submit(function() {
			//alert('asd');
			var result = true;
			var so = parseInt($('#giaKhoiDiem').val());

			if (so <= 0 || $('#giaKhoiDiem').val() == '') {
				$('#noteGiaKhoiDiem').html('Vui lòng nhập số dương');
				result = false;
				//alert('giaKhoiDiem: ' + result);
			}

			if ($('#ngayHetHan').val() == '') {
				$('#noteNgayHetHan').html('Vui lòng nhập ngày hết hạn');
				result = false;
				//alert('ngayHetHan: ' + result);
			}

			if ($('#tenSanPham').val() == '') {
				$('#noteTenSanPham').html('Vui lòng nhập tên sản phẩm');
				result = false;
				//alert('tenSanPham: ' + result);
			}

			if (result == true) {
				$('#noteGiaKhoiDiem').html('');
				$('#noteNgayHetHan').html('');
				$('#noteTenSanPham').html('');
			}

			return result;
		});

		CKEDITOR.replace('editor1');
	});
</script>

<div class="contentframe ui-widget-content ui-corner-all">
  <div class="captionbox ui-widget-header ui-corner-top">CUNG CẤP THÔNG TIN CHO SẢN PHẨM MỚI</div>
  <div class="content">
    <c:if test="${!empty actionFailure }">
      <jsp:include page="/jsp/component/CautionMessage.jsp">
        <jsp:param value="${actionFailure}" name="cautionMessage" />
      </jsp:include>
    </c:if>
    <form id="formChiTietSP" name="formChiTietSP" action="" method="POST"
      enctype="multipart/form-data">
      <table>
        <tr>
          <td><label for="tenSanPham">Tên sản phẩm:</label></td>
          <td><input type="text" name="tenSanPham" id="tenSanPham"></td>
          <td id="noteTenSanPham" class="notemsg"></td>
        </tr>
        <tr>
          <td><label for="moTaSanPham">Mô tả</label></td>
          <td><textarea id="editor1" name="moTaSanPham"></textarea></td>
        </tr>
        <tr>
          <td><label for="giaKhoiDiem">Giá khởi điểm</label></td>
          <td><input type="text" id="giaKhoiDiem" name="giaKhoiDiem"></td>
          <td id="noteGiaKhoiDiem" class="notemsg"></td>
        </tr>
        <tr>
          <td><label for="ngayHetHan">Ngày hết hạn:</label></td>
          <td><input readonly="readonly" type="text" name="ngayHetHan" id="ngayHetHan"></td>
          <td id="noteNgayHetHan" class="notemsg"></td>
        </tr>
        <tr>
          <td><label for="hinhAnh">Hình ảnh:</label></td>
          <td><input type="file" name="hinhAnh" class="hinhAnh"></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="file" name="hinhAnh" class="hinhAnh"></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="file" name="hinhAnh" class="hinhAnh"></td>
        </tr>
        <tr>
          <td><input type="button" id="themAnh" value="Thêm ảnh"></td>
          <td></td>
        </tr>
        <tr>
          <td><input type="submit" name="submitChiTietSP" value="Đăng sản phẩm"></td>
        </tr>
      </table>
    </form>
  </div>
</div>