package tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class TagCursoJsp extends SimpleTagSupport {

	@Override
	public void doTag() throws JspException, IOException {

		JspWriter escritaJsp = getJspContext().getOut();
		escritaJsp.print("Tag customizada!");


	}

}