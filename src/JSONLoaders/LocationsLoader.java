package JSONLoaders;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import Utilities.CommissionMembersUtil;
import Utilities.InstitutionsUtil;

/**
 * Servlet implementation class LocationsLoader
 */
@WebServlet("/LocationsLoader")
public class LocationsLoader extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LocationsLoader() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int level = 0;
		String city = "";
		
		response.setContentType("application/json");
		JSONArray jArray = new JSONArray();
		InstitutionsUtil instUtil = new InstitutionsUtil();
		
		
		if(Integer.parseInt(request.getParameter("level"))!=0)
		{
			if(request.getParameter("city")!="")
			{
				System.out.print("1" + request.getParameter("city") + "wot");
				level = Integer.parseInt(request.getParameter("level"));
				city = request.getParameter("city");
				jArray = instUtil.getLocationsLevelCityJSON(level, city);
				response.getWriter().write(jArray.toString());	
			}
			else
			{	
				System.out.print("2");
			
				level = Integer.parseInt(request.getParameter("level"));
				jArray = instUtil.getLocationsLevelJSON(level);
				response.getWriter().write(jArray.toString());
			}
		}
		else if(request.getParameter("city")!="")
		{
			System.out.print("3");
			
			city = request.getParameter("city");
			jArray = instUtil.getLocationsCityJSON(city);
			response.getWriter().write(jArray.toString());
		}
		else
		{
			System.out.print("4");
			
			jArray = instUtil.getLocationsJSON();
			response.getWriter().write(jArray.toString());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
