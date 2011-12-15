<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.dao.DanhMucDAO"%>
<%@ page import="model.pojo.DanhMuc"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tld/CustomTagDescriptor"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="sidewrap">
    <div id="sidecontent">

        <div class="contentframe">
            <div class="captionbox">TÌM KIẾM NHANH</div>
            <div class="content">

                <form method="get" action="TrangTimKiemNhanh.do" name="frmTimNhanh">
                    <p>
                        <label for="tenTivi">Tên tivi</label> <br />                      
                        <input type="text" name="tenTivi" style="width: 100%" value="<c:out value="${param.tenTivi}" default=""/>" />
                    </p>
                    <p>              
                        <label for='maDanhMuc'>Danh mục</label> <br />          
                        <mytag:CategoryCombobox maDanhMuc="${param.maDanhMuc}" dsDanhMuc="${requestScope.dsDanhMuc}"/>
                    </p>
                    <input type="submit" value="Tìm kiếm" name="submitTimNhanh" />
                </form>
                <br /> <a href="TrangTimKiemNangCao.do" style="text-decoration: none"> &gt;&gt; Tìm kiếm nâng cao</a>

            </div>
        </div>

        <div class="contentframe">
            <div class="captionbox">DANH MỤC</div>
            <div class="content">

<%--                 <mytag:CategoryListBox dsDanhMuc="<%=dsDanhMuc %>" /> --%>

                <table width="100%" border="1" cellspacing="0" cellpadding="5">
                    <c:forEach var="danhMuc" items="${requestScope.dsDanhMuc}">
                        <tr>
                            <td width="5%"><img src="images/arrow4.gif" />
                            </td>
                            <td>
                                <a href="TrangTimKiemNhanh.do?maDanhMuc=${danhMuc.maDanhMuc}"><strong><c:out value="${danhMuc.tenDanhMuc}" /></strong>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
    <br />
</div>