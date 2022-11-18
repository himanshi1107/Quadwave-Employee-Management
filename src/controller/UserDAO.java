package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;

public class UserDAO {
	
	private static final String query = "INSERT INTO users" + "  (ename, doj, yoe, designation) VALUES "
			+ " (?, ?, ?, ?);";
	
	public static void insertUser(User user) throws SQLException, ClassNotFoundException {
		System.out.println(query);
		try (Connection connection = DBConnect.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query)) {
			preparedStatement.setString(1, user.getDoj());
			preparedStatement.setString(2, user.getYoe());
			preparedStatement.setString(3, user.getDesignation());
			preparedStatement.setString(4, user.getEid());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}
	
public static ResultSet validate(String q){  
		
		ResultSet rs=null;
		
		try{  

		Connection conn = DBConnect.getConnection();
		      
		PreparedStatement ps=conn.prepareStatement(q);  
		
		 rs=ps.executeQuery();  
		        
		}catch(Exception e){
			System.out.println(e);
			
		}  
		return rs;  
		}  
	
	
	
	
	private static void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}
