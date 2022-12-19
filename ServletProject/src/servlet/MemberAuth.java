package servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;


@WebServlet(urlPatterns = {"/MemberAuth.mvc"},
initParams = {@WebInitParam(name="admin_id", value="nakja")})
public class MemberAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberDAO dao;  //메소드에 쓸 변수 선언
       
    public MemberAuth() {
        super();
        
    }

	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		//web.xml의 context-param의 정보를 받아옴
		 String driver = application.getInitParameter("OracleDriver");
	     String connectUrl = application.getInitParameter("OracleURL");
	     String oId = application.getInitParameter("OracleId");
	     String oPass = application.getInitParameter("OraclePwd");

		dao = new MemberDAO(driver, connectUrl, oId, oPass); //MemberDAO에 회원정보 넣을 객체 생성 및 초기화
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//서블릿 초기화 매개변수에서 관리자 ID받기
		String admin_id = this.getInitParameter("admin_id"); //초기화되어진 name속성 가져오기 (name="admin_id")
		
		//인증을 요청한 Id/PassWord
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		//회원 테이블에서 인증요청한 Id/PassWord에 해당하는 회원 찾기
		MemberDTO memberDTO = dao.getMemberDTO(id, pass);
		
		//찾은 회원의 이름에 따른 처리
		String memberName = memberDTO.getName();
		if(memberName != null) { //일치하는 회원을 찾으면..
			request.setAttribute("authMessage", memberName + "회원님 안녕하세요^^*");
		}else {  //일치하는 회원 없으면..
			if(admin_id.equals(id)) //관리자
				request.setAttribute("authMessage", admin_id + "는 최고 관리자 입니다.");
			else  //비회원
				request.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
		}
		request.getRequestDispatcher("./MemberAuth.jsp").forward(request, response);
	}
	
	public void destroy() {
		dao.close();
	}
}
