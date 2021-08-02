package mubco.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mubco.dao.AdminDao;
import mubco.dao.MenuDao;
import mubco.entity.Admin;
import mubco.entity.Menu;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String username=request.getParameter("username");
		 String password=request.getParameter("password");
		 Admin ad=new AdminDao().getAdmin(username,password);
		
		 if(ad!=null){
			 request.getSession().setAttribute("admin", ad);
			
			 response.sendRedirect("./auth/page1.jsp");
		 }
		 else{
			 
			 request.getRequestDispatcher("./index.html").forward(request, response);
		 }
	}

}
