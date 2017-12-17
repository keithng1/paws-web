package Utilities;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

import com.mysql.jdbc.Connection;

import Models.Program;
import Models.SchoolProgram;

public class ProgramUtil {
	private DBUtil db;
	public ProgramUtil(){
		db = new DBUtil();
	}
	
	
	
	public JSONArray getInstitutionProgramsJSON(int instID){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT degreeName, levelID, accLevel, validUntil FROM `school-program` WHERE institutionID = ? ORDER BY levelID");
			ps.setInt(1, instID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("degreeName", rs.getString(1));
				job.put("educLevel", getEducLevelName(rs.getInt(2)));
				job.put("accLevel", rs.getString(3));
				job.put("validUntil", rs.getString(4));
				
				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:getInstitutionProgramsJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
	
	
	private String getEducLevelName(int educLevelID)
	{
		String name="";
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT `levelName` FROM `educationlevel` where `levelID`=?");
			ps.setInt(1, educLevelID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){				
			
				name = rs.getString(1);
			}
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:getEducLevelName()");
			e.printStackTrace();
		}
		
		return name;
	}
	

	
}
