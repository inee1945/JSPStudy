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
	<c:set var="requestVar" value="MustHave" scope="request" />
	<c:import url="/11JSTL/inc/OtherPage.jsp" var= "content">
		<c:param name="user_param1" value="jsp" />
		<c:param name="user_param2" value="기본서"/>
	</c:import>
	
	<h4>다른문서 삽입하기</h4>
	${content }
	<h4>외부자원 삽입하기</h4>
	 <iframe src="../inc/GoldPage.jsp" style="width:100%;height:600px;"> 
		
	</iframe>
</body>
</html>