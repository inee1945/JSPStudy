<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
<%
JDBConnect jdbc = new JDBConnect();
	String sql = "select id,pass,name,regidate from member";
	Statement stmt = jdbc.con.createStatement();
	ResultSet result = stmt.executeQuery(sql);
	
	while(result.next()){
		String id = result.getString(1);
		String pwd = result.getString("pass");
		String name = result.getString(3);
		java.sql.Date regidate = result.getDate("regidate");
		out.println(String.format("%s %s %s %s", id, pwd,name,regidate) + "<br/>");
	}
	jdbc.close();
%>

</body>
</html>