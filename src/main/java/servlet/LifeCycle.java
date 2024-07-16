package servlet;

import java.io.IOException;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/12Servlet/LifeCycle.do")
public class LifeCycle extends HttpServlet {
	@PostConstruct
	public void myPostConstruct() {
		System.out.println("mypostconstruct호출");
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("init호출");
	}
	@Override
	protected void service(HttpServletRequest arg, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service()호출");
		super.service(arg, resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("do get호출");
		req.getRequestDispatcher("/12Servlet/LifeCycle.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("do post호출");
		req.getRequestDispatcher("/12Servlet/LifeCycle.jsp").forward(req, resp);
	}
	@Override
	public void destroy() {
		System.out.println("destry호출");
	}
	
	@PreDestroy
	public void myPreDestory() {
		System.out.println("mmyPreDestroy호출");

	}
	
}
