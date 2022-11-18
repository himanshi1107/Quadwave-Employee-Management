package view;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DBConnect;
import controller.UserDAO;
import model.User;

/**
 * Servlet implementation class addServ
 */
@WebServlet("/addserv")
public class addServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public addServ() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		response.setContentType("html/text");
		String id = request.getParameter("zone");
		String doj = request.getParameter("doj");
		String yoe = request.getParameter("yoe");
		String designation = request.getParameter("designation");
		System.out.println(id);
		String query = "Update users set doj=?,yoe=?,designation=? where ename =?";
		
		try {
			Connection connection = DBConnect.getConnection();
			PreparedStatement ps=connection.prepareStatement(query);
			PrintWriter out = response.getWriter();
		
			ps.setString(1, doj);
			ps.setString(2, yoe);
			ps.setString(3, designation);
			ps.setString(4, id);
		
			int rc = ps.executeUpdate();
			if (rc > 0) {
				response.sendRedirect("index.jsp");
			} else {
				
			}
				
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
