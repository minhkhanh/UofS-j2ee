<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value='/res/style/store.css'/>" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>

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
			        $.ajax({
			        	url: "./Store/capNhatMoTaCuaHang",
			        	type: "post",
			        	dataType: "text",
			        	data: CKEDITOR.instances['editor1'].getData(),
			      		success: function(data) {
			    			if (data == "true") {
			    				document.getElementById('contentThongTinCuaHang').innerHTML  =  CKEDITOR.instances['editor1'].getData();
								CKEDITOR.instances['editor1'].destroy();
			    			}
			    	    }
			    	});
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