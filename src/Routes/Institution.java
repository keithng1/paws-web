package Routes;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utilities.InstitutionsUtil;
import Utilities.NewsUtil;

/**
 * Servlet implementation class Institution
 */
@WebServlet("/Institution")
public class Institution extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Institution() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int ID = Integer.parseInt(request.getParameter("institutionID"));
		InstitutionsUtil instUtil = new InstitutionsUtil();
		
		String name = instUtil.getInstitutionName(ID);
		Double lng = instUtil.getLongitude(ID);
		Double lat = instUtil.getLatitude(ID);
		
		
		request.setAttribute("instID", ID);
		request.setAttribute("instName", name);
		request.setAttribute("lat", lat);
		request.setAttribute("lng", lng);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("membersPage.jsp");
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
