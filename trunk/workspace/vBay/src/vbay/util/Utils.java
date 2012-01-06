package vbay.util;

import java.net.URL;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gdata.client.youtube.YouTubeService;
import com.google.gdata.data.media.mediarss.MediaCategory;
import com.google.gdata.data.media.mediarss.MediaDescription;
import com.google.gdata.data.media.mediarss.MediaKeywords;
import com.google.gdata.data.media.mediarss.MediaTitle;
import com.google.gdata.data.youtube.FormUploadToken;
import com.google.gdata.data.youtube.VideoEntry;
import com.google.gdata.data.youtube.YouTubeMediaGroup;
import com.google.gdata.data.youtube.YouTubeNamespace;
import com.google.gdata.util.AuthenticationException;

public class Utils {
    public final static String ACTION = "action";
    public final static String ACT_LOGOUT = "dangXuat";

    public final static String SESS_ACC = "taiKhoan";
    public final static String SESS_ACTFAIL = "actionFailure";
    public final static String SESS_RETURL = "returnUrl";
    
    public final static String SESATT_ACCNAME = "tenTaiKhoan";
    public final static String SESATT_PASSW = "matKhau";
    
    public final static String REQATT_CATLIST = "dsLoaiSanPham";
    
    public final static Cookie createCookie(String name, String value, String path, int maxAge) {
        Cookie cookie = new Cookie(name, value);
        cookie.setPath(path);
        cookie.setMaxAge(maxAge);
        
        return cookie;
    }
    
    public final static void removeLoggingCookie(Cookie[] cookies, HttpServletResponse response) {
        Cookie cookie = new Cookie(Utils.SESATT_ACCNAME, "");
        cookie.setPath("/");
        cookie.setMaxAge(0);// delete this cookie
        response.addCookie(cookie);
        
        cookie = new Cookie(Utils.SESATT_PASSW, "");
        cookie.setPath("/");
        cookie.setMaxAge(0);// delete this cookie
        
        response.addCookie(cookie);
        
        System.out.println("logging cookie removed ");
    }

    public final static void removeTransferAttributes(HttpSession session) {
        session.removeAttribute(Utils.SESS_ACTFAIL);
        session.removeAttribute(Utils.SESS_RETURL);
    }

    public final static String getMapPath(ServletContext context, String fullPath) {
        String contextPath = context.getContextPath();
        int pos = fullPath.indexOf(contextPath);
        if (pos == -1) {
            return fullPath;
        }
        String mapPath = fullPath.substring(pos + contextPath.length());
        System.out.println("mapping path: " + mapPath);
        return mapPath;
    }

    public final static String createFullPath(ServletContext context, String mapPath) {
        String fullPath = context.getContextPath() + mapPath;
        System.out.println("full path: " + fullPath);

        return fullPath;
    }

    public final static void handleYoutubeUpload(HttpServletRequest request) {
        YouTubeService service = new YouTubeService(
                "vBay Net",
                "AI39si7u0BLRK59lnIi2MESQmy1mRprksnenwhOIvwKrl1eKrxo_GlEx5Yqj4MLc_L_kJ0JOwtTzYVE05B7zmoeOjRt_NRIahg");
        try {
            service.setUserCredentials("vbaynet@gmail.com", "ak127601");
        } catch (AuthenticationException e1) {
            e1.printStackTrace();
            return;
        }

        VideoEntry newEntry = new VideoEntry();

        YouTubeMediaGroup mg = newEntry.getOrCreateMediaGroup();
        mg.setTitle(new MediaTitle());
        mg.getTitle().setPlainTextContent("My Test Movie -3");
        mg.addCategory(new MediaCategory(YouTubeNamespace.CATEGORY_SCHEME, "Autos"));
        mg.setKeywords(new MediaKeywords());
        mg.getKeywords().addKeyword("cars");
        mg.getKeywords().addKeyword("funny");
        mg.setDescription(new MediaDescription());
        mg.getDescription().setPlainTextContent("My description");
        mg.setPrivate(false);
        mg.addCategory(new MediaCategory(YouTubeNamespace.DEVELOPER_TAG_SCHEME, "mydevtag"));
        mg.addCategory(new MediaCategory(YouTubeNamespace.DEVELOPER_TAG_SCHEME, "anotherdevtag"));

        // newEntry.setGeoCoordinates(new GeoRssWhere(37.0,-122.0));
        // alternatively, one could specify just a descriptive string
        // newEntry.setLocation("Mountain View, CA");

        FormUploadToken token = null;
        try {
            URL uploadUrl = new URL("http://gdata.youtube.com/action/GetUploadToken");
            token = service.getFormUploadToken(uploadUrl, newEntry);
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }

        request.setAttribute("youtubePostUrl", token.getUrl());
        request.setAttribute("youtubeToken", token.getToken());
    }
    
    
    
    /// Code by TMK 
	public final static String RECAPTCHA_PUBLIC_KEY = "6Ldnp8gSAAAAACWq30BgevqwCrYiVGK-sKh3_hKT";
	public final static String RECAPTCHA_PRIVATE_KEY = "6Ldnp8gSAAAAAFKglqGXBjxa9D1lhsESqgJNvPLb";
}
