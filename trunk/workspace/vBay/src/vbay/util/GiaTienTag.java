/**
 * 
 */
package vbay.util;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author tmkhanh
 *
 */
public class GiaTienTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6478592945573752781L;
	
	private int giaTien = 0;
	public void setValue(String str) {
		try {
			giaTien = Integer.parseInt(str);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	private String strUnit = "";
	public void setUnit(String str) {
		strUnit = str;
	}
	
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		try {
			out.println (String.format("%,d", giaTien) + " " + strUnit);
		} catch (IOException e) {
			e.printStackTrace();
		}	
		return SKIP_BODY;
	}
	
	@Override
	public int doEndTag() throws JspException {
		// TODO Auto-generated method stub
		return EVAL_PAGE;
	}
}
