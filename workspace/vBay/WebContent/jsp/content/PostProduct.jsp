<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$("#ngayHetHan").datetimepicker({
			minDate : 1
		});

		$("form#formChiTietSP .hinhAnh").each(function(i) {
			if (i != 0) {
				$(this).hide();
			}
		});

		$("#themAnh").click(function() {
			$("form#formChiTietSP .hinhAnh:hidden").first().show();
		});
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
          <td><input type="text" name="tenSanPham"></td>
        </tr>
        <tr>
          <td><label for="moTaSanPham">Mô tả</label></td>
          <td><input type="text" name="moTaSanPham"></td>
        </tr>
        <tr>
          <td><label for="giaKhoiDiem">Giá khởi điểm</label></td>
          <td><input type="text" name="giaKhoiDiem"></td>
        </tr>
        <tr>
          <td><label for="ngayHetHan">Ngày hết hạn:</label></td>
          <td><input readonly="readonly" type="text" name="ngayHetHan" id="ngayHetHan"></td>
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
          <td></td>
          <td><input type="button" id="themAnh" value="Thêm ảnh"></td>
        </tr>
        <tr>
          <td><input type="submit" name="submitChiTietSP" value="Đăng sản phẩm"></td>
        </tr>
      </table>
    </form>
    <%--     <form id="formYoutubeUpload" action="${youtubePostUrl}?nexturl=" method="post" --%>
    <!--       enctype="multipart/form-data"> -->
    <!--       <input type="file" name="clip" /> -->
    <%--       <input type="hidden" name="token" value="${youtubeToken}" /> --%>
    <!--       <input type="submit" value="Go" /> -->
    <!--     </form> -->
    <!--     <script type="text/javascript"> -->
    <!-- // 					$("#formYoutubeUpload").attr( -->
    <!-- // 							"action", -->
    <!-- // 							$("#formYoutubeUpload").attr("action") -->
    <!-- // 									+ document.URL); -->
    <!-- 				</script> -->
  </div>
</div>