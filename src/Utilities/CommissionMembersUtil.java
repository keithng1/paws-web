package Utilities;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.JSONArray;
import org.json.JSONObject;

import com.mysql.jdbc.Connection;

public class CommissionMembersUtil {
	private DBUtil db;
	public CommissionMembersUtil(){
		db = new DBUtil();
	}
	

	public JSONArray getCommissionMembersJSON(int commissionPositionID, int educLevelID){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM `commission-members` WHERE commissionPositionID = ? AND educLevelID = ?");
			ps.setInt(1, commissionPositionID);
			ps.setInt(2, educLevelID);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("name", (rs.getString(5) + " " + rs.getString(3) + " " + rs.getString(4) + " " + rs.getString(2)).toUpperCase());
				job.put("position", rs.getString(6));
				job.put("institution", rs.getString(7));
				job.put("city", rs.getString(8));
				job.put("commPosID", rs.getInt(10));
				job.put("educLevelID", rs.getInt(11));
				
				
				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in BoardMembersUtil:getBoardMembersJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
}
