

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Hammade
 */
@WebServlet("/Hammade")
public class Hammade extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hammade() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("text/html");  
	        PrintWriter pw = response.getWriter(); 
	        //String connectionURL = "jdbc:mysql://127.0.0.1:3306/newData";// newData is the database  
	        //Connection connection;  
	        Connection conn=null;
	       
	        String driver="com.mysql.jdbc.Driver";
	    //String dbUserName="root";
	    //String dbPassword="root";

	    try{  
	    	
	    	
	    	String birim = request.getParameter("birim");
	    	String miktar = request.getParameter("miktar");
	    	String fiyat = request.getParameter("fiyat");
	    	String aciklama = request.getParameter("aciklama"); 
	    	
	      Class.forName(driver).newInstance();  
	      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?autoReconnect=true&useSSL=false&relaxAutoCommit=true","root", "isiLcagdas");
	      PreparedStatement prep =(PreparedStatement) conn.prepareStatement("insert into mydb.hammade( birim, miktar,  fiyat, aciklama) values(?,?,?,?)");//try2 is the name of the table  

	    
	     
	      prep.setString(1, birim);
	      prep.setString(2, miktar);
	      prep.setString(3, fiyat);
	      prep.setString(4, aciklama);


	      int i = prep.executeUpdate();
	      conn.commit(); 
	      String msg=" ";
	      if(i!=0){  
	        msg="Record has been inserted";
	        pw.println("<font size='6' color=blue>" + msg + "</font>");  


	      }  
	      else{  
	        msg="failed to insert the data";
	        pw.println("<font size='6' color=blue>" + msg + "</font>");
	       }  
	      prep.close();
	    }  
	    catch (Exception e){  
	      pw.println(e);  
	    }  

	}

}
