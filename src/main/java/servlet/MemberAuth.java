package servlet;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import membership.MemberDAO;
import membership.MemberDTO;

public class MemberAuth extends HttpServlet {
	MemberDAO dao;
	
	@Override
	public void init() throws ServletException {
		
		/*this 는 프로젝트의 서블릿이라고 보면된다. 의미는 쉽게표현하자 서블릿안에서 web.xml을 찾아 c
		 * ontext정보를 이용하여 어플리케이션 객체를 생성한다.
		 *
		 * */
		ServletContext application = this.getServletContext();
		
		String driver = application.getInitParameter("OracleDriver");
		String connectUrl = application.getInitParameter("OracleURL");
		String oId =  application.getInitParameter("OracleId");
		String oPass = application.getInitParameter("OraclePwd");
		
		dao = new MemberDAO(driver, connectUrl, oId, oPass);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String admin_id = this.getInitParameter("admin_id");
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		MemberDTO  memberDTO =  dao.getMemberDTO(id, pass);
		
		String memberName = memberDTO.getName();
		if(memberName !=null) {
			req.setAttribute("authMessage", memberName + "회원님 방가방가");
		}else {
			if(admin_id.equals(id))
				req.setAttribute("authMessage", admin_id + "는 최고 관리자입니다");
			else
				req.setAttribute("authMessage","귀하는 회원이 아닙니다.");
		}
		req.getRequestDispatcher("/12Servlet/MemberAuth.jsp").forward(req, resp);		
	}
	@Override
	public void destroy() {
		dao.close();
	}
}