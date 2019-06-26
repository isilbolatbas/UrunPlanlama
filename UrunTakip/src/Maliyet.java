

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
 * Servlet implementation class Maliyet
 */
@WebServlet("/Maliyet")
public class Maliyet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Maliyet() {
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
	    	
	    	
	    	String bitter = request.getParameter("bitter");
	    	
	    	
	    	String sutlu = request.getParameter("sutlu");
	    	String beyaz = request.getParameter("beyaz");
	    	String karamel = request.getParameter("karamel"); 
	    	String oreo = request.getParameter("oreo"); 

	    	String bifiyat = request.getParameter("bifiyat");
	    	String sutlufiyat = request.getParameter("sutlufiyat");
	    	String befiyat = request.getParameter("befiyat");
	    	String kafiyat = request.getParameter("kafiyat"); 
	    	String ofiyat = request.getParameter("ofiyat"); 
	    	
	    	String bittertoplam = request.getParameter("bittertoplam");
	    	String sutlutoplam = request.getParameter("sutlutoplam");
	    	String beyaztoplam = request.getParameter("beyaztoplam");
	    	String karameltoplam = request.getParameter("karameltoplam"); 
	    	String oreotoplam = request.getParameter("oreotoplam"); 
	    	
	    	
	    	
	      Class.forName(driver).newInstance();  
	      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?autoReconnect=true&useSSL=false&relaxAutoCommit=true","root", "isiLcagdas");
	      PreparedStatement prep =(PreparedStatement) conn.prepareStatement("insert into mydb.cikolata( bitter, sutlu,  beyaz, karamel, oreo,bifiyat,sutlufiyat,befiyat,kafiyat,ofiyat, bittertoplam, sutlutoplam, beyaztoplam, karameltoplam, oreotoplam) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");//try2 is the name of the table  

	    
	     
	      prep.setString(1, bitter);
	      prep.setString(2, sutlu);
	      prep.setString(3, beyaz);
	      prep.setString(4, karamel);
	      prep.setString(5, oreo);
	      prep.setString(6, bifiyat);
	      prep.setString(7, sutlufiyat);
	      prep.setString(8, befiyat);
	      prep.setString(9, kafiyat);
	      prep.setString(10, ofiyat);
	      
	      prep.setString(11, bittertoplam);
	      prep.setString(12, sutlutoplam);
	      prep.setString(13, beyaztoplam);
	      prep.setString(14, karameltoplam);
	      prep.setString(15, oreotoplam);


	      

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
