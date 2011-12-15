package vbay.util;

import java.net.URL;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

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
                "vBay Online Auction",
                "AI39si5O7meRcD8iNB47ZI54S00Th_b0V8tB59U4jYNCqBO2y_5fQVJZMpezoxiwXUQzuYS3CJW5XM_w0_NYNosl_GSvCYB5vw");
        try {
            service.setUserCredentials("akhoi90@gmail.com", "pegasuscode0015");
        } catch (AuthenticationException e1) {
            e1.printStackTrace();
        }

        VideoEntry newEntry = new VideoEntry();

        YouTubeMediaGroup mg = newEntry.getOrCreateMediaGroup();
        mg.setTitle(new MediaTitle());
        mg.getTitle().setPlainTextContent("My Test Movie");
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
        }

        request.setAttribute("youtubePostUrl", token.getUrl());
        request.setAttribute("youtubeToken", token.getToken());
    }
}
