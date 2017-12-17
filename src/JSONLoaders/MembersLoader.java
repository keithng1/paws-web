package JSONLoaders;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import Utilities.InstitutionsUtil;
import Utilities.NewsUtil;

/**
 * Servlet implementation class MembersLoader
 */
@WebServlet("/MembersLoader")
public class MembersLoader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MembersLoader() {
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
		

		response.setContentType("application/json");
		JSONArray jArray = new JSONArray();
		InstitutionsUtil instUtil = new InstitutionsUtil();
		jArray = instUtil.getFilteredInstitutionsJSON(startLetter, level);
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
