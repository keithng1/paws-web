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
	
	public JSONArray getProgramsJSON(int institutionID){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT SPID, degreeName, nextSurveyType FROM `school-program` WHERE institutionID = ? AND (levelID = 4 OR levelID = 5 OR  levelID = 6 OR levelID = 7)");
			ps.setInt(1, institutionID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("SPID", rs.getInt(1));
				job.put("degreeName", rs.getString(2));
				job.put("surveyType", rs.getString(3));
				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:getProgramsJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
	
	public JSONArray getInstitutionProgramsJSON(int instID){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT degreeName, levelID, level, validUntil FROM `school-program` WHERE institutionID = ?");
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
			System.out.println("Error in ProgramUtil:getProgramsJSON()");
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
			System.out.println("Error in InstitutionsUtil:getEducLevelName()");
			e.printStackTrace();
		}
		
		return name;
	}
	
	public ArrayList<Program> getPrograms(){
		ArrayList<Program> programs = new ArrayList<Program>();
		Program temp = new Program();
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM programs");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				//constructor is (int accreditorID, String name, String institution, String discipline, String primaryArea, 
				// String secondaryArea, int totalSurveys, String city)
				//db returns accreditorID, lastname, firstname, midlename, honorifics, 
				//email, num_surveys, date_trained, contact, address, city, country, venue_trained
				temp = new Program(rs.getInt(1), rs.getString(2), getCount(rs.getInt(1)));
				System.out.println(rs.getString(2));
				programs.add(temp);
			}
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:getPrograms()");
			e.printStackTrace();
		}
		
	    return programs;
	}
	
	public ArrayList<SchoolProgram> getInstitutionPrograms(int instID){
		ArrayList<SchoolProgram> sps = new ArrayList<SchoolProgram>();
		SchoolProgram sp = new SchoolProgram();
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM `school-program` WHERE institutionID=?");
			ps.setInt(1, instID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				sp = new SchoolProgram(rs.getInt(1), getInstitution(rs.getInt(3)), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				sps.add(sp);
			}
		
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:getInstitutionPrograms()");
			e.printStackTrace();
		}
		return sps;
	}
	
	public ArrayList<SchoolProgram> getDisciplines(int programID){
		ArrayList<SchoolProgram> sps = new ArrayList<SchoolProgram>();
		SchoolProgram sp = new SchoolProgram();
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM `school-program` WHERE programID=?");
			ps.setInt(1, programID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				sp = new SchoolProgram(rs.getInt(1), getInstitution(rs.getInt(3)), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				sps.add(sp);
			}
		
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:getDisciplines()");
			e.printStackTrace();
		}
		return sps;
	}
	public void updateProgram(int programID, String programName){
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE programs SET name = ? WHERE programID=?");
			ps.setInt(2, programID);
			ps.setString(1, programName);
			ps.executeUpdate();
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:updateProgram()");
			e.printStackTrace();
		}
	}
	public Program getProgram(int programID){
		Program temp = new Program();
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM programs WHERE programID=?");
			ps.setInt(1, programID);
			ResultSet rs = ps.executeQuery();
			rs.next();
			temp = new Program(rs.getInt(1), rs.getString(2), getCount(rs.getInt(1)));
			temp.setSps(getSps(programID));
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:getProgram()");
			e.printStackTrace();
		}
		
	    return temp;
	}
	
	private ArrayList<SchoolProgram> getSps(int programID){
		ArrayList<SchoolProgram> sps = new ArrayList<SchoolProgram>();
		SchoolProgram sp = new SchoolProgram();
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM `school-program` WHERE programID=?");
			ps.setInt(1, programID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				sp = new SchoolProgram(rs.getInt(1), getInstitution(rs.getInt(3)), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				sps.add(sp);
			}
		
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:getSps()");
			e.printStackTrace();
		}
		return sps;
	}
	private String getInstitution(int institutionID){
		String temp = new String();
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM tertiary WHERE tID=?");
			ps.setInt(1, institutionID);
			ResultSet rs = ps.executeQuery();
			rs.next();
			temp = rs.getString(3);
		
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:getInstitution()");
			e.printStackTrace();
		}
		
		return temp;
	}
	private int getCount(int programID){
		int count = 0;
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT count(*) FROM `school-program` WHERE programID = ?");
			ps.setInt(1, programID);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:getCount()");
			e.printStackTrace();
		}
		return count;
	}
	public void addProgram(String programName){
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("INSERT INTO programs (name) VALUES (?)");
			ps.setString(1, programName);
			ps.executeUpdate();
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:addProgram()");
			e.printStackTrace();	
		}
	}
	
	public void editProgram(int programID, String name){
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE programs SET name = ? WHERE programID = ?");
			ps.setString(1, name);
			ps.setInt(2, programID);
			ps.executeUpdate();
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:editProgram()");
			e.printStackTrace();
		}
	}
	
	public void deleteProgram(int programID){
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("DELETE from programs WHERE programID = ?");
			ps.setInt(1, programID);
			ps.executeUpdate();
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:deleteProgram()");
			e.printStackTrace();
		}
	}
	
	public String getLatestAccreditor(int SPID, int areaID){
		String temp = "";
		int PSID = getLatestPSID(SPID);
		if (PSID == 0){
			temp = "No Data";
		}else{
			try{
				Connection conn = db.getConnection();
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM `program-area` WHERE areaID = ? and PSID = ?");
				ps.setInt(1, areaID);
				ps.setInt(2, PSID);
				ResultSet rs = ps.executeQuery();
				if(rs.next()){
					temp = getAccreditorName(rs.getInt(3));
				}else{
					System.out.println("No data for areaID: " + areaID + " - PSID: " + PSID);
					temp = "No Data";
				}
			
			} catch (Exception e){
				System.out.println("Error in ProgramUtil:getLatestAccreditor()");
				e.printStackTrace();
			}
		}
		return temp;
	}
	
	private String getAccreditorName(int accreditorID){
		String temp = "";
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM `accreditors` WHERE accreditorID = ?");
			ps.setInt(1, accreditorID);
			ResultSet rs = ps.executeQuery();
			rs.next();
			temp = rs.getString(2) + ", " + rs.getString(3) + " " + rs.getString(4);
		
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:getAccreditorName()");
			e.printStackTrace();
		}
		return temp;
	}
	private int getLatestPSID(int SPID){
		int temp = 0;
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT max(PSID) FROM `program-survey` WHERE SPID = ?");
			ps.setInt(1, SPID);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				temp = rs.getInt(1);
			}else{
				temp = 0;
			}
		
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:getLatestPSID()");
			e.printStackTrace();
		}
		
		return temp;
	}
	
	
	private String getSurveyDate(int surveyID){
		String temp = new String();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT `startDate`, `endDate` FROM `surveys` WHERE surveyID = ?");
			ps.setInt(1, surveyID);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(rs.getString(2))){
					temp = formatDate(rs.getString(1));
				}else{
					temp = rs.getString(1) + "\n" + formatDate(rs.getString(2));
				}
			}
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:getSurveyDate()");
			e.printStackTrace();
		}
		
		return temp;
	}
	private String getBoardDecision(int PSID){
		String temp = new String();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT `decision`, `remarks` FROM `decisions` WHERE PSID = ?");
			ps.setInt(1, PSID);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getString(2).equals("undefined")||rs.getString(2).equals("NA")||rs.getString(2).equals("")){
					temp = rs.getString(1);
				}else{
					temp = rs.getString(1) + " " + rs.getString(2);
				}
			}
		} catch (Exception e){
			System.out.println("Error in ProgramUtil:getBoardDecison()");
			e.printStackTrace();
		}
		
		return temp;
	}
	
	private static String formatDate(String date){
		String format = new String();
		String month = "";
		String day;
		String year;
		String[] parts = date.split("-");
		if(parts[1].equals("01")){
			month = "January";
		}else if(parts[1].equals("02")){
			month = "February";
		}else if(parts[1].equals("03")){
			month = "March";
		}else if(parts[1].equals("04")){
			month = "April";
		}else if(parts[1].equals("05")){
			month = "May";
		}else if(parts[1].equals("06")){
			month = "June";
		}else if(parts[1].equals("07")){
			month = "July";
		}else if(parts[1].equals("08")){
			month = "August";
		}else if(parts[1].equals("09")){
			month = "September";
		}else if(parts[1].equals("10")){
			month = "October";
		}else if(parts[1].equals("11")){
			month = "November";
		}else if(parts[1].equals("12")){
			month = "December";
		}
		year = parts[0];

//		parts = parts[1].split(",");
		day = parts[2];
		
		format = month + " " + day + ", "+ year;
		return format;
	}

	
}
