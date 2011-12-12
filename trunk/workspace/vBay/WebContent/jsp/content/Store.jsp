<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="quickview">
  <div id="ending">
    <div class="contentframe ui-widget-content ui-corner-all">
      <div class="captionbox ui-widget-header ui-corner-top">Các phiên đấu giá sắp kết thúc</div>
      <div class="content">
        <ul class="vertlist">
          <li><a href="#">Đồng hồ điện tử 6 số của Vua Bảo Đại - $3000</a></li>
          <li><a href="#">Đồng hồ cát chạy pin AAA - $155</a></li>
          <li><a href="#">Đồng hồ đếm giờ mặt không số - $2000</a></li>
        </ul>
      </div>
    </div>
  </div>
  <div id="arival">
    <div class="contentframe ui-widget-content ui-corner-all">
      <div class="captionbox ui-widget-header ui-corner-top">Các sản phẩm mới đăng</div>
      <div class="content">
        <ul class="vertlist">
          <li><a href="#">Đồng hồ điện tử 6 số của Vua Bảo Đại - $3000</a></li>
          <li><a href="#">Đồng hồ cát chạy pin AAA - $155</a></li>
          <li><a href="#">Đồng hồ đếm giờ mặt không số - $2000</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<hr class="clearfloat" />
<div id="itemlist">
  <form name="formThongSoHienThi" method="get" action="#">
    <table width="100%" cellpadding="5" cellspacing="0">
      <tr>
        <td align="left">Trang <a href="#"><b>1</b> </a> <a href="#">2</a> <a href="#">3</a>
        </td>
        <td align="right" width="50%"><label for="soSPTrenTrang">Số sản phẩm trên trang
        </label> <select name="soSPTrenTrang" style="width: 20%" onchange="submit()">
            <option value="5" selected="selected">5</option>
            <option value="10">10</option>
            <option value="20">20</option>
            <option value="50">50</option>
          </select></td>
      <tr>
        <td width="50%"></td>
        <td align="right"><label for="kieuHienThi">Kiểu hiển thị </label> <select
            name="kieuHienThi" style="width: 20%" onchange="submit()">
            <option value="detail">Chi tiết</option>
            <option value="brief">Ngắn gọn</option>
            <option value="list">Danh sách</option>
          </select> <input type="hidden" name="maDanhMuc" value="" /> <input type="hidden" name="tenSanPham"
            value="" /> <input type="hidden" name="trangHienThi" value="1" /> <input type="hidden"
            name="soSPTrenTrangPrev" value="5" /></td>
      </tr>
    </table>
  </form>
  <br />
  <table width="100%" class="product_table" cellspacing="0" cellpadding="5">
    <tr>
      <td width="20%"><strong>Hình ảnh</strong></td>
      <td width="28%"><strong>Mô tả</strong></td>
      <td width="19%"><strong>Giá</strong></td>
      <td width="9%"><strong>Số lượng</strong></td>
      <td width="7%"><strong>Bids</strong></td>
      <td width="17%"><strong>Thời điểm kết thúc</strong></td>
    </tr>
    <tr>
      <td width="20%"><a href="#"><img width="150px" height="150px"
          src="<c:url value='res/image/homer_wall_clock.jpg'/>"> </a></td>
      <td width="28%">Đồng hồ vui nhộn</td>
      <td width="19%"><strong>VNĐ 100.000</strong></td>
      <td width="9%"><strong>1</strong></td>
      <td width="7%"><strong>0</strong></td>
      <td width="17%"><strong>22/12/2012</strong></td>
    </tr>
    <tr>
      <td width="20%"><a href="#"><img width="150px" height="150px"
          src="<c:url value='res/image/digital-blot-clock.jpg' />"> </a></td>
      <td width="28%">Đồng hồ giấy điện tử</td>
      <td width="19%"><strong>VNĐ 100.000</strong></td>
      <td width="9%"><strong>1</strong></td>
      <td width="7%"><strong>0</strong></td>
      <td width="17%"><strong>22/12/2012</strong></td>
    </tr>
  </table>
  <br />
  <table width="100%" cellpadding="5" cellspacing="0">
    <tr>
      <td align="left">Trang <a href="#"><b>1</b> </a> <a href="#">2</a> <a href="#">3</a>
      </td>
      <td align="right" width="50%"><label for="soSPTrenTrang">Số sản phẩm trên trang </label>
        <select name="soSPTrenTrang" style="width: 20%" onchange="submit()">
          <option value="5" selected="selected">5</option>
          <option value="10">10</option>
          <option value="20">20</option>
          <option value="50">50</option>
        </select></td>
    <tr>
      <td width="50%"></td>
      <td align="right"><label for="kieuHienThi">Kiểu hiển thị </label> <select
          name="kieuHienThi" style="width: 20%" onchange="submit()">
          <option value="detail">Chi tiết</option>
          <option value="brief">Ngắn gọn</option>
          <option value="list">Danh sách</option>
        </select> <input type="hidden" name="maDanhMuc" value="" /> <input type="hidden" name="tenSanPham"
          value="" /> <input type="hidden" name="trangHienThi" value="1" /> <input type="hidden"
          name="soSPTrenTrangPrev" value="5" /></td>
    </tr>
  </table>
</div>