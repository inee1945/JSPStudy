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
	<c:set var="number" value = "97" />
	<c:set var = "string" value = "jsp" />
	
	<h4>jstl의if 태그로 짝수홀수 판단하기</h4>
	<c:if test = "${pageScope.number mod 2 eq 0 }" var = "result">
	${number  }는 짝수입니다. <br/>
	</c:if>
	result : ${result }<br />
	
	<h4>문자열 비교와 else 구문 흉내내기 </h4>
	<c:if test = "${string eq 'Java' }" var = "result2">
	문자열은 java입니다. <br />
	</c:if>
	<c:if test = "${not result2 }" >
	 java가 아닙니다. <br />
	</c:if>
	
	<h4>조건식 주의사항 </h4>
	<c:if test= "100" var = "result3">
		EL이 아닌 정수를 지정ㅎ면 false
	</c:if>
	result3 : ${result3 }<br />
	<c:if test= "tRuE" var = "result4">
		EL이 아닌 tRuE 지정ㅎ면 false
	</c:if>
		result4 : ${result4 }<br />
	<c:if test= "${true} " var = "result5">
		EL이 아닌 정수를 지정ㅎ면 false
	</c:if>
		result5 : ${result5 }<br />
		
		   <h4>연습문제 : if태그</h4>
    <!--  
    아이디, 패스워드를 입력후 submit버튼을 누르면 EL식을 통해 파라미터를
    받은 후 tjoeun/1234 인 경우에는 'tjoeun님, 하이룽~'이라고 출력한다. 
    만약 틀렸다면 "아이디/비번을 확인하세요"라고 출력한다. 
    EL과 JSTL의 if태그만을 이용해서 구현하시오.
    -->
    <form method="get">
		아이디 : <input type="text" name="user" />
		<br />
		패스워드 : <input type="text" name="pass" />
		<br />
		<input type="submit" value="로그인" />
	</form>

	<c:if test="${not empty param.user}">		
	<c:if test = "${param.user== 'tjoeun' and param.pass=='1234'}" var = "result6"	>
		${param.user } 님 하이룽<br />
	</c:if>
	
	<c:if test = "${not result6}" 	>
		아이디 비번 확인<br />
	</c:if>
		</c:if>
</body>
</html>