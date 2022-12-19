package model2.mvcboard;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import java.io.File;

import fileupload.FileUtil;
import utils.JSFunction;


@WebServlet("/Write.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public WriteController() {
        super();  
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("./Write.jsp").forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String saveDirectory = request.getServletContext().getRealPath("/Uploads");
		int maxPostSize = 1024 * 1000;
		
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		
		if(mr == null) {
			JSFunction.alertLocation(response, "첨부 파일이 제한 용량을 초과합니다.", "Write.do");
			return;
		}
		
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setName(mr.getParameter("name"));
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		dto.setPass(mr.getParameter("pass"));
		
		String fileName = mr.getFilesystemName("ofile");
		if(fileName != null) {
			
			String ext = fileName.substring(fileName.lastIndexOf(".")); //파일 확장자
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String newFileName = now + ext;  //새로운 파일 이름("업로드일시.확장자")
			
			//3.파일명 변경
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
		}
		
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		
		if(result == 1) {
			response.sendRedirect("list.do");
		}else {
			response.sendRedirect("Write.do");
		}
		
		
		
	}

}
