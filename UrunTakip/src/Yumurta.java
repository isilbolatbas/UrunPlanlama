

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
 * Servlet implementation class Yumurta
 */
@WebServlet("/Yumurta")
public class Yumurta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Yumurta() {
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
    	
    	
    	String aPlastik = request.getParameter("aPlastik");
    	String aOyuncak = request.getParameter("aOyuncak");
    	
    	String aPlastikFiyat = request.getParameter("aPlastikFiyat");
    	String aOyuncakFiyat = request.getParameter("aOyuncakFiyat");
    	
    	String plastikToplam = request.getParameter("plastikToplam");
    	String oyuncakToplam = request.getParameter("oyuncakToplam");
    	
    	
      Class.forName(driver).newInstance();  
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?autoReconnect=true&useSSL=false&relaxAutoCommit=true","root", "isiLcagdas");
      PreparedStatement prep =(PreparedStatement) conn.prepareStatement("insert into mydb.yumurta( aPlastik, aOyuncak,aPlastikFiyat, aOyuncakFiyat, plastikToplam, oyuncakToplam) values(?,?,?,?,?,?)");//try2 is the name of the table  

    
     
      prep.setString(1, aPlastik);
      prep.setString(2, aOyuncak);
      prep.setString(3, aPlastikFiyat);
      prep.setString(4, aOyuncakFiyat);
      prep.setString(5, plastikToplam);
      prep.setString(6, oyuncakToplam);
  ;


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
