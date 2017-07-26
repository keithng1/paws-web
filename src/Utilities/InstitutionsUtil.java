package Utilities;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONObject;

import com.mysql.jdbc.Connection;

import Models.Institution;

public class InstitutionsUtil {
	private DBUtil db;
	public InstitutionsUtil(){
		db = new DBUtil();
	}
	

	public JSONArray getInstitutionsJSON(int systemID){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT institutionID, name, city FROM `institutions` WHERE systemID = ?  ORDER BY `name`");
			ps.setInt(1, systemID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("institutionID", rs.getInt(1));
				job.put("institutionName", rs.getString(2) + " - " + rs.getString(3));
				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getInstitutionsJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
	
	public JSONArray getInvitationInstitutionsJSON(){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT institutionID, name, city, educLevelID FROM institutions");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("institutionID", rs.getInt(1));
				job.put("institutionName", rs.getString(2));
				job.put("city", rs.getString(3));
				job.put("educLevel", getEducLevelName(rs.getInt(4)));
				
				
				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getInvitationInstitutionsJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
	
	
	
	public JSONArray getInstitutionForInvitationJSON(int instID){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			//PreparedStatement ps = conn.prepareStatement("SELECT name, head, hPosition, city FROM `institutions` WHERE institutionID = (SELECT institutionID FROM `work` WHERE accreditorID = ? AND dateFinished IS NULL)");
			PreparedStatement ps = conn.prepareStatement("SELECT name, city FROM `institutions` WHERE institutionID = ?");
			ps.setInt(1, instID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("name", rs.getString(1));
				job.put("city", rs.getString(2));

				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getInstitutionForInvitationJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
	
	
	public JSONArray getAllInstitutionsJSON(){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT name, systemID, acronym, dateAdded, city, institutionID, educLevelID FROM `institutions` ORDER BY `name`");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("institutionName", rs.getString(1));
				job.put("system", getSchoolSystemName(rs.getInt(2)));
				job.put("acronym", rs.getString(3));
				job.put("dateAdded", formatDate_yearFirst(rs.getString(4)));
				job.put("city", rs.getString(5));
				job.put("institutionID", rs.getInt(6));
				job.put("educLevel", getEducLevelName(rs.getInt(7)));
				

				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getAllInstitutionsJSON()");
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
	
	
	
	private String getSchoolSystemName(int ID){
		String name="";
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT `name` FROM `school-systems` where `systemID`=?");
			ps.setInt(1, ID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){				
			
				name = rs.getString(1);
				System.out.println("Checking schoolsystemName: "+ name);
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getSchoolSystemName()");
			e.printStackTrace();
		}
		
		return name;
	}
	
	public ArrayList<Institution> getInstitutions(){
		ArrayList<Institution> institutions = new ArrayList<Institution>();
		Institution temp = new Institution();

		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM institutions ORDER BY `name`");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				//constructor is (int accreditorID, String name, String institution, String discipline, String primaryArea, 
				// String secondaryArea, int totalSurveys, String city)
				//db returns accreditorID, lastname, firstname, midlename, honorifics, email, num_surveys, 
				//date_trained, contact, address, city, country, venue_trained, primaryAreaID, 
				//secondaryAreaID, discipline
				
				
			
				System.out.println(rs.getString(3));
				temp = new Institution(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), getEducLevelName(rs.getInt(19)));
				temp.setSchoolSystemName(getSchoolSystemName(rs.getInt(2)));
				
				institutions.add(temp);
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getInstitutions()");
			e.printStackTrace();
		}
		
	    return institutions;
	}
	
	public ArrayList<Institution> getInstitutionsNameIDLevel(){
		ArrayList<Institution> institutions = new ArrayList<Institution>();
		Institution temp = new Institution();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT institutionID, name, city, educLevelID FROM institutions ORDER BY `name`");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				//constructor is (int accreditorID, String name, String institution, String discipline, String primaryArea, 
				// String secondaryArea, int totalSurveys, String city)
				//db returns accreditorID, lastname, firstname, midlename, honorifics, email, num_surveys, 
				//date_trained, contact, address, city, country, venue_trained, primaryAreaID, 
				//secondaryAreaID, discipline
				
			
				temp = new Institution(rs.getInt(1), rs.getString(2), rs.getString(3), getEducLevelName(rs.getInt(4)));
				
				institutions.add(temp);
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getInstitutionsNameID()");
			e.printStackTrace();
		}
		
	    return institutions;
	}
	
	
	public JSONArray getInstitutionsForLevelJSON(int educLevelID){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT name, systemID, acronym, dateAdded, city, institutionID, educLevelID FROM `institutions` WHERE educLevelID = ? ORDER BY `name`");
			ps.setInt(1, educLevelID);
		
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("institutionName", rs.getString(1));
				job.put("system", getSchoolSystemName(rs.getInt(2)));
				job.put("acronym", rs.getString(3));
				job.put("dateAdded", formatDate_yearFirst(rs.getString(4)));
				job.put("city", rs.getString(5));
				job.put("institutionID", rs.getInt(6));
				job.put("educLevel", getEducLevelName(rs.getInt(7)));
				

				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getInstitutionsForLevelJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
	
	public String getInstitutionName(int institutionID){
		String name = "";
		Institution temp = new Institution();
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT name FROM institutions WHERE `institutionID` = ?");
			
			ps.setInt(1, institutionID);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				//constructor is (int accreditorID, String name, String institution, String discipline, String primaryArea, 
				// String secondaryArea, int totalSurveys, String city)
				//db returns accreditorID, lastname, firstname, midlename, honorifics, email, num_surveys, 
				//date_trained, contact, address, city, country, venue_trained, primaryAreaID, 
				//secondaryAreaID, discipline
				
				
			
				name = rs.getString(1);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getInstitutions()");
			e.printStackTrace();
		}
		return name;
	}
	
	public ArrayList<Institution> getSchoolSystemInstitutions(int systemID){
		ArrayList<Institution> institutions = new ArrayList<Institution>();
		Institution temp = new Institution();
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM institutions WHERE `systemID` = ?  ORDER BY `name`");
			ps.setInt(1, systemID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				//constructor is (int accreditorID, String name, String institution, String discipline, String primaryArea, 
				// String secondaryArea, int totalSurveys, String city)
				//db returns accreditorID, lastname, firstname, midlename, honorifics, email, num_surveys, 
				//date_trained, contact, address, city, country, venue_trained, primaryAreaID, 
				//secondaryAreaID, discipline
			
				System.out.println(rs.getString(3));
				temp =  new Institution(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), getEducLevelName(rs.getInt(19)));;
				institutions.add(temp);
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getSchoolSystemInstitutions()");
			e.printStackTrace();
		}
		
	    return institutions;
	}
	
	public Institution getInstitution(int instID){
		Institution temp = new Institution();
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM institutions a where a.institutionID = ?");
			ps.setInt(1,  instID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				temp =  new Institution(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), getEducLevelName(rs.getInt(19)));;
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getInstitution()");
			e.printStackTrace();
		}
		
	    return temp;
	}
	
	
	
	public void addInstitution(String ssName, String institutionName, String institutionAcronym, String address , String city , String country ,
			String website , String contactNumber , String fax , String institutionHead , String position , String headEmail ,
			String contactPerson , String contactPosition , String contactEmail , String membershipDate){
		try{
		
			String dateBuild = formatDate(membershipDate);
			
			
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("INSERT INTO institutions (systemID, name, head, hPosition, hEmail, address, status, dateAdded, city, fax, contactPerson, contactPosition, contactNumber, website, country, contactEmail, acronym) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			int ssID_int = Integer.parseInt(ssName);
			ps.setInt(1, ssID_int);
			ps.setString(2, institutionName);
			ps.setString(3, institutionHead);
			ps.setString(4, position);
			ps.setString(5, headEmail);
			ps.setString(6, address);
			ps.setString(7, "Preliminary Visit");
			ps.setString(8, dateBuild);
			ps.setString(9, city);
			ps.setString(10, fax);
			ps.setString(11, contactPerson);
			ps.setString(12, contactPosition);
			ps.setString(13, contactNumber);
			ps.setString(14, website);
			ps.setString(15, country);
			ps.setString(16, contactEmail);
			ps.setString(17, institutionAcronym);
			ps.executeUpdate();
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:addInstitution()");
			e.printStackTrace();	
		}
	}
	
	public void editInstitution(int institutionID, String ssName, String institutionName, String institutionAcronym, String address , String city , String country ,
			String website , String contactNumber , String fax , String institutionHead , String position , String headEmail ,
			String contactPerson , String contactPosition , String contactEmail , String membershipDate){
		try{
			String dateBuild = formatDate(membershipDate);
			
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE institutions SET systemID=?, name=?, head=?, hPosition=?, hEmail=?, address=?, status=?, dateAdded=?, city=?, fax=?, contactPerson=?, contactPosition=?, contactNumber=?, website=?, country=?, contactEmail=?, acronym=? WHERE institutionID=?");
			int ssID_int = Integer.parseInt(ssName);
			
			ps.setInt(1, ssID_int);
			ps.setString(2, institutionName);
			ps.setString(3, institutionHead);
			ps.setString(4, position);
			ps.setString(5, headEmail);
			ps.setString(6, address);
			ps.setString(7, "Preliminary Visit");
			ps.setString(8, dateBuild);
			ps.setString(9, city);
			ps.setString(10, fax);
			ps.setString(11, contactPerson);
			ps.setString(12, contactPosition);
			ps.setString(13, contactNumber);
			ps.setString(14, website);
			ps.setString(15, country);
			ps.setString(16, contactEmail);
			ps.setString(17, institutionAcronym);
			ps.setInt(18, institutionID);
			
			ps.executeUpdate();
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:editInstitution()");
			e.printStackTrace();	
		}
	}
	
	
	public void addProgramToInst(String specific, int generalID, int insinstitutionID){
		try{
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String strDate = dateFormat.format(date);
			
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("INSERT INTO `school-program` (programID, institutionID, level, dateAdded, degreeName) VALUES (?,?,?,?,?)");
		
			ps.setInt(1, generalID);
			ps.setInt(2, insinstitutionID);
			ps.setString(3, "NA");
			ps.setString(4, strDate);
			ps.setString(5, specific);
			
			ps.executeUpdate();
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:addProgramToInstitution()");
			e.printStackTrace();	
		}
		
	}
	
	public void deleteInstitution(int institutionID){
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("DELETE from institutions WHERE institutionID = ?");
			ps.setInt(1, institutionID);
			ps.executeUpdate();
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:deleteInstitution()");
			e.printStackTrace();
		}
	}
	
	private static String formatDate(String date){
		String format = new String();
		String month = "";
		String day;
		String year;
		if(date!=null&&date!=""){
		String[] parts = date.split(" ");
		if(parts[0].equals("January")){
			month = "01";
		}else if(parts[0].equals("February")){
			month = "02";
		}else if(parts[0].equals("March")){
			month = "03";
		}else if(parts[0].equals("April")){
			month = "04";
		}else if(parts[0].equals("May")){
			month = "05";
		}else if(parts[0].equals("June")){
			month = "06";
		}else if(parts[0].equals("July")){
			month = "07";
		}else if(parts[0].equals("August")){
			month = "08";
		}else if(parts[0].equals("September")){
			month = "09";
		}else if(parts[0].equals("October")){
			month = "10";
		}else if(parts[0].equals("November")){
			month = "11";
		}else if(parts[0].equals("December")){
			month = "12";
		}
		year = parts[2];

		parts = parts[1].split(",");
		day = parts[0];
		
		format = year + "-" + month + "-"+ day;
		}
		return format;
	}
	
	private static String formatDate_yearFirst(String date){
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
		
		format = year + " " + month + " "+ day;
		return format;
	}
}
