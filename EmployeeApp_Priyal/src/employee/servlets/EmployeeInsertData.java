package employee.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/EmployeeInsertData")
public class EmployeeInsertData extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public EmployeeInsertData() 
    {
        super(); 
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String employeename = request.getParameter("ename");
		String gender = request.getParameter("egender");
		String employeeBdate=request.getParameter("bdate");
		String nationality=request.getParameter("nationality");
		String notes=request.getParameter("notes");
		String[] interest=request.getParameterValues("interest");
		String u=request.getParameter("u");
		
		String interestvalue="";
		for(int i=0;i<interest.length;i++){
		    interestvalue+=interest[i]+" ";
		}
		
		Connection conn=null;
		PreparedStatement pst=null;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EmployeePriyal" ,"root","root");    
			String query = "insert into employee(ename,gender,birthdate,interest,nationality,notes) values(?,?,?,?,?,?)";
			pst = conn.prepareStatement(query);
			pst.setString(1, employeename);
			pst.setString(2, gender);
			pst.setString(3, employeeBdate);
			pst.setString(4, interestvalue);
			pst.setString(5, nationality);
			pst.setString(6, notes);

			int r=pst.executeUpdate();
			if(r>0)
			{
				response.sendRedirect("ViewEmployee.jsp");
			}
			else
			{
				response.sendRedirect("error.jsp");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
			e.printStackTrace();
		}
		finally {
			try {
				pst.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
				
		}

	}
}
