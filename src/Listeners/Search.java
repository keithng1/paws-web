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
		String category = request.getParameter("cat");
		
		
		ArrayList<SearchResults> results = new ArrayList<SearchResults>();
	
		if(category!=null)
		{
			if(category.equals("members"))
			{
				BoardMembersUtil bmUtil = new BoardMembersUtil();
				if(bmUtil.getBMResults(searchWord)!=null)
					results.add(bmUtil.getBMResults(searchWord));
					
				CommissionMembersUtil cmUtil = new CommissionMembersUtil();
				if(cmUtil.getCMResults(searchWord)!=null)
					results.add(cmUtil.getCMResults(searchWord));
				
				request.setAttribute("cat", "members");

				request.setAttribute("pages", 0);
				request.setAttribute("page", 0);
			}
			
			if(category.equals("news"))
			{
				NewsUtil newsUtil = new NewsUtil();
				
				if(newsUtil.getNewsResults(searchWord)!=null)
					results.add(newsUtil.getNewsResults(searchWord));
				
				request.setAttribute("cat", "news");
				request.setAttribute("pages", 0);
				request.setAttribute("page", 0);
				
			}
			
			if(category.equals("institutions"))
			{
				InstitutionsUtil instUtil = new InstitutionsUtil();
			
				if(instUtil.getInstitutionsResults(searchWord)!=null)
					results.addAll(instUtil.getInstitutionsResults(searchWord));
				
				if(instUtil.getInstitutionsWithProgram(searchWord)!=null)
					results.addAll(instUtil.getInstitutionsWithProgram(searchWord));
				
				
				int nPages = (results.size()/10);
				if(results.size()%10 > 0)
					nPages++;
				else if(results.size()%10 == 0)
					nPages--;
				
				
				request.setAttribute("pages", nPages);
				
			
				int selectedPage = 1;
				if(request.getParameter("page")!=null)
				{
					selectedPage = Integer.parseInt(request.getParameter("page"));
				}

				ArrayList<SearchResults> resultsPage = new ArrayList<SearchResults>();
				
				if(results.size() > selectedPage*10)
				{
					for(int i = ((selectedPage-1)*10); i<((selectedPage-1)*10)+10; i++)
					{
						resultsPage.add(results.get(i));
					}
				}
				else if(results.size() < selectedPage*10)
				{
					for(int i = ((selectedPage-1)*10); i<results.size(); i++)
					{
						resultsPage.add(results.get(i));
					}
				}
				
				results.clear();
				results = resultsPage;
			
				request.setAttribute("page", selectedPage);
		
				
				request.setAttribute("cat", "institutions");
			}
		}
		else
		{

			request.setAttribute("pages", 0);
			request.setAttribute("page", 0);
			request.setAttribute("cat", "null");
		}
			
		
		request.setAttribute("results", results);
		request.setAttribute("searchWord", searchWord);

		
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/searchResults.jsp");
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
