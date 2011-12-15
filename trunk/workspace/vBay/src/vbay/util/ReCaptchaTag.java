/**
 * 
 */
package vbay.util;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import net.tanesha.recaptcha.ReCaptcha;
import net.tanesha.recaptcha.ReCaptchaFactory;

/**
 * @author tmkhanh
 *
 */
public class ReCaptchaTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6478592945573752781L;
	
	private String _publicKey = "";
	private String _privateKey = "";
	public void setPublicKey(String str) {
		_publicKey = str;
	}
	
	public void setPrivateKey(String str) {
		_privateKey = str; 
	}
	
	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		JspWriter out = this.pageContext.getOut();
        ReCaptcha c = ReCaptchaFactory.newReCaptcha(_publicKey, _privateKey, false);
        try {
			out.print(c.createRecaptchaHtml(null, null));
		} catch (IOException e) {
			// TODO Auto-generated catch block
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
