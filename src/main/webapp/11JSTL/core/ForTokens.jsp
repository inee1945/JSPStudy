<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String rgba = "Red, Green, Blue, Black";
%>
<h4>for Tokens</h4>
<c:forTokens items="<%=rgba %>" delims="," var="color">
	<div style="color:${color};">${color}</div> <br/>
</c:forTokens>

<%
StringTokenizer tokens = new StringTokenizer(rgba,",");
out.print("토큰수"+tokens.countTokens()+"<br>");
while(tokens.hasMoreTokens()){
	String to = tokens.nextToken();
	out.print(to);
}
%>
<h4>스플릿</h4>
<%
String[] colorArr = rgba.split(",");

for(String c : colorArr){
	out.print(c);
}
%>

</body>
</html>