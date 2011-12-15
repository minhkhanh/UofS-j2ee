<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.pojo.KhachHang,model.pojo.PhanHe"%>
<%@ page import="model.dao.PhanHeDAO"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tld/CustomTagDescriptor"%>
<%@ page import="model.dao.TiviDAO"%>
<%@ page import="model.dao.DanhMucDAO"%>
<%@ page import="model.pojo.Tivi"%>
<%@ page import="model.pojo.DanhMuc"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tld/CustomTagDescriptor"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="script/main.js"></script>

<div class="contentframe">
    <div class="captionbox">TÌM KIẾM NÂNG CAO</div>
    <div class="content">
        <form name="frmTimKiemNangCao" onsubmit="return validateAdvSearch()" method="get" action="TrangTimKiemNangCao.do">
            <table class="info_table" width="100%" cellpadding="5" cellspacing="0">
                <tr>
                    <td width="15%"><label for="tenTivi">Tên tivi</label>
                    </td>
                    <td><input type="text" name="tenTivi" style="width: 200px"
                        value="${param.tenTivi}" />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>Giá từ</td>
                    <td><input type="text" name="giaMin" style="width: 200px" value="${param.giaMin}" /></td>
                    <td id="minprice_msg">                    
                    </td>
                </tr>
                <tr>
                    <td>Giá đến</td>
                    <td><input type="text" name="giaMax" style="width: 200px" value="${param.giaMax}" />
                    <td id="maxprice_msg">
                    </td>
                </tr>
                <tr>
                    <td>Danh mục</td>
                    <td width="200px">
                        <mytag:CategoryCombobox width="200px" maDanhMuc="${param.maDanhMuc}" dsDanhMuc="${requestScope.dsDanhMuc}"/>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input name="submitTimNangCao" type="submit" value="Tìm kiếm" /></td>
                    <td>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<div class="contentframe">
    <div class="captionbox">KẾT QUẢ TÌM KIẾM NÂNG CAO</div>
    <div class="content">
        <%@include file="SearchResult.jsp"%>
    </div>
</div>