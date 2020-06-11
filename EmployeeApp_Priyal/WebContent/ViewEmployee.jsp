<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<jsp:include page="Header.jsp" />  

<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header"></div>
			<h3 class="text-center" style="color: #2491cf;">Employees List</h3>	
		</div>
	</nav>
	<table class="table table-bordered">
			<tr style="background-color: #2491cf; color: white;">
				<td scope="col" align="center"><b>Sr.No.</b></td>
				<td scope="col" align="center"><b>Employee Name</b></td>
				<td scope="col" align="center"><b>Gender</b></td>
				<td align="center"><b>Birth Date</b></td>
				<td align="center"><b>Interest</b></td>
				<td align="center"><b>Nationality</b></td>
				<td align="center"><b>Notes</b></td>
				<td align="center"><b>Edit Data</b></td>
				<td align="center"><b>Delete Data</b></td>
			</tr>

			<%
				String driverName = "com.mysql.jdbc.Driver";
				String connectionUrl = "jdbc:mysql://localhost:3306/";
				String dbName = "EmployeePriyal";
				String userId = "root";
				String password = "root";
				try 
				{
					Class.forName(driverName);
				} 
				catch (ClassNotFoundException e)
				{
					e.printStackTrace();
				}

				Connection connection = null;
				Statement statement = null;
				ResultSet resultSet = null;
			%>
			<%
			int i=0;
				try {
					connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
					statement = connection.createStatement();
					String sql = "SELECT * FROM employee";
					resultSet = statement.executeQuery(sql);
					while (resultSet.next()) {
						i++;		
			%>
			<tr>
				<td align="center"><%=i%></a></td>
				<td align="center"><%=resultSet.getString("ename")%></td>
				<td align="center"><%=resultSet.getString("gender")%></td>
				<td align="center"><%=resultSet.getString("birthdate")%></td>
				<td align="center"><%=resultSet.getString("interest")%></td>
				<td align="center"><%=resultSet.getString("nationality")%></td>
				<td align="center"><%=resultSet.getString("notes")%></td>
				<td align="center"><a href="EditEmployee.jsp?u=<%=resultSet.getString("id")%>">Edit</a></td>
				<td align="center"><a href="DeleteEmployee.jsp?u=<%=resultSet.getString("id")%>">Delete</a></td>
			</tr>

			<%
				}
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			finally{
				try{
				statement.close();
				resultSet.close();
				connection.close();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			%>
		</table>
		<br><br><br>
		&nbsp;<a href="index.jsp" style="color:white"><button type="button" class="btn btn-info">Go Back Home</button></a> <br><br>	
<jsp:include page="Footer.jsp" />  
	
</body>
</html>
