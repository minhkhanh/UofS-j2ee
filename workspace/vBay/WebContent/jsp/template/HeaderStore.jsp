<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value='/res/style/store.css'/>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>

<%-- <div id="toplogo">
  <img width="150px" height="150px" src='<c:url value='res/image/clockstore.jpg'/>' />
</div>
<div id="welcome">
  <p>
    <b>Chào mừng bạn đến với cửa hàng Đồng Hồ WHATEVER.</b>
  </p>
  <p>Chúng tôi chuyên bán đấu giá các loại đồng hồ cổ có xuất xứ từ Việt Nam và các nước trên
    Thế giới.</p>
</div> --%>
<style>
<!--

-->
</style>
    <div class="contentframe ui-corner-all">
      <div class="captionbox ui-widget-header ui-corner-top">
      	<span class="posttile">
      		Mô tả cửa hàng
      	</span>
      	<span class="postcontrols">
      		<a id="editpost"
      		class="editpost" rel="nofollow"> Sửa </a>
      	</span>
      </div>
      <div id="contentThongTinCuaHang">
		<!-- <p>This is some <strong>sample text</strong>. You are using <a href="http://ckeditor.com/">CKEditor</a>.</p>; -->
		${cuaHang.moTaCuaHang }
      </div>      
    </div>
<div id="dialog-form-editor" title="Sửa nội dung">
	<textarea id="editor1" name="editor1" ></textarea>
</div>    
<script type="text/javascript">
<!--
	$(document).ready(function(){		
		$( "#dialog-form-editor" ).dialog({
			autoOpen: false,
			height: 600,
			width: 800,
			modal: true,
			buttons: {
				"Lưu": function() {
					document.getElementById('contentThongTinCuaHang').innerHTML  =  CKEDITOR.instances['editor1'].getData(); //$('#editor1').val();
					CKEDITOR.instances['editor1'].destroy();
					$( this ).dialog( "close" );
				},
				"Hủy bỏ": function() {
					CKEDITOR.instances['editor1'].destroy();
					$( this ).dialog( "close" );
				}
			}
		}); 
	});
	$("#editpost").click(function(){
		$( "#dialog-form-editor" ).dialog( "open" );
		CKEDITOR.replace( 'editor1' );
		CKEDITOR.instances['editor1'].setData(document.getElementById('contentThongTinCuaHang').innerHTML);
	});
//-->
</script>