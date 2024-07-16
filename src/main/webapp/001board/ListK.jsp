<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page = "../Common/Link.jsp" />
	<h2>목록 보기</h2>
	<form method="get">
		<table border="1" width="90%">
			<td>
				<select>
					<option value="title" >제목</option>
					<option value="content" >내용</option>
				</select>
				<input type = "text" />
				<input type = "submit" value="검색하기"/>
			</td>
		</table>
	</form>
	<table border="1" width = "90%">
		<tr>
			<th width="10%">번호</th>
			<th width ="50">제목</th>
			<th width = "15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
	</table>
</body>
</html>