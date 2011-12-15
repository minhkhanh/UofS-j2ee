/**
 * 
 */
package util;

import org.hibernate.SessionFactory;
//import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

/**
 * 
 * 
 * @author RM
 */
public class HibernateUtil {
    // private static final SessionFactory sessionFactory;
    //
    // static {
    // try {
    // sessionFactory = new
    // AnnotationConfiguration().configure(Const.HIBERCONFIG_FILE).buildSessionFactory();
    // } catch (Throwable ex) {
    // // System.err.println("Initial SessionFactory creation failed." + ex);
    // ex.printStackTrace();
    // throw new ExceptionInInitializerError(ex);
    // }
    // }
    //
    // public static SessionFactory getSessionFactory() {
    // return sessionFactory;
    // }

    private static final SessionFactory sessionFactory = buildSessionFactory();

    private static SessionFactory buildSessionFactory() {
        try {
            // Create the SessionFactory from hibernate.cfg.xml
            return new Configuration().configure(Const.HIBERCONFIG_FILE).buildSessionFactory();
        } catch (Throwable ex) {
            // Make sure you log the exception, as it might be swallowed
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
