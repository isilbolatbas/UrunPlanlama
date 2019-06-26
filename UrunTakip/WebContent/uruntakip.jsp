<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost:8080/UrunTakip/40295178-neon-letter-u-blue-on-a-black-background.jpg" type="image/x-icon"/>
 <link rel="stylesheet" href="uruntakp.css">
  <link rel="stylesheet" href="mak.css">
  <link rel="stylesheet" href="table.css">

</head>
<body>

<div align="center"><img src="logoo.jpg" alt="" width="250" height="125" /></div>
        <div class="form1">
            <form action="UrunTakip" method="POST"> 
            <table width="630" border="0">
                <tr>
                <td class= "renk" width="180">stok kodu:</td>
                <td width="270"><input name="stokKodu" type="text"   /></td>
                <td width="180">&nbsp;</td>
                </tr>
                 <tr>
                <td class= "renk" width="180">barkod no:</td>
                <td width="270"><input name="barkodNo" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                 <tr>
                <td class= "renk" width="180">stok adi:</td>
                <td width="270"><input name="stokAdi" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                 <tr>
                <td class= "renk" width="180">miktar:</td>
                <td width="270"><input name="miktar" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                 <tr>
                <td class= "renk" width="180">birim:</td>
                <td width="270"><input name="birim" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                 <tr>
                <td class= "renk" width="180">fiyat:</td>
                <td width="270"><input name="fiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                 <tr>
                <td class= "renk" width="180">raf no:</td>
                <td width="270"><input name="rafNo" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                 <tr>
                <td class= "renk" width="180">aciklama:</td>
                <td width="270"><input name="aciklama" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                 <tr>
                <td>&nbsp;</td>
                <td><input class= "btn" type="submit" id="submit" value="ekle"/></td>
                <td>&nbsp;</td>
                </tr>
                
                
                </table>
            
            
            
            </form>

  <form method="get">

<table class= "style" border="2">
   <tr>
        <td>Stok Kodu</td>
        <td>Barkod No</td>
        <td>Stok Adi</td>
        <td>Miktar</td>
        <td>Birim</td>
        <td>Fiyat</td>
        <td>Raf No</td>
        <td class= "fiyat">Aciklama</td>
        
   </tr>
   <%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/mydb";
       String username="root";
       String password="isiLcagdas";
       String query="select * from urun";
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
   %>
   
   			<p>
           <tr><td><%out.println(rs.getString("stokKodu")); %></td>
           <td><%out.println(rs.getString("barkodNo")); %></td>
           <td><%out.println(rs.getString("StokAdi")); %></td>
           <td><%out.println(rs.getString("miktar")); %></td>
           <td><%out.println(rs.getString("birim")); %></td>
           <td><%out.println(rs.getString("fiyat")); %></td>
           <td><%out.println(rs.getString("rafNo")); %></td>
           <td class= "fiyat"><%out.println(rs.getString("aciklama")); %></td></tr>
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
<br>
<div class="form2">
<form method="get" action="http://localhost:8080/UrunTakip/readXML.jsp">
    <button class= "btn" type="submit">Dövize Git</button>
</form>
</div>
</div>
       
</body>
</html>