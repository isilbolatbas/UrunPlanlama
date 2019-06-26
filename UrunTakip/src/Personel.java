

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
 * Servlet implementation class Personel
 */
@WebServlet("/Personel")
public class Personel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Personel() {
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
	    	
	    	
	    	String adSoyad = request.getParameter("adSoyad");
	    	String telNo = request.getParameter("telNo");
	    	String gorev = request.getParameter("gorev");
	    	String maas = request.getParameter("maas"); 
	    	String calismaSaati = request.getParameter("calismaSaati");
	    	String tatilGunu = request.getParameter("tatilGunu");
	    	
	    	
	    	
	      Class.forName(driver).newInstance();  
	      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?autoReconnect=true&useSSL=false&relaxAutoCommit=true","root", "isiLcagdas");
	      PreparedStatement prep =(PreparedStatement) conn.prepareStatement("insert into mydb.personel( adSoyad, telNo,  gorev, maas, calismaSaati, tatilGunu) values(?,?,?,?,?,?)");//try2 is the name of the table  

	    
	     
	      prep.setString(1, adSoyad);
	      prep.setString(2, telNo);
	      prep.setString(3, gorev);
	      prep.setString(4, maas);
	      prep.setString(5,calismaSaati);
	      prep.setString(6, tatilGunu);


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
