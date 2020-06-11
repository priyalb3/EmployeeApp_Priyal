<jsp:include page="Header.jsp" />  

<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header"></div>
			<h3 class="text-center" style="color: #2491cf;">Employee Form</h3>	
		</div>
	</nav>
	<br><br>
	<div class="container">
			<div class="form-group">
				<label class="col-md-4 control-label"></label>
				<div class="col-md-4">
					<button type="submit" style="margin-left:98px; width:200px;" class="btn btn-info" onclick="window.location ='EmployeeInsert.jsp'"><b>Insert New Employee</b></button>
				</div>
			</div>
	</div><br><br><br><br>
	<div class="container">
			<div class="form-group">
				<label class="col-md-4 control-label"></label>
				<div class="col-md-4">
					<button type="submit" style="margin-left:98px; width:200px;" class="btn btn-info" onclick="window.location ='ViewEmployee.jsp'"><b>View Employee</b> </button>
				</div>
			</div>
	</div>

<jsp:include page="Footer.jsp" />  
	
</body>
</html>
