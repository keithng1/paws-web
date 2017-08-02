package Utilities;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.JSONArray;
import org.json.JSONObject;

import com.mysql.jdbc.Connection;

public class BoardMembersUtil {
	private DBUtil db;
	public BoardMembersUtil(){
		db = new DBUtil();
	}
	

	public JSONArray getBoardMembersJSON(int boardPositionID){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM `board-members` WHERE boardPositionID = ?");
			ps.setInt(1, boardPositionID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("name", (rs.getString(5) + " " + rs.getString(2) + " " + rs.getString(4) + " " + rs.getString(3)).toUpperCase());
				job.put("position", rs.getString(6));
				job.put("institution", rs.getString(7));
				job.put("city", rs.getString(8));
				
				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in BoardMembersUtil:getBoardMembersJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
}
