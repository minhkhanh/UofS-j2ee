<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.pojo.PhanHe,model.pojo.Tivi,model.pojo.KhachHang"%>
<%@page import="model.dao.PhanHeDAO,model.dao.TiviDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tld/CustomTagDescriptor"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="contentframe">
    <div class="captionbox">KẾT QUẢ TÌM KIẾM NHANH</div>
    <div class="content">
        <%@include file="SearchResult.jsp"%>
    </div>
</div>