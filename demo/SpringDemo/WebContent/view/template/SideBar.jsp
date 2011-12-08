<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
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
                    </p>
                    <input type="submit" value="Tìm kiếm" name="submitTimNhanh" />
                </form>
                <br /> <a href="TrangTimKiemNangCao.do" style="text-decoration: none"> &gt;&gt; Tìm kiếm nâng cao</a>

            </div>
        </div>

        <div class="contentframe">
            <div class="captionbox">DANH MỤC</div>
            <div class="content">

                <table>
                </table>
            </div>
        </div>
    </div>
    <br />
</div>