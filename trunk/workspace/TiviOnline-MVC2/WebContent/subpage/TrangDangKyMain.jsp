<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="script/main.js"></script>

<div class="contentframe">
    <div class="captionbox">ĐĂNG KÝ THÀNH VIÊN</div>
    <div class="content">
        <form name="frmDangKy" method="post" action="TrangDangKy.do" onsubmit="return validateRegistration()">
            <table width="100%" class="info_table" cellpadding="5" cellspacing="0">
                <tr>
                    <td colspan="3"><strong>Thông tin đăng nhập</strong></td>
                </tr>
                <tr>
                    <td width="28%" align="right"><label for="tenDangNhap">Tên đăng nhập</label>
                    </td>
                    <td width="27%"><input type="text" name="tenDangNhap" width="200px" />
                    </td>
                    <td width="45%" id="regname_msg"><font color="#FF0000">*</font>
                    </td>
                </tr>
                <tr>
                    <td align="right"><label for="matKhau">Mật khẩu</label>
                    </td>
                    <td><input type="password" name="matKhau" width="200px" />
                    </td>
                    <td id="regpwd_msg"><font color="#FF0000">*</font></td>
                </tr>
                <tr>
                    <td align="right"><label for="matKhau2">Nhập lại mật khẩu</label>
                    </td>
                    <td><input type="password" name="matKhau2" width="200px" />
                    </td>
                    <td id="regpwd2_msg"><font color="#FF0000">*</font></td>
                </tr>
                <tr>
                    <td colspan="3"><strong>Thông tin cá nhân</strong></td>
                </tr>
                <tr>
                    <td align="right"><label for="hoVaTen">Họ và tên</label>
                    </td>
                    <td><input type="text" name="hoVaTen" width="200px" />
                    </td>
                </tr>
                <tr>
                    <td align="right"><label for="email">Email</label>
                    </td>
                    <td><input type="text" name="email" width="200px" />
                    </td>
                </tr>
                <tr>
                    <td align="right"><label for="diaChi">Địa chỉ</label>
                    </td>
                    <td><input type="text" name="diaChi" width="200px" />
                    </td>
                </tr>
                <tr>
                    <td align="right"><label for="dienThoai">Điện thoại</label>
                    </td>
                    <td><input type="text" name="dienThoai" width="200px" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="submitDangKy" value="Đăng ký" />
                    </td>
                </tr>
                <tr>
                    <td id='regmsg' colspan='3'>
                        <c:if test="${requestScope.regMsg != null}">
                            <font color='#FF0000'>${requestScope.regMsg}</font>
                        </c:if>
                    </td>
                </tr>

            </table>
        </form>
    </div>
</div>