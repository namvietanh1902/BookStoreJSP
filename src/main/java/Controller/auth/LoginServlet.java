package Controller.auth;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.BO.*;
import Model.Bean.*;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private UserBO userBO;
	@Override
	public void init() throws ServletException {
		String username = this.getServletContext().getInitParameter("username");
    	String password = this.getServletContext().getInitParameter("password");
    	String url = this.getServletContext().getInitParameter("url");
    	userBO = new UserBO(username, password, url);
		super.init();
	}
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String username = request.getParameter("email");
			String password = request.getParameter("password");
			
			boolean isValid = userBO.Login(username, password);
			System.out.print(username);
			if (isValid) { 
				
				request.getSession().setAttribute("user", username);
				response.sendRedirect("./");
				return;
			}
			else {
				request.setAttribute("error", "Login fail");
				request.getRequestDispatcher("login.jsp").forward(request, response);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
