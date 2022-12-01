package Model.DAO;
import java.sql.*;
public class DAOManager {
	private String username;
	private String password;
	private String url;
	protected Connection conn;
	public DAOManager(String username,String password,String url) {
		super();
		this.username = username;
		this.password = password;
		this.url = url;
	}
	protected void connect() throws SQLException{
		if(conn == null || conn.isClosed()) {
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(this.url, this.username, this.password);
				
			}
			catch(ClassNotFoundException e) {
				throw new SQLException(e);
			}
		}
	}
	protected void disconnect() throws SQLException{
		if (conn!=null && !conn.isClosed()) {
			conn.close();
		}
	}
}
