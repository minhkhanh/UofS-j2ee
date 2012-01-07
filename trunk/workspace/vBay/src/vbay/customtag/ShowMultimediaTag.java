package vbay.customtag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import vbay.model.Multimedia;
import vbay.util.Utils;

@SuppressWarnings("serial")
public class ShowMultimediaTag extends TagSupport {
    
    private Multimedia multimedia;
    private String width;
    private String height;
    
    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public Multimedia getMultimedia() {
        return multimedia;
    }

    public void setMultimedia(Multimedia multimedia) {
        this.multimedia = multimedia;
    }

    @Override
    public int doStartTag() throws JspException {
        JspWriter out = this.pageContext.getOut();
        try {
            if (multimedia.getLoaiMultimedia().getMaLoaiMultimedia() == 1) {        // multimedia is a picture
                out.println("<img align='middle' src='" + Utils.createFullPath(pageContext.getServletContext(), multimedia.getLinkURL()) + "' />");
            } else if (multimedia.getLoaiMultimedia().getMaLoaiMultimedia() == 2) { // multimedia is a Youtube video clip
                out.println("<iframe width='" + width + "' height='" + height + "' src='http://www.youtube.com/embed/" + multimedia.getLinkURL() + "' frameborder='0' allowfullscreen></iframe>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }   
        return SKIP_BODY;
    }
    
    @Override
    public int doEndTag() throws JspException {
        return EVAL_PAGE;
    }
}
