package Listeners;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Models.SearchResults;
import Utilities.BoardMembersUtil;
import Utilities.CommissionMembersUtil;
import Utilities.InstitutionsUtil;
import Utilities.NewsUtil;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String searchWord = request.getParameter("query");
		
		ArrayList<SearchResults> results = new ArrayList<SearchResults>();
		
		BoardMembersUtil bmUtil = new BoardMembersUtil();
		if(bmUtil.getBMResults(searchWord)!=null)
			results.add(bmUtil.getBMResults(searchWord));
		
		CommissionMembersUtil cmUtil = new CommissionMembersUtil();
		if(cmUtil.getCMResults(searchWord)!=null)
			results.add(cmUtil.getCMResults(searchWord));
		
		NewsUtil newsUtil = new NewsUtil();
		if(newsUtil.getNewsResults(searchWord)!=null)
			results.add(newsUtil.getNewsResults(searchWord));
		
		InstitutionsUtil instUtil = new InstitutionsUtil();
		if(instUtil.getInstitutionsResults(searchWord)!=null)
			results.addAll(instUtil.getInstitutionsResults(searchWord));
		
		
		request.setAttribute("results", results);
		request.setAttribute("searchWord", searchWord);

		System.out.print(request.getParameter("search"));
		
		RequestDispatcher rd = request.getRequestDispatcher("searchResults.jsp");
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
