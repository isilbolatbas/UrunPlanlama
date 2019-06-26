

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
 * Servlet implementation class Paket
 */
@WebServlet("/Paket")
public class Paket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Paket() {
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
    	
    	
    	String jelatin = request.getParameter("jelatin");
    	String saydam = request.getParameter("saydam");
    	String opak = request.getParameter("opak");
    	String sert = request.getParameter("sert"); 
    	String aSinifi = request.getParameter("aSinifi"); 
    	
    	String jefiyat = request.getParameter("jefiyat"); 
    	String safiyat = request.getParameter("safiyat"); 
    	String opakfiyat = request.getParameter("opakfiyat"); 
    	String sefiyat= request.getParameter("sefiyat"); 
    	String aSifiyat = request.getParameter("aSifiyat"); 
    	
    	String jelatintoplam = request.getParameter("jelatintoplam");
    	String saydamtoplam = request.getParameter("saydamtoplam");
    	String opaktoplam = request.getParameter("opaktoplam");
    	String serttoplam = request.getParameter("serttoplam"); 
    	String aSinifitoplam = request.getParameter("aSinifitoplam"); 
    	
      Class.forName(driver).newInstance();  
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?autoReconnect=true&useSSL=false&relaxAutoCommit=true","root", "isiLcagdas");
      PreparedStatement prep =(PreparedStatement) conn.prepareStatement("insert into mydb.paket( jelatin, saydam,  opak, sert, aSinifi, jefiyat, safiyat, opakfiyat, sefiyat, aSifiyat, jelatintoplam, saydamtoplam, opaktoplam,serttoplam, aSinifitoplam ) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");//try2 is the name of the table  

    
     
      prep.setString(1, jelatin);
      prep.setString(2, saydam);
      prep.setString(3, opak);
      prep.setString(4, sert);
      prep.setString(5, aSinifi);
      
      prep.setString(6, jefiyat);
      prep.setString(7, safiyat);
      prep.setString(8, opakfiyat);
      prep.setString(9, sefiyat);
      prep.setString(10, aSifiyat);
      
      prep.setString(11, jelatintoplam);
      prep.setString(12, saydamtoplam);
      prep.setString(13, opaktoplam);
      prep.setString(14, serttoplam);
      prep.setString(15, aSinifitoplam);

      

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
