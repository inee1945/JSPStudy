<%@page import="common.Person"%>
<%@page import="java.time.Period"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>포워드로 전달된 페이지</h2>
	<h4>RequestMain 파일의 리퀘스트 영역 속성 읽기</h4>
	<%
	Person pPerson = (Person)(request.getAttribute("requestPerson"));
	%>
	<ul>
		<li>String 객체 : <%=request.getAttribute("requestString") %></li>
		<li>Person 객체 : <%=pPerson.getName()  %>,<%=pPerson.getAge() %></li>	
	</ul>
	<h4>매개변수로 전달된 값 출력하기</h4>
	<%
		/* request.setCharacterEncoding("UTF-8"); 한글깨짐방지*/
	out.println(request.getParameter("paramHan"));
	out.println(request.getParameter("paramEng"));
	%>
</body>
</html>