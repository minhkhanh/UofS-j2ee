<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$('#accordion').accordion();

		$('#matKhauCu').change(
				function() {
					$.post('${contextPath}/Account.vby', {
						matKhauCu : $('#matKhauCu').val()
					}, function(data) {

						if (data == 'false') {
							$('#noteMatKhauCu').html(
									'Mật khẩu cũ nhập chưa chính xác');
						} else {
							$('#noteMatKhauCu').html('');
						}
					});
				});

		$('.matKhauMoi').change(
				function() {
					if ($('#matKhauMoi').val() != ''
							&& $('#matKhauMoi02').val() != ''
							&& $('#matKhauMoi').val() != $('#matKhauMoi02')
									.val()) {
						$('#noteMatKhauMoi').html(
								'Mật khẩu mới không trùng khớp.');
					} else {
						$('#noteMatKhauMoi').html('');
					}
				});

		$('#frmMatKhau').submit(
				function() {
					if ($('#noteMatKhauCu').html() != ''
							&& $('#noteMatKhauMoi').html() != ''
							&& ($('#matKhauCu').val() == ''
									|| $('#matKhauMoi').val() == '' || $(
									'#matKhauMoi02').val() == '')) {
						return false;
					}
				});

		$('#frmThongTinLienLac').submit(function() {
			var emailRegex = /(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})/;
			if (emailRegex.test($('#email').val()) == false) {
				$('#noteEmail').html('Vui lòng nhập email thật chính xác.');
				return false;
			}

			$('#noteEmail').html('');
		});
	});
</script>

<div class="contentframe ui-widget-content ui-corner-all">
  <div class="captionbox ui-widget-header ui-corner-top">THÔNG TIN TÀI KHOẢN</div>
  <div id="accordion" class="content">
    <h3>
      <a href="#">Thay đổi mật khẩu</a>
    </h3>
    <div>
      <form id="frmMatKhau" action="" method="post">
        <table>
          <tr>
            <td>Tên tài khoản</td>
            <td><input type="text" name="tenTaiKhoan" disabled="disabled"
                value="${sessionScope.taiKhoan.tenTaiKhoan}" /></td>
          </tr>
          <tr>
            <td>Mật khẩu cũ</td>
            <td><input type="password" id="matKhauCu" name="matKhauCu" value="" /></td>
            <td id="noteMatKhauCu" class="notemsg"></td>
          </tr>
          <tr>
            <td>Mật khẩu mới</td>
            <td><input type="password" class="matKhauMoi" name="matKhauMoi" id="matKhauMoi"
                value="" /></td>
          </tr>
          <tr>
            <td>Xác nhận mật khẩu mới</td>
            <td><input type="password" class="matKhauMoi" name="matKhauMoi02" id="matKhauMoi02"
                value="" /></td>
            <td id="noteMatKhauMoi" class="notemsg"></td>
          </tr>
          <tr>
            <td></td>
            <td><input type="submit" name="submit" value="Lưu" /></td>
          </tr>
        </table>
      </form>
    </div>
    <h3>
      <a href="#">Thông tin liên lạc</a>
    </h3>
    <div>
      <form id="frmThongTinLienLac" action="" method="post" enctype="multipart/form-data">
        <table>
          <tr>
            <td>Ảnh đại diện</td>
            <td width="128" height="128"><img width="128" height="128" alt="Ảnh đại diện"
              src="<c:url value='${taiKhoan.multimediaAvatar.linkURL }'/>"></td>
            <td><input type="file" name="anhDaiDien"></td>
          </tr>
          <tr>
            <td>Họ tên</td>
            <td><input type="text" name="hoTen" value="${taiKhoan.thongTinTaiKhoan.hoTen }" /></td>
          </tr>
          <tr>
            <td>Email</td>
            <td><input type="text" name="email" id="email" value="${taiKhoan.email }" /></td>
            <td id="noteEmail" class="noteMessage"></td>
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
          <tr>
            <td></td>
            <td><input type="submit" value="Lưu" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>