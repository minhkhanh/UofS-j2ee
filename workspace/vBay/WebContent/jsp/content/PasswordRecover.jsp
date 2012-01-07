<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="contentframe ui-widget-content ui-corner-all">
  <div class="captionbox ui-widget-header ui-corner-top">PHỤC HỒI MẬT KHẨU</div>
  <div class="content">
    <c:if test="${!empty actionFailure }">
      <jsp:include page="/jsp/component/CautionMessage.jsp">
        <jsp:param value="${actionFailure}" name="cautionMessage" />
      </jsp:include>
    </c:if>
    <p>Bạn hãy nhập thông tin vào dưới đây:</p>
    <form id="frmPwdRecover" action="" method="post">
      <table>
        <tr>
          <td><label for="tenTaiKhoan">Tên tài khoản</label></td>
          <td><input type="text" name="tenTaiKhoan" id="tenTaiKhoan"
              class="text ui-widget-content ui-corner-all" /></td>
        </tr>
        <tr>
          <td><label for="email">Hoặc email</label></td>
          <td><input type="text" name="email" id="email" value=""
              class="text ui-widget-content ui-corner-all" /></td>
        </tr>
        <tr>
          <td></td>
          <td><input type="submit" name="subRecover" value="Gửi yêu cầu" /></td>
        </tr>
      </table>
    </form>
  </div>
</div>