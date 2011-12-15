<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tld/CustomTagDescriptor"%>

<script type="text/javascript" src="script/main.js"></script>

<div class="contentframe">
    <div class="captionbox">CUNG CẤP THÔNG TIN CHO SẢN PHẨM MỚI</div>
    <div class="content">
        <form name="frmUpdate" action="" method="POST" enctype="multipart/form-data" onsubmit="return validateUpdate()">
            <table>
                <tr>
                    <td colspan="2">
                        <p>
                            <font color="#ff0000">${requestScope.resultMsg }</font>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td><label for="maTivi">Mã tivi:</label>
                    </td>
                    <td><input type="text" name="maTivi"></td>
                </tr>
                <tr>
                    <td><label for="tenTivi">Tên tivi:</label>
                    </td>
                    <td><input type="text" name="tenTivi"></td>
                </tr>
                <tr>
                    <td><label for="moTa">Mô tả</label></td>
                    <td><input type="text" name="moTa">
                    </td>
                </tr>
                <tr>
                    <td><label for="giaBan">Giá bán</label></td>
                    <td><input type="text" name="giaBan">
                    </td>
                    <td id="price_msg"></td>
                </tr>
                <tr>
                    <td><label for="soLuongTon">Số lượng tồn:</label></td>
                    <td><input type="text" name="soLuongTon">
                    </td>
                    <td id="quant_msg"></td>
                </tr>
                <tr>
                    <td><label for="kichThuoc">Kích thước:</label></td>
                    <td><input type="text" name="kichThuoc">
                    </td>
                </tr>
                <tr>
                    <td><label for="khuyenMai">Khuyến mãi</label></td>
                    <td><input type="text" name="khuyenMai">
                    </td>
                </tr>
                <tr>
                    <td><label for="xuatXu">Xuất xứ</label></td>
                    <td><input type="text" name="xuatXu">
                    </td>
                </tr>
                <tr>
                    <td><label for="maDanhMuc">Danh mục</label></td>
                    <td>
                    <mytag:CategoryCombobox maDanhMuc="${param.maDanhMuc}" dsDanhMuc="${requestScope.dsDanhMuc }"/>
                    </td>
                    <td id="cat_msg"></td>
                </tr>
                <tr>
                    <td><label for="hinhAnh">Hình ảnh:</label></td>
                    <td><input type="file" name="hinhAnh">
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="submitUpload" value="Thêm sản phẩm">
                    </td>
            </table>
        </form>
        <p>
            <font color="#ff0000">(Chưa xử lý hết các ngoại lệ có thể xảy ra.)</font>
        </p>
    </div>
</div>