<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page  import="java.text.NumberFormat" %>
<%@ page  import="java.text.DecimalFormat" %>
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

  
     %> 



		
	
<div>
            <form action="Maliyet" method="POST">
            <fieldset>
            <legend><h1>Cikolata</h1></legend>
             <table width="630" border="0">
                <tr>
                <td class="renk" width="180">bitter:</td>
                <td width="270"><input name="bitter" type="text"/></td>
                <td width="180" class="renk">bitter fiyat:</td>
                <td width="270"><input name="bifiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                <tr>
                 <td width="180" class="renk">sutlu:</td>
                <td width="270"><input name="sutlu" type="text"/></td>
                <td width="180" class="renk">sutlu fiyat:</td>
                <td width="270"><input name="sutlufiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                <tr>
                <td width="180" class="renk">beyaz:</td>
                <td width="270"><input name="beyaz" type="text"/></td>
                 <td width="180" class="renk">beyaz fiyat:</td>
                <td width="270" class="renk"><input name="befiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                <tr>
                <td width="180" class="renk">karamel:</td>
                <td width="270"><input name="karamel" type="text"/></td>
                <td width="180" class="renk">karamel fiyat:</td>
                <td width="270"><input name="kafiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                <tr>
                <td width="200" class="renk">oreo:</td>
                <td width="300"><input name="oreo" type="text"/></td>
                <td width="200" class="renk">oreo fiyat:</td>
                <td width="300"><input name="ofiyat" type="text"/></td>
                <td width="200">&nbsp;</td>
                </tr>
                    <tr>
                <td>&nbsp;</td>
                <td><input class="btn" type="submit" id="submit" value="Cikolata Gonder"/></td>
                <td>&nbsp;</td>
                
                </tr>
                
                </table>
                
                </form>
                
                  <form method="get">

<table class="style"  border="2">
   <tr>
        <td>Bitter</td>
        <td>Sutlu</td>
        <td>Beyaz</td>
        <td>Karamel</td>
         <td>Oreo</td>
         <td>Bitter Fiyat</td>
        <td>Sutlu Fiyat</td>
        <td>Beyaz Fiyat</td>
        <td>Karamel Fiyat</td>
         <td>Oreo Fiyat</td>
         
         <td class="fiyat">Bitter</td>
        <td class="fiyat">Sutlu</td>
        <td class="fiyat">Beyaz</td>
        <td class="fiyat">Karamel</td>
         <td class="fiyat">Oreo</td>
          
        
        
   </tr>
   
   
   
   <%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/mydb";
       String username="root";
       String password="isiLcagdas";
       String query="select * from cikolata";
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
   %>
   
   			<p>
           <tr>
            <td><%out.println(rs.getString("bitter")); %></td>
          
           <td><%out.println(rs.getString("sutlu")); %></td>
          
           <td><%out.println(rs.getString("beyaz")); %></td>
           
           <td><%out.println(rs.getString("karamel")); %></td>
           <td><%out.println(rs.getString("oreo")); %></td>
           <td><%out.println(rs.getString("bifiyat")+"$"); %></td>
          
           <td><%out.println(rs.getString("sutlufiyat")+"$"); %></td>
          
           <td><%out.println(rs.getString("befiyat")+"$"); %></td>
           
           <td><%out.println(rs.getString("kafiyat")+"$"); %></td>
           <td><%out.println(rs.getString("ofiyat")+"$"); %></td>
           
           
          <td class="fiyat"><% out.println(Integer.parseInt(rs.getString("bitter"))*Integer.parseInt(rs.getString("bifiyat"))+"$"); %></td>
          
           <td class="fiyat"><%out.println(Integer.parseInt(rs.getString("sutlu"))*Integer.parseInt(rs.getString("sutlufiyat"))+ "$"); %></td>
          
           <td class="fiyat"><%out.println(Integer.parseInt(rs.getString("beyaz"))*Integer.parseInt(rs.getString("befiyat"))+ "$"); %></td>
           
           <td class="fiyat"><%out.println(Integer.parseInt(rs.getString("karamel"))*Integer.parseInt(rs.getString("kafiyat"))+"$"); %></td>
           
           
           <td class="fiyat"><%out.println(Integer.parseInt(rs.getString("oreo"))*Integer.parseInt(rs.getString("ofiyat"))+ "$"); %></td>
           
        
           
           
           
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
   <br>
   
   

   
   
   </fieldshet>
</form>
<div class="form2">
<form method="get" action="http://localhost:8080/UrunTakip/hesaplama.jsp">
    <button class="btn" type="submit">TL Olarak Gör</button>
</form>
<div class="form2">
<form method="get" action="http://localhost:8080/UrunTakip/readXML.jsp">
    <button class="btn" type="submit">Dövize Git</button>
</form>
</div>
</div>

</div>
</div>

<div>
            <form action="Paket" method="POST">
            <fieldset>
            <legend><h1>Paket</h1></legend>
             <table width="630" border="0">
                <tr>
                <td class="renk" width="180">Jelatin:</td>
                <td  width="270"><input name="jelatin" type="text"/></td>
                <td class="renk" width="180">jelatin fiyat:</td>
                <td width="270"><input name="jefiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                <tr>
                 <td class="renk" width="180">Saydam:</td>
                <td width="270"><input name="saydam" type="text"/></td>
                <td  class="renk" width="180">saydam fiyat:</td>
                <td width="270"><input name="safiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                <tr>
                <td class="renk" width="180">Opak:</td>
                <td width="270"><input name="opak" type="text"/></td>
                <td class="renk" width="180">opak fiyat:</td>
                <td width="270"><input name="opakfiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                <tr>
                <td class="renk" width="180">Sert:</td>
                <td width="270"><input name="sert" type="text"/></td>
                <td class="renk" width="180">sert fiyat:</td>
                <td width="270"><input name="sefiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                <tr>
                <td class="renk" width="180">A Sinifi:</td>
                <td width="270"><input name="aSinifi" type="text"/></td>
                <td class="renk" width="180">A sinifi fiyat:</td>
                <td width="270"><input name="aSifiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                    <tr>
                <td>&nbsp;</td>
                <td><input  class="btn" type="submit" id="submit" value="Paket Gonder"/></td>
                <td>&nbsp;</td>
                </tr>
                
                </table>
                
                </form>
                
                  <form method="get">

<table class="style" border="2">
   <tr>
        <td>Jelatin</td>
        <td>Saydam</td>
        <td>Opak</td>
        <td>Sert</td>
         <td>A Sinifi</td>
          <td>Jelatin fiyat</td>
        <td>Saydam fiyat</td>
        <td>Opak fiyat</td>
        <td>Sert fiyat</td>
         <td>A Sinifi fiyat</td>
         
         <td class="fiyat">Jelatin Toplam</td>
        <td class="fiyat">Saydam Toplam</td>
        <td class="fiyat">Opak Toplam</td>
        <td class="fiyat">Sert Toplam</td>
         <td class="fiyat">A Sinifi Toplam</td>
        
        
   </tr>
   <%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/mydb";
       String username="root";
       String password="isiLcagdas";
       String query="select * from paket";
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
   %>
   
   			<p>
           <tr>
            <td><%out.println(rs.getString("jelatin")); %></td>
          
           <td><%out.println(rs.getString("saydam")); %></td>
          
           <td><%out.println(rs.getString("opak")); %></td>
           
           <td><%out.println(rs.getString("sert")); %></td>
           <td><%out.println(rs.getString("aSinifi")); %></td>
           <td><%out.println(rs.getString("jefiyat")+"$"); %></td>
          
           <td><%out.println(rs.getString("safiyat")+"$"); %></td>
          
           <td><%out.println(rs.getString("opakfiyat")+"$"); %></td>
           
           <td><%out.println(rs.getString("sefiyat")+"$"); %></td>
           <td><%out.println(rs.getString("aSifiyat")+"$"); %></td>
           <td class="fiyat"><% out.println(Integer.parseInt(rs.getString("jelatin"))*Integer.parseInt(rs.getString("jefiyat"))+"$"); %></td>
          
           <td class="fiyat"><%out.println(Integer.parseInt(rs.getString("saydam"))*Integer.parseInt(rs.getString("sefiyat"))+"$"); %></td>
          
           <td class="fiyat"><%out.println(Integer.parseInt(rs.getString("opak"))*Integer.parseInt(rs.getString("opakfiyat"))+"$"); %></td>
           
           <td class="fiyat"><%out.println(Integer.parseInt(rs.getString("sert"))*Integer.parseInt(rs.getString("sefiyat"))+"$"); %></td>
           <td class="fiyat"><%out.println(Integer.parseInt(rs.getString("aSinifi"))*Integer.parseInt(rs.getString("aSifiyat"))+"$"); %></td></tr>
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
   
   </fieldshet>
</form>
<br>
<div class="form2">
<form method="get" action="http://localhost:8080/UrunTakip/hesaplamapaket.jsp">
    <button class="btn" type="submit">TL Olarak Gör</button>
    
</form>
<div class="form2">
<form method="get" action="http://localhost:8080/UrunTakip/readXML.jsp">
    <button class="btn" type="submit">Dövize Git</button>
</form>
</div>
</div>
</div>
<div>
            <form action="Yumurta" method="POST">
            <fieldset>
            <legend><h1>Yumurta:</h1></legend>
             <table width="630" border="0">
                <tr>
                <td class="renk" width="180">A Plastik:</td>
                <td width="270"><input name="aPlastik" type="text"/></td>
                <td class="renk"  width="180">A Plastik fiyat:</td>
                <td width="270"><input name="aPlastikFiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                <tr>
                 <td class="renk"  width="180">A Oyuncak:</td>
                <td width="270"><input name="aOyuncak" type="text"/></td>
                <td class="renk"  width="180">A Oyuncak fiyat:</td>
                <td width="270"><input name="aOyuncakFiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
               
                    <tr>
                <td>&nbsp;</td>
                <td><input class="btn"   type="submit" id="submit" value="Yumurta Gonder"/></td>
                <td>&nbsp;</td>
                </tr>
                
                </table>
                
                </form>
                 <form method="get">

<table class="style" border="2">
   <tr>
        <td>A Plastik</td>
        <td>A Oyuncak</td>
         <td>A Plastik Fiyati</td>
          <td>A Oyuncak Fiyati</td>
           <td class="fiyat" >A Oyuncak Toplam</td>
            <td class="fiyat" >A Oyuncak Toplam</td>
        
        
   </tr>
   <%
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/mydb";
       String username="root";
       String password="isiLcagdas";
       String query="select * from yumurta";
       Connection conn=DriverManager.getConnection(url, username, password);
       Statement stmt=conn.createStatement();
       ResultSet rs=stmt.executeQuery(query);
       while(rs.next())
       {
   %>
   
   			<p>
           <tr>
            <td><%out.println(rs.getString("aPlastik")); %></td>
          
           <td><%out.println(rs.getString("aOyuncak")); %></td>
           <td><%out.println(rs.getString("aPlastikFiyat")+"$"); %></td>
           <td><%out.println(rs.getString("aOyuncakFiyat")+"$"); %></td>
           <td class="fiyat" ><%out.println(Integer.parseInt(rs.getString("aPlastik"))*Integer.parseInt(rs.getString("aPlastikFiyat"))+"$"); %></td>
           <td class="fiyat" ><%out.println(Integer.parseInt(rs.getString("aOyuncak"))*Integer.parseInt(rs.getString("aOyuncakFiyat"))+"$"); %></td>
           
       
           
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
   
   </fieldshet>
</form>
<br>
<div class="form2">
<form method="get" action="http://localhost:8080/UrunTakip/hesaplamayumurta.jsp">
    <button class="btn" type="submit">TL Olarak Gör</button>
</form>
<div class="form2">
<form method="get" action="http://localhost:8080/UrunTakip/readXML.jsp">
    <button class="btn" type="submit">Dövize Git</button>
</form>
</div>
</div>
</div>



<div>
            <form action="IcMalzeme" method="POST">
            <fieldset>
            <legend><h1>Ic Malzemeler</h1></legend>
             <table width="630" border="0">
                <tr>
                <td class="renk"  width="180">Un:</td>
                <td width="270"><input name="un" type="text"/></td>
                 <td class="renk"  width="180">Un fiyat:</td>
                <td width="270"><input name="unFiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                <tr>
                 <td class="renk"  width="180">Sut:</td>
                <td width="270"><input name="sut" type="text"/></td>
                 <td class="renk"  width="180">Sut fiyat:</td>
                <td width="270"><input name="sutFiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
               
                <tr>
                <td class="renk"  width="180">Yumurta:</td>
                <td width="270"><input name="yumurta" type="text"/></td>
                 <td class="renk"  width="180">Yumurta fiyat:</td>
                <td width="270"><input name="yumurtaFiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                <tr>
                <td class="renk"  width="180">Yogurt:</td>
                <td width="270"><input name="yogurt" type="text"/></td>
                 <td class="renk"  width="180">Yogurt fiyat:</td>
                <td width="270"><input name="yogurtFiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
                <tr>
                <td class="renk"  width="180">Vanilya:</td>
                <td width="270"><input name="vanilya" type="text"/></td>
                 <td class="renk"  width="180">Vanilya fiyat:</td>
                <td width="270"><input name="vanilyaFiyat" type="text"/></td>
                <td width="180">&nbsp;</td>
                </tr>
               
                    <tr>
                <td>&nbsp;</td>
                <td><input class="btn"  type="submit" id="submit" value="Ic Malzeme Gonder"/></td>
                <td>&nbsp;</td>
                </tr>
                
                </table>
                
                </form>
                                 <form method="get">

<table class="style" border="2">
   <tr>
        <td>Un</td>
        <td>Sut</td>
        <td>Yumurta</td>
        <td>Yogurt</td>
        <td>Vanilya</td>
        <td>Un Fiyat</td>
        <td>Sut Fiyat</td>
        <td>Yumurta Fiyat </td>
        <td>Yogurt Fiyat</td>
        <td>Vanilya Fiyat</td>
        
        
        <td class="fiyat" >Vanilya Top</td>
        <td class="fiyat" >Vanilya Fiyat</td>
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
            <td><%out.println(rs.getString("un")); %></td>
          
          
          <td><%out.println(rs.getString("sut")); %></td>
     
          <td><%out.println(rs.getString("yumurta")); %></td>
          <td><%out.println(rs.getString("yogurt")); %></td> 
       
           <td><%out.println(rs.getString("vanilya")); %></td>
            <td><%out.println(rs.getString("unFiyat")+"$"); %></td>
             <td><%out.println(rs.getString("sutFiyat")+"$"); %></td>
              <td><%out.println(rs.getString("yumurtaFiyat")+"$"); %></td>
               <td><%out.println(rs.getString("yogurtFiyat")+"$"); %></td>
                <td><%out.println(rs.getString("vanilyaFiyat")+"$"); %></td>
                <td><% out.println(Integer.parseInt(rs.getString("un"))*Integer.parseInt(rs.getString("unFiyat"))+"$"); %></td>
          
           <td class="fiyat"><%out.println(Integer.parseInt(rs.getString("sut"))*Integer.parseInt(rs.getString("sutFiyat"))+"$"); %></td>
          
           <td class="fiyat"><%out.println(Integer.parseInt(rs.getString("yumurta"))*Integer.parseInt(rs.getString("yumurtaFiyat"))+"$"); %></td>
           
           <td class="fiyat"><%out.println(Integer.parseInt(rs.getString("yogurt"))*Integer.parseInt(rs.getString("yogurtFiyat"))+"$"); %></td>
           <td class="fiyat"><%out.println(Integer.parseInt(rs.getString("vanilya"))*Integer.parseInt(rs.getString("vanilyaFiyat"))+"$"); %></td>
           
          
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
   
   </fieldshet>
</form>
<br>
<div class="form2">
<form method="get" action="http://localhost:8080/UrunTakip/hesaplamaicmalzeme.jsp">
    <button class="btn" type="submit">TL Olarak Gör</button>
</form>
<div class="form2">
<form method="get" action="http://localhost:8080/UrunTakip/readXML.jsp">
    <button class="btn" type="submit">Dövize Git</button>
</form>
</div>
</div>
</div>
                
                
                


</body>
</html>