<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$('#frmLogIn').submit(function() {
			$('#frmLogIn #matKhau').val(MD5($('#frmLogIn #matKhau').val()));
			return true;
		});
	});
</script>

<div class="contentframe ui-widget-content ui-corner-all">
  <div class="captionbox ui-widget-header ui-corner-top">THÔNG TIN ĐĂNG NHẬP</div>
  <div class="content">
    <c:if test="${!empty actionFailure }">
      <jsp:include page="/jsp/component/CautionMessage.jsp">
        <jsp:param value="${actionFailure}" name="cautionMessage" />
      </jsp:include>
    </c:if>
    <form id="frmLogIn" action="<c:url value='/general/login' />" method="post">
      <table>
        <tr>
          <td><label for="tenTaiKhoan">Tên tài khoản</label></td>
          <td><input type="text" name="tenTaiKhoan" id="tenTaiKhoan"
              class="text ui-widget-content ui-corner-all" /></td>
        </tr>
        <tr>
          <td><label for="matKhau">Mật khẩu</label></td>
          <td><input type="password" name="matKhau" id="matKhau" value=""
              class="text ui-widget-content ui-corner-all" /></td>
        </tr>
        <tr>
          <td><input type="checkbox" name="ghiNho" id="ghiNho" /></td>
          <td align="left"><label for="ghiNho">Ghi nhớ</label></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="submit" name="submitLogIn" value="Đăng nhập" /></td>
        </tr>
      </table>
      <input type="hidden" name="returnUrl" value="${returnUrl}" />
    </form>
  </div>
</div>