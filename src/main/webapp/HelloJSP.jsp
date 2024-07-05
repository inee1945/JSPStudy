<%@page import="test.HelloJava"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    String str = "안녕하세요.";
    int result = HelloJava.myFn();
    %>
    
<!DOCTYPE html><html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>처음 만들어보는 JsP</h2>
	<%
	out.println(str + "jsp...!!!");
	%>
	<p>1부터 10까지의 합은 <%=result %>입니다.</p>
	
	<%=
	HelloJava.myFn(1, 100) %>

</body>
</html>