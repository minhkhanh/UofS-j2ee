<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="script/main.js"></script>

<div class="contentframe">
    <div class="captionbox">ĐĂNG NHẬP</div>
    <div class="content">

        <form name="frmDangNhap" onsubmit="return validateLoggingIn()" method="post" action="TrangDangNhap.do">
            <table width="100%" cellpadding="5" cellspacing="0" class="info_table">
                <tr>
                    <td width="22%" align="right"><label for="tenDangNhap">Tên đăng nhập</label></td>
                    <td width="27%"><input type="text" name="tenDangNhap" width="200px" /></td>
                    <td width="51%" id="logname_msg"></td>
                </tr>
                <tr>
                    <td align="right"><label for="matKhau">Mật khẩu</label></td>
                    <td><input type="password" name="matKhau" width="200px" />
                    </td>
                    <td id="logpwd_msg"></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2"><input type="submit" name="submitDangNhap" value="Đăng nhập" /></td>
                </tr>
                <tr>
                    <td colspan='3' id='logmsg'>
                        <c:if test="${logMsg != null}">
                            <font color='#FF0000'><c:out value="${logMsg}" /> </font>
                        </c:if>
                    </td>
                </tr>
            </table>
        </form>

    </div>
</div>