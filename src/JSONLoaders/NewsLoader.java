package JSONLoaders;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import Models.News;
import Utilities.NewsUtil;

/**
 * Servlet implementation class NewsLoader
 */
@WebServlet("/NewsLoader")
public class NewsLoader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsLoader() {
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
		
		response.setContentType("application/json");
		JSONArray jArray = new JSONArray();
		NewsUtil newsUtil = new NewsUtil();
		jArray = newsUtil.getNewsInPageJSON(page, year);
		response.getWriter().write(jArray.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
