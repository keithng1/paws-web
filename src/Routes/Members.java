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
 * Servlet implementation class Members
 */
@WebServlet("/Members")
public class Members extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Members() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int level = 0;
		String startLetter = "A";
		if(request.getParameter("educLevel")!=null)
			level = Integer.parseInt(request.getParameter("educLevel"));
		
		if(request.getParameter("letter")!=null)
			startLetter = request.getParameter("letter");
		
		
		NewsUtil nUtil = new NewsUtil();
		int count = nUtil.getTotalCountNews();
		request.setAttribute("educLevel", level);
		request.setAttribute("letter", startLetter);
		
		RequestDispatcher rd = request.getRequestDispatcher("members.jsp");
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
