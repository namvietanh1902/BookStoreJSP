package Model.BO;
import Model.DAO.*;

import java.sql.SQLException;
import java.util.ArrayList;

import Model.Bean.*;
public class BookBO {
	public bookDAO  bookDAO;
	public BookBO(String username,String password,String url){
		bookDAO = new bookDAO(username,password,url);
	}
	public void InsertBook(String bookName, String author, Float price) {
		try {
			bookDAO.InsertBook(bookName, author, price);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public boolean deleteBook(int id) {
		try {
			return bookDAO.deleteBook(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
		
	}
	public boolean editBook(int id,book book) throws SQLException {
		return bookDAO.editBook(id, book);
	}
	public ArrayList<book> DisplayAllBook() {
		try {
			return bookDAO.getAllBook();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public book findBook(int id) throws SQLException {
		return bookDAO.getBookDetail(id);
	}
	public ArrayList<book> searchBook(String bookName) throws SQLException {
		return bookDAO.getSearchBooks(bookName);
	}
	
}
