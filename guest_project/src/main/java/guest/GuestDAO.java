package guest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GuestDAO {
	 final String JDBC_DRIVER = "org.h2.Driver";
	 final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";
	   
	   public Connection open() {
	      Connection conn = null;
	      try {
	         Class.forName(JDBC_DRIVER);
	         conn = DriverManager.getConnection(JDBC_URL,"jwbook", "1234");
	      } catch(Exception e) {e.printStackTrace();}
	      return conn;
	   }
	   
	   public List<Guest> getAll() throws Exception {
	      Connection conn = open();
	      List<Guest> guestList = new ArrayList<>();
	      
	      String sql = "select aid, name, email, PARSEDATETIME(date,'yyyy-MM-dd hh:mm:ss') as cdate, title from guest";
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      ResultSet rs = pstmt.executeQuery();
	      
	      try (conn; pstmt; rs) {
	          while (rs.next()) {
	             Guest n = new Guest();
	             n.setAid(rs.getInt("aid"));
	             n.setName(rs.getString("name"));
	             n.setEmail(rs.getString("email"));
	             n.setDate(rs.getString("cdate"));
	             n.setTitle(rs.getString("title"));
	             guestList.add(n);
	          }
	          return guestList;
	       }
	   }
	   
	   public Guest getGuest(int aid) throws SQLException {
	      Connection conn = open();
	      Guest n = new Guest();
	      String sql = "select aid, name, email, PARSEDATETIME(date,'yyyy-MM-dd hh:mm:ss')as cdate, title, content from guest where aid=?";
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      pstmt.setInt(1, aid);
	      ResultSet rs = pstmt.executeQuery();
	      rs.next();
	      
	      try (conn; pstmt; rs) {
	          n.setAid(rs.getInt("aid"));
	          n.setName(rs.getString("name"));
	          n.setEmail(rs.getString("email"));
	          n.setTitle(rs.getString("title"));
	          n.setDate(rs.getString("cdate"));
	          n.setContent(rs.getString("content"));
	          pstmt.executeQuery();
	          return n;
	       }
	   }
	   
	   public void addGuest(Guest n) throws Exception {
		   Connection conn = open();
		   String sql = "insert into guest(name,email,date,title,content) values(?,?,CURRENT_TIMESTAMP(),?,?)";
		   PreparedStatement pstmt = conn.prepareStatement(sql);
		   
		   try (conn; pstmt) {
		      pstmt.setString(1, n.getName());
		      pstmt.setString(2, n.getEmail());
		      pstmt.setString(3, n.getTitle());
		      pstmt.setString(4, n.getContent());
		      pstmt.executeUpdate();
		   }
		}
	   
	   public void delGuest(int aid) throws SQLException {
	      Connection conn = open();
	      String sql = "delete from guest where aid=?";
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      
	      try(conn; pstmt){
	         pstmt.setInt(1, aid);
	         if(pstmt.executeUpdate() == 0) {
	            throw new SQLException("DB에러");
	         }
	      }
	   }
	   
	   

}
