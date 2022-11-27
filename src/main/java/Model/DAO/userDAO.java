package Model.DAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Model.Bean.*;
public class userDAO extends DAOManager {

	public userDAO(String username, String password, String url) {
		super(username, password, url);
	}
	
	public boolean findUser(String username,String password) throws SQLException{
		connect();
		boolean found;
		String query = "SELECT * FROM admin WHERE username = ? and pass =?";
		PreparedStatement stmt = conn.prepareStatement(query);
		stmt.setString(1, username);
		stmt.setString(2, password);
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			System.out.print("Hello");
			found= true;
		}
		else {
			found =false;
		}
		disconnect();
		return found;	
	}
	
	public boolean addUser(String username,String password) throws SQLException{
		connect();
		String query = "INSERT INTO admin(username,pass) values(?,?)";
		PreparedStatement stmt = conn.prepareStatement(query);
		stmt.setString(1, username);
		stmt.setString(2, password);
		boolean rowCount = stmt.executeUpdate()>0;
		disconnect();
		return rowCount;
	}
	

}
