

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
 * Servlet implementation class IcMalzeme
 */
@WebServlet("/IcMalzeme")
public class IcMalzeme extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IcMalzeme() {
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
    	
    	
    	String un = request.getParameter("un");
    	String sut = request.getParameter("sut");
    	
    	
    	String yumurta = request.getParameter("yumurta");
    	
    	String yogurt = request.getParameter("yogurt");
    	String vanilya = request.getParameter("vanilya");
    	
    	
    	
    	String unFiyat = request.getParameter("unFiyat");
    	String sutFiyat = request.getParameter("sutFiyat");
    	String yumurtaFiyat = request.getParameter("yumurtaFiyat");
    	String yogurtFiyat = request.getParameter("yogurtFiyat");
    	String vanilyaFiyat = request.getParameter("vanilyaFiyat");
    	

    	String unToplam = request.getParameter("unToplam");

    	String sutToplam = request.getParameter("sutToplam");

    	String yumurtaToplam = request.getParameter("yumurtaToplam");

    	String yogurtToplam = request.getParameter("yogurtToplam");
    	String vanilyaToplam = request.getParameter("vanilyaToplam");

    	
    	
    	
      Class.forName(driver).newInstance();  
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?autoReconnect=true&useSSL=false&relaxAutoCommit=true","root", "isiLcagdas");
      PreparedStatement prep =(PreparedStatement) conn.prepareStatement("insert into mydb.icmalzeme( un, sut,yumurta,yogurt,vanilya,unFiyat,sutFiyat, yumurtaFiyat, yogurtFiyat, vanilyaFiyat, unToplam, sutToplam, yumurtaToplam, yogurtToplam, vanilyaToplam) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");//try2 is the name of the table  

    
     
      prep.setString(1, un);
      prep.setString(2, sut);
      prep.setString(3, yumurta);
      prep.setString(4, yogurt);
      prep.setString(5, vanilya);
      prep.setString(6, unFiyat);
      prep.setString(7, sutFiyat);
      prep.setString(8, yumurtaFiyat);
      prep.setString(9, yogurtFiyat);
      prep.setString(10, vanilyaFiyat);
      prep.setString(11, unToplam);
      prep.setString(12, sutToplam);
      prep.setString(13, yumurtaToplam);

      prep.setString(14, yogurtToplam);

      prep.setString(15, vanilyaToplam);


      

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
