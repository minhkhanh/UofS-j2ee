<%@page import="util.Const"%>
<%@page import="java.util.List"%>
<%@page import="model.pojo.KhachHang,model.pojo.DanhMuc"%>
<%@page import="model.dao.DanhMucDAO"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tld/CustomTagDescriptor"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<%!private List<DanhMuc> dsDanhMuc;

    public void jspInit() {
        dsDanhMuc = DanhMucDAO.layDSDanhMuc();
    }

    public void jspDestroy() {
        dsDanhMuc = null;
    }%>
<%
    request.setCharacterEncoding("UTF-8");
    request.setAttribute("dsDanhMuc", dsDanhMuc);
    
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<tiles:useAttribute name="title" classname="String" id="tilesTitle" />
<mytag:HtmlHeadTag title="<%=tilesTitle %>" />
</head>

<body>
    <div id="container">

        <tiles:insertAttribute name="userpanel" />

        <tiles:insertAttribute name="header" />

        <div id="wrap">
            <div class="clearfloat"></div>
            <tiles:insertAttribute name="sidebar" />
            <div id="mainwrap">
                <div id="maincontent">

                    <tiles:insertAttribute name="main" />

                </div>
            </div>
            <br class="clearfloat" />
        </div>

        <tiles:insertAttribute name="footer" />

    </div>

</body>
</html>