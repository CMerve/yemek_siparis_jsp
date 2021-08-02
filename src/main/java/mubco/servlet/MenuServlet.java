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
 * Servlet implementation class MenuServlet
 */
@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String urunID=request.getParameter("urunID");
		 
		 Menu menu=new MenuDao().getMenuMe(Integer.parseInt(urunID));
		
		 if(menu!=null){
			 request.getSession().setAttribute("menu", menu);
			
			 response.sendRedirect("./auth/page1_more.jsp");
		 }
		 else{
			 
			 request.getRequestDispatcher("./auth/page1.jsp").forward(request, response);
		 }
	}

}
