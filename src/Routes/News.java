package Routes;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utilities.NewsUtil;

/**
 * Servlet implementation class NewsList
 */
@WebServlet("/News")
public class News extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public News() {
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
		
		int year = 0;
		if(request.getParameter("year") != null)
			year = Integer.parseInt(request.getParameter("year"));
		
		NewsUtil nUtil = new NewsUtil();
		int count = nUtil.getTotalCountNews(year);
		request.setAttribute("newsCount", count);
		request.setAttribute("page", page);
		request.setAttribute("year", year);
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
