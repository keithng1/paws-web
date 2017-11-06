package Utilities;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

import com.mysql.jdbc.Connection;

import Models.Program;
import Models.SearchResults;

public class BoardMembersUtil {
	private DBUtil db;

	public BoardMembersUtil() {
		db = new DBUtil();
	}

	public JSONArray getBoardMembersJSON() {
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();

		try {
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM `paws-web`.`board-members` WHERE year = (SELECT MAX(year) FROM `paws-web`.`board-members`)");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				job = new JSONObject();
				job.put("name",
						(rs.getString(5) + " " + rs.getString(2) + " " + rs.getString(4) + " " + rs.getString(3))
								.toUpperCase());
				job.put("position", rs.getString(6));
				job.put("institution", rs.getString(7));
				job.put("city", rs.getString(8));
				job.put("year", rs.getInt(9));
				job.put("boardPositionID", rs.getInt(10));
				
				
				jArray.put(job);

			}
		} catch (Exception e) {
			System.out.println("Error in BoardMembersUtil:getBoardMembersJSON()");
			e.printStackTrace();
		}

		return jArray;
	}

	public SearchResults getBMResults(String searchWord)
	{
		SearchResults temp = null;
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT firstname, lastname, position FROM `board-members` WHERE firstname LIKE ? OR lastname LIKE ? OR position LIKE ?");
			ps.setString(1, "%" + searchWord + "%");
			ps.setString(2, "%" + searchWord + "%");
			ps.setString(3, "%" + searchWord + "%");
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				temp = new SearchResults("Board Members", rs.getString(1) + " " + rs.getString(2) + " - " + rs.getString(3) + "<br>...", "BoardMembers", "Board Members");
				System.out.print("ASAS" + rs.getString(1));
			}
		
		} catch (Exception e){
			System.out.println("Error in BoardMembersUtil:getBMResults()");
			e.printStackTrace();
		}
		
		return temp;
	}
}
