<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%   
ArrayList<String> lists = new ArrayList<String>();
lists.add("리스트");
lists.add("컬렉션");
session.setAttribute("lists",lists);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session영역</title>
</head>
<body>
<h2>이동전</h2>

	<%
	ArrayList<String>lists2 = (ArrayList)session.getAttribute("lists");
	for(String str : lists2)out.print(str+"<br/>");
	
	%>

	<h2>페이지 이동 후 session영역의 속성 읽기</h2>
	<a href="SessionLocation.jsp">SessionLocation.jsp 바로가기</a>
</body>
</html>