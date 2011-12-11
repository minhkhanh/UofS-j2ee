<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
		$("#dialog:ui-dialog").dialog("destroy");

		var tenTaiKhoan = $("#tenTaiKhoan"), matKhau = $("#matKhau"), allFields = $(
				[]).add(tenTaiKhoan).add(matKhau), tips = $(".validateTips");

		function updateTips(t) {
			tips.text(t).addClass("ui-state-highlight");
			setTimeout(function() {
				tips.removeClass("ui-state-highlight", 1500);
			}, 500);
		}

		function checkLength(o, n, min, max) {
			if (o.val().length > max || o.val().length < min) {
				o.addClass("ui-state-error");
				updateTips("Độ dài " + n + " bắt buộc từ " + min + " đến "
						+ max + " kí tự.");
				return false;
			} else {
				return true;
			}
		}

		function checkRegexp(o, regexp, n) {
			if (!(regexp.test(o.val()))) {
				o.addClass("ui-state-error");
				updateTips(n);
				return false;
			} else {
				return true;
			}
		}

		$("#dialog-form")
				.dialog(
						{
							autoOpen : false,
							height : 300,
							width : 350,
							modal : true,
							buttons : {
								"Đăng nhập" : function() {
									var bValid = true;
									allFields.removeClass("ui-state-error");

									bValid = bValid
											&& checkLength(tenTaiKhoan,
													"tên tài khoản", 3, 16);
									bValid = bValid
											&& checkLength(matKhau, "mật khẩu",
													5, 16);

									bValid = bValid
											&& checkRegexp(
													tenTaiKhoan,
													/^[a-z]([0-9a-z_])+$/i,
													"Tên tài khoản chỉ bao gồm các kí tự a-z, 0-9, gạch dưới, và bắt đầu bằng một chữ cái.");
									bValid = bValid
											&& checkRegexp(matKhau,
													/^([0-9a-zA-Z])+$/,
													"Mật khẩu chỉ cho phép các kí tự: a-z 0-9");

									if (bValid) {
										$("#dialog-form form").submit();
										$(this).dialog("close");
									}
								},
								Cancel : function() {
									$(this).dialog("close");
								}
							},
							close : function() {
								allFields.val("").removeClass("ui-state-error");
							}
						});

		$("#lnkDangNhap").click(function() {
			$("#dialog-form").dialog("open");
		});
	});
</script>

<div id="dialog-form" title="Thông tin đăng nhập">
  <p class="validateTips">Vui lòng nhập đủ thông tin.</p>

  <form method="post" action="<c:url value='/Home.vby' />">
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
    </table>
  </form>
</div>

<div id="homebutton">
  <a href="#"><img width="60" height="28" align="middle"
    src="<c:url value='res/image/minilogo.png'/>" /></a>
</div>
<c:choose>
  <c:when test="${!empty sessionScope.taiKhoan }">
    <div id="displayname">
      Chào, <a href="#">${sessionScope.taiKhoan.tenTaiKhoan }</a>
    </div>
    <div id="userlocations">
      <a href="<c:url value='/general/logout' />?returnUrl=<c:out value='${pageContext.servletConfig.servletName}' />">ĐĂNG XUẤT</a> <a href="#">HƯỚNG DẪN</a>
    </div>
  </c:when>
  <c:otherwise>
    <div id="userlocations">
      <a id="lnkDangNhap" href="#">ĐĂNG NHẬP</a> <a href="#">ĐĂNG KÝ</a> <a href="#">HƯỚNG DẪN</a>
    </div>
  </c:otherwise>
</c:choose>