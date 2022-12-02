package Controller.auth;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BO.UserBO;
import Model.Bean.*;
/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    private UserBO userBO;
	@Override
	public void init() throws ServletException {
		String username = this.getServletContext().getInitParameter("username");
    	String password = this.getServletContext().getInitParameter("password");
    	String url = this.getServletContext().getInitParameter("url");
    	userBO = new UserBO(username, password, url);
		super.init();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String cpassword = request.getParameter("cpassword");
			if (!email.equals("") && password.length() >= 6 && password.equals(cpassword) && userBO.Signup(email, password)) {
//				request.getSession().setAttribute("user", email);
				response.sendRedirect("/CrudBookStore/login.jsp");
			}
			else {
				request.setAttribute("error"," Sign up fail");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
