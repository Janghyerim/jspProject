package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿의 컨트롤러 역할: 요청이 들어오면 그 요청을 파악하고 필요한 곳에 전달해주는 역할 


//애너테이션 표기법
//서블릿은 주소(URL)요청으로만 실행 가능하다.
//web.xml 정보추가 대신에 간단한 주소값 설정
@WebServlet("/HelloServlet") 
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HelloServlet() {
        super();
        
    }

//    doGet -> get
//    doPost-> post
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		PrintWriter out = response.getWriter();
//		out.println("<html>");
//		out.println("<body>");
//		out.println("<h1>Hello Servlet</h1>");
//		out.println("</body>");
//		out.println("</html>");
		//HTML코드를 직접 작성하지 않고 요청정보만 작성하여 넘겨주는 역할을 한다.
		request.setAttribute("message", "HelloServlet");
		//forward방식을 사용하여 request영역 객체를 가져오고 페이지 이동.
		request.getRequestDispatcher("HelloServlet.jsp").forward(request, response);
		                                  //뷰
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
