package Model.DAO;
import Model.Bean.book;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
public class bookDAO extends DAOManager {
	
	public bookDAO(String username, String password, String url) {
		super(username, password, url);
	}
	public boolean InsertBook(String bookName,String author,float price) throws SQLException {
		connect();
		String query = "INSERT INTO BOOKS(bookName,author,price) VALUES(?,?,?)";
		PreparedStatement stmt = this.conn.prepareStatement(query);
		stmt.setString(1, bookName);
		stmt.setString(2,author);
		stmt.setFloat(3,price);
		boolean rowCount  = stmt.executeUpdate() >0;
		disconnect();
		return rowCount;
	}
	public boolean deleteBook(int id) throws SQLException {
		connect();
		String query = "DELETE FROM BOOKS WHERE ID = ?";
		PreparedStatement stmt = this.conn.prepareStatement(query);
		stmt.setInt(1, id);
		boolean rowCount  = stmt.executeUpdate() >0;
		disconnect();
		return rowCount;
	}
	public book findBook(int id) throws SQLException {
		connect();
		String query = "SELECT * from BOOKS WHERE ID = ?";
		PreparedStatement stmt = this.conn.prepareStatement(query);
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();
		book result = new book();
		while (rs.next()) {
			result.setId(rs.getInt("id"));
			result.setAuthor(rs.getString("author"));
			result.setBookName(rs.getString("bookName"));
			result.setPrice(rs.getFloat("price"));
			break;
		}
		disconnect();
		return result;
	}
	public ArrayList<book> getAllBook() throws SQLException {
		connect();
		ArrayList<book> list = new ArrayList<book>();
		String query = "SELECT * from BOOKS";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
			book Book = new book();
			Book.setId(rs.getInt("id"));
			Book.setAuthor(rs.getString("author"));
			Book.setBookName(rs.getString("bookName"));
			Book.setPrice(rs.getFloat("price"));
			list.add(Book);	
			
		}
		disconnect();
		return list;
		
	}

}
