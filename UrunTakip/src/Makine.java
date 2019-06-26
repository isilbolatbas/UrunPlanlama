

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
 * Servlet implementation class Makine
 */
@WebServlet("/Makine")
public class Makine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Makine() {
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
	    	
	    	
	    	String makineIsmi = request.getParameter("makineIsmi");
	    	String gunlukUrun = request.getParameter("gunlukUrun");
	    	String calismaSaati = request.getParameter("calismaSaati");
	    	String makineCalisani = request.getParameter("makineCalisani"); 
	    	
	      Class.forName(driver).newInstance();  
	      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?autoReconnect=true&useSSL=false&relaxAutoCommit=true","root", "isiLcagdas");
	      PreparedStatement prep =(PreparedStatement) conn.prepareStatement("insert into mydb.makine( makineIsmi, gunlukUrun,  calismaSaati, makineCalisani) values(?,?,?,?)");//try2 is the name of the table  

	    
	     
	      prep.setString(1, makineIsmi);
	      prep.setString(2, gunlukUrun);
	      prep.setString(3, calismaSaati);
	      prep.setString(4, makineCalisani);


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
