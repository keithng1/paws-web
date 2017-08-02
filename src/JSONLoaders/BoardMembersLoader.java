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
 * Servlet implementation class BoardMembersLoader
 */
@WebServlet("/BoardMembersLoader")
public class BoardMembersLoader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardMembersLoader() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int boardID = 1;
		
		if(request.getParameter("boardPositionID")!=null)
			boardID = Integer.parseInt(request.getParameter("boardPositionID"));
		
		response.setContentType("application/json");
		JSONArray jArray = new JSONArray();
		BoardMembersUtil bmUtil = new BoardMembersUtil();
		jArray = bmUtil.getBoardMembersJSON(boardID);
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
