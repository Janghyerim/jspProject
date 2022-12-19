package common;

import java.sql.*;
import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	public JDBConnect() {  //첫번째생성자
		// 오라클에서도 xe가 아닌 orcl로 작성 함.
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, "scott", "tiger"); // DB주소 , 아이디 , 비번
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public JDBConnect(String driver, String url, String id, String pwd) {  //두번째생성자
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pwd); // DB주소 , 아이디 , 비번
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public JDBConnect(ServletContext application) {  //세번째생성자
		try {
			String driver = application.getInitParameter("OracleDriver");
			
			Class.forName(driver);
			
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			
			conn = DriverManager.getConnection(url, id, pwd); // DB주소 , 아이디 , 비번
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
