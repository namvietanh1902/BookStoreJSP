package Model.BO;
import Model.Bean.*;

import java.sql.SQLException;

import Model.DAO.*;

public class UserBO {
	public userDAO userDAO;
	public UserBO(String username,String password,String url) {
		userDAO = new userDAO(username, password, url);
	}
	
	public boolean Login(String username,String password) throws SQLException{
		return userDAO.findUser(username, password);
	}
	
	public boolean Signup(String username,String password) throws SQLException{
		return userDAO.addUser(username, password);
	}
}
