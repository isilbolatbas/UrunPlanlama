<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import ="java.text.DecimalFormat" %>
<%@ page import ="java.text.NumberFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta charset="utf-8">


<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
	integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
	crossorigin="anonymous"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<meta name="author" content="beril">

<link rel="stylesheet" href="table.css">
<link rel="icon" href="iconfinder_letter_U_red_1553055.ico"
	type="image/x-icon" />
<link rel="shortcut icon" href="http://localhost:8080/UrunTakip/40295178-neon-letter-u-blue-on-a-black-background.jpg" type="image/x-icon"/>

</head>
<body>
<%@ page language="java"
	import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*"
	errorPage=""%>
<%
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
DocumentBuilder db = dbf.newDocumentBuilder();
Document doc = db.parse("http://www.tcmb.gov.tr/kurlar/today.xml");
NodeList node4= doc.getElementsByTagName("ForexBuying");

%>

  <% double dolar =Double.parseDouble(node4.item(0).getFirstChild().getNodeValue());
  NumberFormat nf = new DecimalFormat("#.##");


%> 


<table class="style"  border="2">
   <tr>
        	<td class="fiyat">Vanilya Top</td>
					<td class="fiyat">Vanilya Fiyat</td>
					<td class="fiyat">Vanilya Fiyat</td>
					<td class="fiyat">Vanilya Fiyat</td>
					<td class="fiyat">Vanilya Fiyat</td>

         
     
          
        
        
   </tr>
   
   
   
   <%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/mydb";
       String username="root";
       String password="isiLcagdas";
       String query="select * from icmalzeme";
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
   %>
   
   			<p>
           <tr>
              <td class="fiyat"><% out.println(nf.format(dolar*Integer.parseInt(rs.getString("un"))*Integer.parseInt(rs.getString("unFiyat")))+"$"); %></td>
          
           <td class="fiyat"><%out.println(nf.format(dolar*Integer.parseInt(rs.getString("sut"))*Integer.parseInt(rs.getString("sutFiyat")))+"$"); %></td>
          
           <td class="fiyat"><%out.println(nf.format(dolar*Integer.parseInt(rs.getString("yumurta"))*Integer.parseInt(rs.getString("yumurtaFiyat")))+"$"); %></td>
           
           <td class="fiyat"><%out.println(nf.format(dolar*Integer.parseInt(rs.getString("yogurt"))*Integer.parseInt(rs.getString("yogurtFiyat")))+"$"); %></td>
           <td class="fiyat"><%out.println(nf.format(dolar*Integer.parseInt(rs.getString("vanilya"))*Integer.parseInt(rs.getString("vanilyaFiyat")))+"$"); %></td>
           
           
           
           
           </tr>
           
        
           </p>
           
           
         
   <%
       }
   %>
   </table>
   <%
        rs.close();
        stmt.close();
        conn.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %>
   
  
</form>
</div>
</body>
</html>