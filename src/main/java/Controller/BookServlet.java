package Controller;
import Model.BO.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Bean.book;
/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet(urlPatterns = {"/add","/getAll","/delete/*","/edit/*", "/search/*"})
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookBO BookBO;
    @Override
    public void init() throws ServletException {
    	String username = this.getServletContext().getInitParameter("username");
    	String password = this.getServletContext().getInitParameter("password");
    	String url = this.getServletContext().getInitParameter("url");
    	BookBO = new BookBO(username, password, url);
    	super.init();
    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String action = request.getServletPath();
			if (request.getSession().getAttribute("user")==null) {
				request.setAttribute("action", action);
				request.getRequestDispatcher("/login").forward(request, response);
				
				return;
			}
			switch(action) {
				case "/getAll":
					getAllServlet(request, response);
					break;
				case "/edit":
					editFormServlet(request,response);
					break;
				case "/search":
					searchServlet(request,response);
					break;
				default:
					response.getWriter().println("Route does not exist");
					break;
			}
			
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		switch(action) {
			case "/add" :
				addBookServlet(request, response);
				break;
			case "/delete":
				deleteBookServlet(request, response);
				break;
			case "/edit":
				editBookServlet(request,response);
				break;
			default:
				response.getWriter().println("Route does not exist");
				break;
		}
		
	}
	protected void editFormServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String path = request.getPathInfo();
			String id = path.substring(1);
			System.out.println(path);
			System.out.println(request.getServletPath());
			book book=BookBO.findBook(Integer.parseInt(id));
			
			if (book!=null) {
					request.setAttribute("book",book);
					getServletContext().getRequestDispatcher("/editForm.jsp").forward(request, response);
				}
			
				else {
					response.getWriter().println("Id khong ton tai");
				}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	protected void addBookServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String bookName = request.getParameter("bookName");
			String author = request.getParameter("author");
			Float price = Float.parseFloat(request.getParameter("price"));
			BookBO.InsertBook(bookName, author, price);
			response.sendRedirect("getAll");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	protected void getAllServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page;
		if(request.getParameter("page") == null || Integer.parseInt(request.getParameter("page")) <= 0) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		ArrayList<book> books = BookBO.DisplayAllBook();
		ArrayList<book> fiveBooks = new ArrayList<book>();
		int startIndex = (page - 1)*5;
		int lengthOfPage = startIndex + 4 <= books.size() ? startIndex + 4 : books.size()-1;
		for(int i = startIndex; i <= lengthOfPage; i++) {
			fiveBooks.add(books.get(i));
		}
		int numberOfPages = books.size();
			request.setAttribute("allPages", numberOfPages);
			request.setAttribute("rs", fiveBooks);
			RequestDispatcher dispatcher =  request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
			
	}
	protected void deleteBookServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String path = request.getPathInfo();
			String id = path.substring(1);
			if (id.matches("^-?\\d+$")) {
				if(BookBO.deleteBook(Integer.parseInt(id))) {
					response.sendRedirect("/CrudBookStore/getAll");
				}
				else {
					response.getWriter().println("Id khong ton tai");
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	protected void editBookServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String path = request.getPathInfo();
			String id = path.substring(1);
			String bookName = request.getParameter("bookName");
			String author = request.getParameter("author");
			Float price = Float.parseFloat(request.getParameter("price"));
			book book = new book();
			book.setAuthor(author);
			book.setBookName(bookName);
			book.setPrice(price);
			if(BookBO.editBook(Integer.parseInt(id),book)) {
				response.sendRedirect("/CrudBookStore/getAll");
			}
			else {
				response.getWriter().println("Id khong ton tai");
			} 
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	protected void searchServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String bookName = request.getParameter("bookName");
		request.setAttribute("rs", BookBO.searchBook(bookName));
		RequestDispatcher dispatcher =  request.getRequestDispatcher("search.jsp");
		dispatcher.forward(request, response);
		
	}
	
	protected void pageServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String page = request.getParameter("page");
		System.out.println(page);
	}

}
