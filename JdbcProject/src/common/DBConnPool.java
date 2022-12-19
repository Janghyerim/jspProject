package common;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
   public Connection con;
   public Statement stmt;
   public PreparedStatement psmt;

   public DBConnPool() {
      try {
         // 커넥션 풀(Datasource) 얻기
         Context initCtx = new InitialContext();
         Context ctx = (Context) initCtx.lookup("java:comp/env");
         DataSource source = (DataSource) ctx.lookup("dbcp_myoracle");

         // 커넥션 풀을 통해 연결 얻기
         con = source.getConnection();         
         
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public void close() {
      try {
         if (con != null) {
            con.close();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
}