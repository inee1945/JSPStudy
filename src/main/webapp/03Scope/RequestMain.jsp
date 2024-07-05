<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("requestString","request영역의 문자열");
	request.setAttribute("requestPerson",new Person("안중근",31) );
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>request영역의 속성값 삭제하기</h2>
	<%
	request.removeAttribute("requestString");
	request.removeAttribute("requestInteger");
	%>
	<h2>request영역의 속성값 읽기</h2>
	<%
	Person rPerson = (Person)(request.getAttribute("requestPerson"));
	%>
	<ul>
		<li>String 객체 : <%=request.getAttribute("requestString") %></li>
		<li>Person 객체 : <%= rPerson.getName() %>,<%=rPerson.getAge() %></li>
	</ul>
	<h2>포워드 된 페이지에서 request영역 속성값 읽기</h2>
 
	<%
	/*포워드는 현재페이지ㅇ로 들어온 오쳥을 다음페이지로 보내는 기능이다. 
	포워드 명령을 만나기 전까지 모든 내용은 버퍼에서 삭제 되고 포워드된페이지의 내용만 출력됨 */
	request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English")
	.forward(request,response);
	%>
</body>
</html>