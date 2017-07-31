package Routes;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.News;
import Utilities.NewsUtil;

/**
 * Servlet implementation class NewsList
 */
@WebServlet("/NewsList")
public class NewsList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int page = 1;
		
		if(request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		
		
		NewsUtil nUtil = new NewsUtil();
		int count = nUtil.getTotalCountNews();
		request.setAttribute("newsCount", count);
		request.setAttribute("page", page);
		
		RequestDispatcher rd = request.getRequestDispatcher("newsList.jsp");
		rd.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
