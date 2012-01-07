<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="custag" uri="/WEB-INF/CustomTagLibrary"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/CustomTagLibrary" prefix="custag"%>

<script>
	function checkProduct(maSanPham) {
		$.post('${contextPath}/product/check', {
			maSanPham : maSanPham
		}, function(data) {
			if (data != '') {
				$('#giaHienTai').html(data);
			} else {
				location.reload();
			}
		});

		setTimeout('checkProduct(${sanPham.maSanPham})', 30000);
	}

	$(function() {
		$('#tabs').tabs();

		if ('${sanPham.tinhTrangSanPham.maTinhTrangSanPham}' == '1') {
			checkProduct('${sanPham.maSanPham}');
		}

		$('.ajaxDemoLink').click(function() {
			$.post('${contextPath}/Product.vby', {
				maMultimedia : $(this).attr('id')
			}, function(data) {
				$('#ajaxProductDemo').html(data);
			});

			return false;
		});

		var status = parseInt('${status}');
		if (status > 0) {
			$('#countdown').countdown({
				until : status,
				layout : '{dn} {dl}, {hn} {hl}, {mn} {ml}, và {sn} {sl}',
				onExpiry : function() {
					location.reload();
				}
			});
		}

		$('#dlgXacNhan').dialog({
			autoOpen : false,
			height : 300,
			width : 350,
			modal : true,
			buttons : {
				'Chấp nhận' : function() {

					$.post('${contextPath}/Product.vby', {
						maSanPham : '${sanPham.maSanPham}',
						giaDat : $('#giaDat').val()
					}, function(data) {
						$('#dlgKetQua').html(data);
						$('#dlgKetQua').dialog('open');
					});

					$(this).dialog('close');
				},
				'Thoát' : function() {
					$(this).dialog('close');
				}
			}
		});

		$('#dlgKetQua').dialog({
			autoOpen : false,
			height : 300,
			width : 350,
			modal : true,
			buttons : {
				'Thoát' : function() {
					$(this).dialog('close');

					location.reload();
				}
			}
		});

		$('#btnBid')
				.click(
						function() {
							var giaDat = parseInt($('#giaDat').val());
							var giaHienTai = parseInt('${sanPham.giaHienTai}'); // gia hien tai
							//alert(giaHienTai);
							//alert(giaDat);
							if (giaDat > giaHienTai) {
								$('#noteGiaDat').html('');
								$('#dlgXacNhan').html(
										'Bạn có chắc muốn đặt số tiền: '
												+ giaDat + ' không?');
								$('#dlgXacNhan').dialog('open');
							} else {
								$('#noteGiaDat')
										.html(
												'Xin vui lòng nhập một số lớn hơn giá hiện tại.');
							}
						});
	});
</script>

<div class="contentframe ui-widget-content ui-corner-all">
  <div class="captionbox ui-widget-header ui-corner-top">CHI TIẾT PHIÊN ĐẤU GIÁ</div>
  <div class="content">
    <h1>${sanPham.tenSanPham}</h1>
    Tình trạng:<b> <c:choose>
        <c:when test="${status > 0 }">
          <span id="countdown" style="display: inline"></span>
        </c:when>
        <c:when test="${status == -1 }">
        Đã có người mua.
      </c:when>
        <c:when test="${status == -2 }">
        Đã hết hạn.
      </c:when>
      </c:choose>
    </b>
    <p>
      Người bán: <a href="../TrangCuaHang.html">${sanPham.taiKhoan.tenTaiKhoan }</a>
    </p>

    <div id="auction_detail">
      <div class="clearfloat"></div>
      <div style="float: left; width: 45%">
        <div id="ajaxProductDemo">
          <custag:ShowMultimediaTag multimedia="${multimedia01 }" width="100%" height="300" />
        </div>
        <c:forEach var="multimedia" items="${sanPham.multimedias }" varStatus="varStatus">
          <a href="" class="ajaxDemoLink" id=${multimedia.maMultimedia }> <c:if
              test="${multimedia.loaiMultimedia.maLoaiMultimedia == 1}">
              <%--multimedia is an image --%>
            IMAGE
          </c:if> <c:if test="${multimedia.loaiMultimedia.maLoaiMultimedia == 2}">
              <%--multimedia is an Youtube video clip --%>
            CLIP
          </c:if>
          </a>
        </c:forEach>
      </div>
      <div style="float: right; width: 50%">
        <div id="dlgXacNhan" title="Xác nhận"></div>
        <div id="dlgKetQua" title="Kết quả"></div>
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
                <td id="giaHienTai" style="color: red;"><custag:GiaTienTag unit="VND"
                    value="${sanPham.giaHienTai }" /></td>
              </tr>
              <tr>
                <td><b>Bắt đầu:</b></td>
                <td>${sanPham.ngayDang }</td>
              </tr>
              <tr>
                <td><b>Kết thúc:</b></td>
                <td>${sanPham.ngayHetHan }</td>
              </tr>
              <c:if test="${status gt 0}">
                <c:choose>
                  <c:when test="${!empty sessionScope.taiKhoan }">
                    <tr>
                      <td><b>Giá của bạn:</b></td>
                      <td><input id="giaDat" type="text" /> VNĐ</td>
                      <td><input id="btnBid" type="button" value="Đặt ngay" /></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td colspan="2" id="noteGiaDat" style="color: red"></td>
                    </tr>
                  </c:when>
                  <c:otherwise>
                    <tr>
                      <td></td>
                      <td>Bạn hãy <b><a href="" class="lnkLogIn">Đăng nhập</a></b> để có thể
                        đặt giá!
                      </td>
                    </tr>
                  </c:otherwise>
                </c:choose>

              </c:if>
            </table>
          </div>
          <div id="tabs-2">
            <p>${sanPham.taiKhoan.tenTaiKhoan }</p>
          </div>
        </div>
      </div>
      <div class="clearfloat"></div>
    </div>
    <!-- AddThis Button BEGIN -->
    <div class="addthis_toolbox addthis_default_style ">
      <a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a
        class="addthis_button_tweet"></a> <a class="addthis_button_google_plusone"
        g:plusone:size="medium"></a> <a class="addthis_counter addthis_pill_style"></a>
    </div>
    <script type="text/javascript"
      src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4f06a9430466d80e"></script>
    <!-- AddThis Button END -->
    <p>Mô tả sản phẩm:</p>
    <p>${sanPham.moTaSanPham}</p>
  </div>
</div>