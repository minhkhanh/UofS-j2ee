<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$("#accordion").accordion();
	});
</script>

<div class="contentframe ui-widget-content ui-corner-all">
  <div class="captionbox ui-widget-header ui-corner-top">THÔNG TIN TÀI KHOẢN</div>
  <div id="accordion" class="content">
    <h3><a href="#">Thay đổi mật khẩu</a></h3>
    <div>
      <table>
        <tr>
          <td>Tên tài khoản</td>
          <td><input type="text" name="tenTaiKhoan" disabled="disabled"
              value="${sessionScope.taiKhoan.tenTaiKhoan}" /></td>
        </tr>
        <tr>
          <td>Mật khẩu cũ</td>
          <td><input type="password" name="matKhauCu" value="" /></td>
        </tr>
        <tr>
          <td>Mật khẩu mới</td>
          <td><input type="password" name="matKhauMoi" value="" /></td>
        </tr>
        <tr>
          <td>Xác nhận mật khẩu mới</td>
          <td><input type="password" name="matKhauMoi2" value="" /></td>
        </tr>
      </table>
    </div>
    <h3><a href="#">Thông tin liên lạc</a></h3>
    <div>
      <table>
        <tr>
          <td>Ảnh đại diện</td>
          <td><img width="128px" height="128px" alt="Ảnh đại diện"
            src="<c:url value='${taiKhoan.multimediaAvatar.linkURL }'/>"></td>
        </tr>
        <tr>
          <td>Họ tên</td>
          <td><input type="text" name="hoTen" value="${taiKhoan.thongTinTaiKhoan.hoTen }" /></td>
        </tr>
        <tr>
          <td>Email</td>
          <td><input type="text" name="email" value="${taiKhoan.email }" /></td>
        </tr>
        <tr>
          <td>Địa chỉ</td>
          <td><input type="text" name="diaChi" value="${taiKhoan.thongTinTaiKhoan.diaChi }" /></td>
        </tr>
        <tr>
          <td>Điện thoại liên lạc</td>
          <td><input type="text" name="soDienThoai"
              value="${taiKhoan.thongTinTaiKhoan.soDienThoai }" /></td>
        </tr>
        <tr>
          <td>Mã thẻ tín dụng</td>
          <td><input type="text" name="maTheTinDung"
              value="${taiKhoan.thongTinTaiKhoan.maTheTinDung }" /></td>
        </tr>
      </table>
    </div>
  </div>
</div>