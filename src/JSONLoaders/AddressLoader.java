package JSONLoaders;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import Utilities.BoardMembersUtil;
import Utilities.InstitutionsUtil;

/**
 * Servlet implementation class AddressLoader
 */
@WebServlet("/AddressLoader")
public class AddressLoader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressLoader() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int instID = 0;
		
		if(request.getParameter("instID")!=null)
			instID = Integer.parseInt(request.getParameter("instID"));
		
		response.setContentType("application/json");
		JSONArray jArray = new JSONArray();
		InstitutionsUtil instUtil = new InstitutionsUtil();
		jArray = instUtil.getAddressOfInst(instID);
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
