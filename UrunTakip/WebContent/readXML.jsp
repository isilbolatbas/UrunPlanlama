<%@ page contentType="text/html; charset=utf-8" language="java"
	import="javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.DocumentBuilder,org.w3c.dom.*"
	errorPage=""%>
<%
DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

DocumentBuilder db = dbf.newDocumentBuilder();

Document doc = db.parse("http://www.tcmb.gov.tr/kurlar/today.xml");

NodeList nodel= doc.getElementsByTagName("Unit");
NodeList node2= doc.getElementsByTagName("Isim");
NodeList node3= doc.getElementsByTagName("CurrencyName");
NodeList node4= doc.getElementsByTagName("ForexBuying");
NodeList node5= doc.getElementsByTagName("ForexSelling");
NodeList node6= doc.getElementsByTagName("BanknoteBuying");
NodeList node7= doc.getElementsByTagName("BanknoteSelling");

%>

<html>
<head>
<title>Read Xml Data</title>
<link rel="shortcut icon" href="http://localhost:8080/UrunTakip/40295178-neon-letter-u-blue-on-a-black-background.jpg" type="image/x-icon"/>
  <link rel="stylesheet" href="table.css">
</head>

<body>
	<table class="style" border="1">
	   <tr>
        <td class="fiyat">Birim</td>
        <td class="fiyat">Isim</td>
        <td class="fiyat">Para Birimi Adı</td>
        <td class="fiyat">Döviz Alis</td>
        <td class="fiyat">Döviz Satis</td>
        <td class="fiyat">Bank Note Alis</td>
        <td class="fiyat">Bank Note Satis</td>
        
        
   </tr>
		<%
int i;
for(i=0;i<8;i++)
{
%>

		<tr>
		<td><%= nodel.item(i).getFirstChild().getNodeValue() %></td>
		<td><%= node2.item(i).getFirstChild().getNodeValue() %></td>
		<td><%= node3.item(i).getFirstChild().getNodeValue() %></td>
		<td class="fiyat"><%= node4.item(i).getFirstChild().getNodeValue() %></td>
		<td class="fiyat"><%= node5.item(i).getFirstChild().getNodeValue() %></td>
		<td><%= node6.item(i).getFirstChild().getNodeValue() %></td>
		<td><%= node7.item(i).getFirstChild().getNodeValue() %></td>
		
		</tr>
		<%
}
%>
	</table>
</body>
</html>