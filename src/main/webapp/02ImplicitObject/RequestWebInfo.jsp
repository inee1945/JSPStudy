<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Insert title here</title></head>
<body>
	<h2>1.클라이언트와 서버의 환경정보 읽기</h2>
	<ul>
		<li>데이터 전송방식 : <%= request.getMethod() %></li>
		<li>URL : <%= request.getRequestURL() %></li>
		
		<!-- 전체 경로에서 호스트 제외 -->
		<li>URI <%=request.getRequestURI() %></li>
		<li>프로토콜 : <%=request.getProtocol() %></li>
		<li>서버명  : <%=request.getServerName() %></li>		
		<li>서버포트  : <%=request.getServerPort() %></li>
		
		<!-- localhost는 루프백 주소이므로 0:0..같이 표현됨 -->
		<li>클라이언트아피ㅣ주소 : <%=request.getRemoteAddr() %></li>
		<!-- 
			get방식으로 전송할 경우 경로명뒤에 클라이언트가 전송한 값을 출력한다. 
			겟방식일때만.. post에서는 파라미터안나옴
		 -->!
		<li>쿼리스트링 : <%=request.getQueryString() %></li>
		<li>전송된 값1 : <%=request.getParameter("eng") %></li>
		<li>전송된 값2 : <%=request.getParameter("han") %></li>
		
	</ul>
</body>
</html>