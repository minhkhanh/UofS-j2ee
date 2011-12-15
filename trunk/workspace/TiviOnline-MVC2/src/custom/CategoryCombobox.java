/**
 * 
 */
package custom;

import java.util.ArrayList;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import model.pojo.DanhMuc;

/**
 * @author RM
 *
 */
@SuppressWarnings("serial")
public class CategoryCombobox extends TagSupport {
    
    String maDanhMuc;
    ArrayList<DanhMuc> dsDanhMuc;
    String width = "100%";        // 100 percent

    @Override
    public int doStartTag() throws JspException {
        JspWriter out = this.pageContext.getOut();
        
        try {
            out.println ("<select name='maDanhMuc' style='width: " + width + "'>");
            out.println ("  <option value='' selected='selected'>Tất cả</option>");
            
            DanhMuc danhMuc = null;
            for (int i = 0; i < dsDanhMuc.size(); ++i) {
                danhMuc = dsDanhMuc.get(i);

                out.println("<option");
                if (maDanhMuc != null && danhMuc.getMaDanhMuc().equals(maDanhMuc)) {
                    out.println(" selected='selected'");
                }

                out.println(" value='" + danhMuc.getMaDanhMuc() + "'>" + danhMuc.getTenDanhMuc() + "</option>");
            }
            
            out.println("</select>");
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return SKIP_BODY;
    }
    
    @Override
    public int doEndTag() throws JspException {
        return EVAL_PAGE;
    }

    public void setDsDanhMuc(ArrayList<DanhMuc> dsDanhMuc) {
        this.dsDanhMuc = dsDanhMuc;
    }

    public void setMaDanhMuc(String maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
    }

    public void setWidth(String width) {
        this.width = width;
    }
}
