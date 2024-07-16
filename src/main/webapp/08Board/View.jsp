<%@page import="utils.CookieManager"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");

BoardDAO dao = new BoardDAO(application);
dao.updateVisitCount(num);
BoardDTO dto = dao.selectView(num);
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
	function deletePost() {
		var confirmed = confirm("정말로 삭제하겠습니까?");
		if (confirmed) {
			var form = document.writeFrm;
			form.method = "post";
			form.action = "DeleteProcess.jsp";
			form.submit();
		}
	}
</script>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>회원제 게시판 - 상세 보기(View)</h2>
	<form name="writeFrm">
		<input type="hidden" name="num" value="<%=num%>" />
		<table border="1" width="90%">
			<tr>
				<td>번호</td>
				<td><%=dto.getName()%></td>
				<td>작성자</td>
				<td><%=dto.getName()%></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=dto.getPostdate()%></td>
				<td>조회수</td>
				<td><%=dto.getVisitcount()%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3"><%=dto.getTitle()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3" height="100">
				<%=dto.getContent()%>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<%
					if (session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId())) {
					%>
					<button type="button" onclick="location.href='Edit.jsp?num=<%=dto.getNum() %>';">수정하기</button>
					<button type="button" onclick="deletePost();">삭제하기</button>
					 <%
					 }
					 %>
					<button type="button" onclick="location.href='List.jsp';">
						목록 보기
					</button>
				</td>
			</tr>
		</table>
	</form>
	
	<h2>1. 쿠키 설정</h2>
	<%
	String ckValue = CookieManager.readCookie(request, "board-"+num);
	if(!ckValue.equals("read")){
		CookieManager.makeCookie(response, "board-"+num, "read", 1000);
		
		//게시물 조회수 증가
		dao.updateVisitCount(num);
	}
	
	
	
	Cookie cookie = new Cookie("myCookie","쿠키맛나요");
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(3600);
	
	//응답 헤더에 쿠키ㅣ를 추가하여  클라이언트 쪽으로 전송
	response.addCookie(cookie);	
	%>

	<h2>쿠기 설정 후 값 확인하기</h2>
	<%
	Cookie[] cookies = request.getCookies();
	if(cookies !=null){
		for(Cookie c : cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			out.println(String.format("%s : %s<br/>", cookieName, cookieValue));
		}
	}
	%>
	
</body>
</html>
