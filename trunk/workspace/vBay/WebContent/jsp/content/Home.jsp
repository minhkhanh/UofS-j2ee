<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="msg_slideshow" class="msg_slideshow"
	style="margin-bottom: 5px;">
	<div id="msg_wrapper" class="msg_wrapper"></div>
	<div id="msg_controls" class="msg_controls">
		<!-- right has to animate to 15px, default -110px -->
		<a href="#" id="msg_grid" class="msg_grid"></a> <a href="#"
			id="msg_prev" class="msg_prev"></a> <a href="#" id="msg_pause_play"
			class="msg_pause"></a>
		<!-- has to change to msg_play if paused-->
		<a href="#" id="msg_next" class="msg_next"></a>
	</div>
	<div id="msg_thumbs" class="msg_thumbs">
		<!-- top has to animate to 0px, default -230px -->
		<div class="msg_thumb_wrapper">
			<c:forEach var="hinhAnh" items="${listImageProducts }">
				<a href="#"><img src="<c:url value='${hinhAnh}'/>"
					alt="<c:url value='${hinhAnh}'/>" /></a>
			</c:forEach>
		</div>
		<a href="#" id="msg_thumb_next" class="msg_thumb_next"></a> <a
			href="#" id="msg_thumb_prev" class="msg_thumb_prev"></a> <a href="#"
			id="msg_thumb_close" class="msg_thumb_close"></a> <span
			class="msg_loading"></span>
	</div>
</div>

<div class="contentframe ui-widget-content ui-corner-all">
	<div class="captionbox ui-widget-header ui-corner-top">SẢN PHẨM
		MỚI</div>
	<div class="content" style="display: table;">
		<c:forEach var="sp" items="${newAuctions}" varStatus="i">
			<div class="thumbpitem">
				<div class="thumbpitem_img_con">
					<div class="thumbpitem_img_con_inner">
						<div class="thumbpitem_img">
							<a
								href="<c:url value="/Product.vby?maSanPham=${sp.maSanPham }"/>"><img
								width="118px" height="108px"
								src="<c:url value='${listImageNewAuctions.get(i.index)}'/>">
							</a>
						</div>
					</div>
				</div>
				<div
					style="float: left; margin-right: 5px; font-size: 9px; color: #cccccc">
					<em>Price:</em>
				</div>
				<div style="margin-right: 5px; font-size: 11px; color: #f92c0a">
					<b>${sp.giaHienTai} VNĐ</b>
				</div>
				<div
					style="float: left; margin-right: 5px; font-size: 9px; color: #cccccc">
					<em>Ngày hết hạn:</em>
				</div>
				<div style="margin-right: 5px; font-size: 11px; color: #f92c0a">
					<b>${sp.ngayHetHan}</b>
				</div>
				<div class="thumbpitem_title">
					<a href="#"><b>${sp.tenSanPham.toUpperCase()}</b></a>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<div class="contentframe ui-widget-content ui-corner-all">
	<div class="captionbox ui-widget-header ui-corner-top">SẢN PHẨM
		HOT</div>
	<div class="content" style="display: table;">
		<c:forEach var="sp" items="${hotAuctions}" varStatus="i">
			<div class="thumbpitem">
				<div class="thumbpitem_img_con">
					<div class="thumbpitem_img_con_inner">
						<div class="thumbpitem_img">
							<a
								href="<c:url value="/Product.vby?maSanPham=${sp.maSanPham }" />"><img
								width="118px" height="108px"
								src="<c:url value='${listImageHotAuctions.get(i.index)}'/>">
							</a>
						</div>
					</div>
				</div>
				<div
					style="float: left; margin-right: 2px; font-size: 9px; color: #cccccc">
					<em>Price:</em>
				</div>
				<div style="margin-right: 5px; font-size: 11px; color: #f92c0a">
					<b>${sp.giaHienTai} VNĐ</b>
				</div>
				<div
					style="float: left; margin-right: 5px; font-size: 9px; color: #cccccc">
					<em>Ngày hết hạn:</em>
				</div>
				<div style="margin-right: 5px; font-size: 11px; color: #f92c0a">
					<b>${sp.ngayHetHan}</b>
				</div>
				<div class="thumbpitem_title">
					<a href="#"><b>${sp.tenSanPham.toUpperCase()}</b></a>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<div class="contentframe ui-widget-content ui-corner-all">
	<div class="captionbox ui-widget-header ui-corner-top">SẢN PHẨM
		ĐÃ BÁN</div>
	<div class="content" style="display: table;">
		<c:forEach var="ct" items="${recentlySoldProducts}" varStatus="i">
			<div class="thumbpitem">
				<div class="thumbpitem_img_con">
					<div class="thumbpitem_img_con_inner">
						<div class="thumbpitem_img">
							<a
								href="<c:url value="/Product.vby?maSanPham=${sp.maSanPham }" />"><img
								width="118px" height="108px"
								src="<c:url value='${listImageRecentlySold.get(i.index)}'/>">
							</a>
						</div>
					</div>
				</div>
				<div
					style="float: left; margin-right: 5px; font-size: 16px; color: #f92c0a">
					<b><em>Selled:</em></b>
				</div>
				<div
					style="margin-right: 2px; margin-bottom: 10px; font-size: 16px; color: yellow;">
					<b>${ct.giaGiaoDich} VNĐ</b>
				</div>
				<div class="thumbpitem_title">
					<a href="#"><b>${ct.sanPham.tenSanPham.toUpperCase()}</b></a>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<div class="contentframe ui-widget-content ui-corner-all">
	<div class="captionbox ui-widget-header ui-corner-top">XIN CHÀO</div>
	<div class="content">
		Các bạn đang ở trang web Đấu Giá Online. <br />
		<c:if test="${!empty nameAttr }">
			<h2>name = ${nameAttr }</h2>
		</c:if>
		<c:if test="${empty nameAttr }">
			<h2>Không có param name trong url</h2>
		</c:if>
	</div>
</div>

<div class="contentframe ui-widget-content ui-corner-all">
	<div class="captionbox ui-widget-header ui-corner-top">TEST AJAX
		TAGS</div>
	<div class="content"></div>
	<form id="formYoutubeUpload"
		action="${youtubePostUrl }?nexturl=http://localhost:8080/vBay/general/ytnext"
		method='POST' enctype="multipart/form-data">
		<input type="file" name="clip" /> <input type="hidden" name="token"
			value="${youtubeToken}" /> <input type="submit" value="Go" />
	</form>
	<div id="ajaxOut"></div>
</div>
<script type="text/javascript">
	$('#formYoutubeUpload')
			.ajaxForm(
					{
						beforeSubmit : function() {
							// 							$('#ajaxOut').css({'display': 'inline'});
							$('#ajaxOut')
									.html(
											'<img src="${contextPath}/res/ajaxupload/loading.gif" />');
						},
						success : function(responseText, statusText, xhr, $form) {
							$('#ajaxOut')
									.html(
											'<iframe width="560" height="315" src="http://www.youtube.com/embed/' + responseText + '" frameborder="0" allowfullscreen></iframe>');
						},
						dataType : 'html'
					});
</script>

<div class="contentframe ui-widget-content ui-corner-all">
	<div class="captionbox ui-widget-header ui-corner-top">TEST AJAX
		TAGS</div>
	<div class="content"></div>
	<div id="file-uploader"></div>
</div>
<script type="text/javascript">
	var uploader = new qq.FileUploader(
			{
				element : document.getElementById('file-uploader'),
				action : '${youtubePostUrl}?nexturl=/vBay/Home.vby&token=${youtubeToken}',
				debug : true,
				onComplete : function(id, fileName, responseJSON) {
					alert('complete');
				}
			});
</script>