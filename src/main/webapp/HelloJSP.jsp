<%@page import="test.HelloJava"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    String str = "�ȳ��ϼ���.";
    int result = HelloJava.myFn();
    %>
    
<!DOCTYPE html><html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>ó�� ������ JsP</h2>
	<%
	out.println(str + "jsp...!!!");
	%>
	<p>1���� 10������ ���� <%=result %>�Դϴ�.</p>
	
	<%=
	HelloJava.myFn(1, 100) %>

</body>
</html>