/**
 * 
 */
package custom;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author RM
 *
 */
public class HtmlHeadTag extends TagSupport{
    private static final long serialVersionUID = 1L;
    
    private String title;
    
    @Override
    public int doStartTag() throws JspException {
        JspWriter out = this.pageContext.getOut();
        
        try {
            out.println ("<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />");
            out.println ("<title>" + title + "</title>");
            out.println ("<link href='style/main.css' rel='stylesheet' type='text/css' />");
            out.println ("<link href='style/sidewrap.css' rel='stylesheet' type='text/css' />");
            out.println ("<link href='style/mainwrap.css' rel='stylesheet' type='text/css' />");
            out.println ("<link href='style/header.css' rel='stylesheet' type='text/css' />");
            out.println ("<link href='style/userpanel.css' rel='stylesheet' type='text/css' />");
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return SKIP_BODY;
    }
    
    @Override
    public int doEndTag() throws JspException {
        return EVAL_PAGE;
    }
    
    @Override
    public void release() {
        title = null;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    
}
