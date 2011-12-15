/**
 * 
 */
package util;

import java.security.MessageDigest;

/**
 * @author RM
 * 
 */
public class SecurityHelper {

    /**
     * Encript password using given algorithm.
     * Refer from http://www.java-samples.com/showtutorial.php?tutorialid=618.
     * 
     * @param password unencripted password.
     * @param algorithm name of algorithm used to do encripting.
     * @return encripted password.
     */
    public static String encriptPassword(String password, String algorithm) {

        byte[] bytesPassword = password.getBytes();
        MessageDigest md = null;
        
        try {
            md = MessageDigest.getInstance(algorithm);
        } catch (Exception e) {
            e.printStackTrace();
            return password;
        }
        
        md.reset();
        md.update(bytesPassword);
        
        byte[] encriptedPassword = md.digest();
        
        StringBuffer buf = new StringBuffer();
        for (int i = 0; i < encriptedPassword.length; i++) {
            
            if (((int) encriptedPassword[i] & 0xff) < 0x10) {
                buf.append("0");
            }
            
            buf.append(Long.toString((int) encriptedPassword[i] & 0xff, 16));
        }
        
        return buf.toString();
    }
}
