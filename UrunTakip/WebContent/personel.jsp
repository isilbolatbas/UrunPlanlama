<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="http://localhost:8080/UrunTakip/40295178-neon-letter-u-blue-on-a-black-background.jpg" type="image/x-icon"/>
  <meta charset="utf-8">
        
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>urunn takip programi</title>
        <meta name="author" content="beril">
        <link rel="stylesheet" href="uruntakp.css">
        <link rel="stylesheet" href="table.css">

</head>
<body>

  <div align="center"><img src="logoo.jpg" alt="" width="250" height="125" />
       <div class="form2">
            <form action="Personel" method="POST"> 
            <table width="630" border="0">
                <tr>
                <td class="renk" width="180">Ad Soyad:</td>
                <td width="270"><input name="adSoyad" type="text"   /></td>
                <td width="180">&nbsp;</td>
                </tr>
                  <tr>
                <td class="renk" width="180">Tel No:</td>
                <td width="270"><input name="telNo" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                 <tr>
                <td class="renk" width="180">Gorev:</td>
                <td width="270"><input name="gorev" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                 <tr>
                <td class="renk" width="180">Maas:</td>
                <td width="270"><input name="maas" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                 <tr>
                <td class="renk" width="180">Calisma Saati:</td>
                <td width="270"><input name="calismaSaati" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
               
                 <tr>
                <td class="renk" width="180">Tatil Gunu:</td>
                <td width="270"><input name="tatilGunu" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                      <tr>
                <td>&nbsp;</td>
                <td><input class="btn"  type="submit" id="submit" value="Personel Ekle"/></td>
                <td>&nbsp;</td>
                </tr>
                
               
                  </table>
                  </form>
                </div>
                </div>
                
   <div align=center>             
      <form method="get">

<table class="style" border="2">
   <tr>
        <td>Ad Soyad</td>
        <td>Tel No</td>
        <td>Gorev</td>
        <td>Maas</td>
        <td>Calisma Saati</td>
        <td>Tatil Gunu</td>
        
        
   </tr>
   
   <%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/mydb";
       String username="root";
       String password="isiLcagdas";
       String query="select * from personel";
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
   %>
   
   			<p>
           <tr>
            <td><%out.println(rs.getString("adSoyad")); %></td>
          
           <td><%out.println(rs.getString("telNo")); %></td>
          
           <td><%out.println(rs.getString("gorev")); %></td>
           
           <td><%out.println(rs.getString("maas")); %></td>
           
           <td><%out.println(rs.getString("calismaSaati")); %></td>
           
           <td><%out.println(rs.getString("tatilGunu")); %></td>
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