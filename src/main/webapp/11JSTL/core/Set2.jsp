<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
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
	<h4>List 컬렉션</h4>
	<%
	ArrayList<Person> pList = new ArrayList<Person>();
	pList.add(new Person("성삼문",55));
	pList.add(new Person("박팽년",60));
	%>
	<c:set var ="personList" value="<%=pList %>" scope ="request" />
	<ul>
		<li>이름 : ${requestScope.personList[0].name }</li>
		<li>나이 : ${personList[0].age } </li>
	</ul>
	<%
	Map<String, Person> pMap = new HashMap<String ,Person>();
	pMap.put("personArg1", new Person("하위지",65));
	pMap.put("personArg2", new Person("이개",67));
	%>
	<c:set var= "personMap" value ="<%=pMap %>" scope= "request" />
	<ul>
		<li>이름 : ${requestScope.personMap.personArg2.name }</li>
		<li>나이 : ${personMap.personArg2.age } </li>
	</ul>	 
</body>
</html>