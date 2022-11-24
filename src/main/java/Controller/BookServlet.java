package Controller;
import Model.BO.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

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
@WebServlet(urlPatterns = {"/add","/getAll","/delete/*","/edit/*","/editForm/*"})
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
			
			
			
			switch(action) {
				case "/add" :
					addBookServlet(request, response);
					break;
				case "/getAll":
					getAllServlet(request, response);
					break;
				case "/delete":
					deleteBookServlet(request, response);
					break;
				case "/edit":
					editBookServlet(request,response);
					break;
				case "/editForm":
					editFormServlet(request,response);
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
	protected void editFormServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String path = request.getPathInfo();
			String id = path.substring(1);
			System.out.println("id: "+id);
			book book=BookBO.findBook(Integer.parseInt(id));
			if (book!=null) {
					request.setAttribute("book",book);
					request.getRequestDispatcher("./editForm/"+id).forward(request, response);
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
			request.setAttribute("rs", BookBO.DisplayAllBook());
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
			String bookName = request.getParameter("bookName");
			String author = request.getParameter("author");
			Float price = Float.parseFloat(request.getParameter("price"));
			BookBO.InsertBook(bookName, author, price);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/getAll");
			dispatcher.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
