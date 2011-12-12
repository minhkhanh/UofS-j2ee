package vbay.util;

import javax.servlet.ServletContext;

public class Utils {
    public final static String ACTION = "action";
    public final static String ACT_LOGOUT = "dangXuat";
    
    public final static String SESS_ACC = "taiKhoan";
    public final static String SESS_ACTFAIL = "actionFailure";
    public final static String SESS_RETURL = "returnUrl";
    
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
        System.out.println(fullPath);
        
        return fullPath;
    }
}
