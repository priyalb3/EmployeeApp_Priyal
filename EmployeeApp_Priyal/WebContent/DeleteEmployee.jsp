<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
    Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeePriyal" ,"root","root");
	PreparedStatement pst = null;
	ResultSet res = null;
	Statement stat = null;
	String a=request.getParameter("u");
	
	String query="delete from employee where id="+a+"";
	stat=conn.createStatement();
	int i=stat.executeUpdate(query);
	response.sendRedirect("ViewEmployee.jsp");
	
%>
