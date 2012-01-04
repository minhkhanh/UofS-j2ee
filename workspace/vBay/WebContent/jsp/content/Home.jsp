<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="contentframe ui-widget-content ui-corner-all">
  <div class="captionbox ui-widget-header ui-corner-top">XIN CHÀO</div>
  <div class="content">
    Các bạn đang ở trang web Đấu Giá Online.
    <br />
    <c:if test="${!empty nameAttr }">
      <h2>name = ${nameAttr }</h2>
    </c:if>
    <c:if test="${empty nameAttr }">
      <h2>Không có param name trong url</h2>
    </c:if>
  </div>
</div>

<div class="contentframe ui-widget-content ui-corner-all">
  <div class="captionbox ui-widget-header ui-corner-top">TEST AJAX TAGS</div>
  <div class="content"></div>
  <form id="formYoutubeUpload"
    action="${youtubePostUrl }?nexturl=http://localhost:8080/vBay/general/ytnext" method='POST'
    enctype="multipart/form-data">
    <input type="file" name="clip" />
    <input type="hidden" name="token" value="${youtubeToken}" />
    <input type="submit" value="Go" />
  </form>
  <div id="ajaxOut"></div>
</div>
<script type="text/javascript">
	$('#formYoutubeUpload')
			.ajaxForm(
					{
						beforeSubmit : function() {
// 							$('#ajaxOut').css({'display': 'inline'});
							$('#ajaxOut').html('<img src="${contextPath}/res/ajaxupload/loading.gif" />');
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
  <div class="captionbox ui-widget-header ui-corner-top">TEST AJAX TAGS</div>
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