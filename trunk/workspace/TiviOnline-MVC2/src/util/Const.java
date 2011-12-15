/**
 * 
 */
package util;

/**
 * @author RM
 *
 */
public final class Const {
    
    public final static String HIBERCONFIG_FILE = "/config/tivionline.cfg.xml";
    public final static String PROP_FILE = "/app.properties";    
    public final static String PROP_DB_HOST = "host";
    public final static String PROP_DB_PORT = "port";    
    public final static String PROP_DB_SCHEMA = "schema";
    public final static String PROP_DB_USER  = "user";
    public final static String PROP_DB_PASS = "pass";
    public final static String PROP_DB_CHAR_ENCODING = "characterEncoding";
    
    public final static String ACTION = "action";
    public final static String ACT_LOGOUT = "dangXuat";
    public final static String ACT_PAGELOAD = "nap";
    public final static String ACT_DELROW = "xoaDong";
    public final static String ACT_CHECKOUT = "thanhToan";
    public final static String ACT_ADDCART = "datMua";
    
    public final static String SESS_CUSTOMER = "khachHang";
    public final static String SESS_CART = "gioHang";
    
    public final static String VIEW_HOME = "TrangChu.jsp";
    public final static String VIEW_LOGGING = "TrangDangNhap.jsp";
    public final static String VIEW_QUICKSEARCH = "TrangTimKiemNhanh.jsp";
    public final static String VIEW_ADVSEARCH = "TrangTimKiemNangCao.jsp";
    public final static String VIEW_REGISTRATION = "TrangDangKy.jsp";
    public final static String VIEW_CART = "TrangGioHang.jsp";
    public final static String VIEW_PRODUCTDETAIL = "TrangChiTietTivi.jsp";
    public final static String VIEW_HISTORY = "TrangLichSuMuaHang.jsp";
    public final static String VIEW_ORDERDETAIL = "TrangChiTietDonDatHang.jsp";
    public final static String VIEW_HOTTIVI = "TrangTiviBanChay.jsp";
    public final static String VIEW_ADDPRODUCT = "TrangThemTivi.jsp";
    public final static String VIEW_UPDATEPRODUCT = "TrangSuaTivi.jsp";
    
    public final static String CTRL_HOME = "TrangChu.do";
    public final static String CTRL_LOGIN = "TrangDangNhap.do";
    public final static String CTRL_QUICKSEARCH = "TrangTimKiemNhanh.do";
    public final static String CTRL_HOTTIVI = "TrangTiviBanChay.do";
    
    public final static String ROLE_USER = "User";
    public final static String ROLE_ADMIN = "Admin";
}
