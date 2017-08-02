package JSONLoaders;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import Utilities.BoardMembersUtil;
import Utilities.CommissionMembersUtil;

/**
 * Servlet implementation class CommissionMembersLoader
 */
@WebServlet("/CommissionMembersLoader")
public class CommissionMembersLoader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommissionMembersLoader() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int commPosID = 1;
		int educLevelID = 1;
		
		if(request.getParameter("educLevelID")!=null)
			educLevelID = Integer.parseInt(request.getParameter("educLevelID"));
		
		if(request.getParameter("positionID")!=null)
			commPosID = Integer.parseInt(request.getParameter("positionID"));
		
		response.setContentType("application/json");
		JSONArray jArray = new JSONArray();
		CommissionMembersUtil cmUtil = new CommissionMembersUtil();
		jArray = cmUtil.getCommissionMembersJSON(commPosID, educLevelID);
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
