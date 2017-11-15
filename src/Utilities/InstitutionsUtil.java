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
import Models.SearchResults;

public class InstitutionsUtil {
	private DBUtil db;
	public InstitutionsUtil(){
		db = new DBUtil();
	}
	
	public JSONArray getFilteredInstitutionsJSON(String startLetter, int level){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		try{
			Connection conn = db.getConnection();
			if(level==0)
			{
				PreparedStatement ps = conn.prepareStatement("SELECT name, city, institutionID FROM institutions WHERE name LIKE ?");
				ps.setString(1, startLetter + "%");
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					job = new JSONObject();
					job.put("institutionID", rs.getInt(3));
					job.put("institutionName", rs.getString(1) + " - " + rs.getString(2));
					jArray.put(job);
				}
			}
			else
			{
				PreparedStatement ps = conn.prepareStatement("SELECT name, city, institutionID FROM institutions WHERE name LIKE ? AND educLevelID = ?");
				ps.setString(1, startLetter + "%");
				ps.setInt(2, level);
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					job = new JSONObject();
					job.put("institutionID", rs.getInt(3));
					job.put("institutionName", rs.getString(1) + " - " + rs.getString(2));
					jArray.put(job);
				}
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getInstitutionsStartingLetterJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
	
	
	public JSONArray getFilteredInstitutionsJSON1(String startLetter, int level){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		try{
			Connection conn = db.getConnection();
			if(level==0)
			{
				PreparedStatement ps = conn.prepareStatement("SELECT name, city, institutionID FROM institutions WHERE institutionID IN (SELECT institutionID FROM `school-program`) AND name LIKE ?");
				ps.setString(1, startLetter + "%");
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					job = new JSONObject();
					job.put("institutionID", rs.getInt(3));
					job.put("institutionName", rs.getString(1) + " - " + rs.getString(2));
					jArray.put(job);
				}
			}
			else
			{
				PreparedStatement ps = conn.prepareStatement("SELECT name, city, institutionID FROM institutions WHERE institutionID IN (SELECT institutionID FROM `school-program` WHERE levelID = ?) AND name LIKE ?");
				ps.setInt(1, level);
				ps.setString(2, startLetter + "%");
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					job = new JSONObject();
					job.put("institutionID", rs.getInt(3));
					job.put("institutionName", rs.getString(1) + " - " + rs.getString(2));
					jArray.put(job);
				}
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getInstitutionsStartingLetterJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}

	public JSONArray getLocationsJSON(){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT longitude, latitude, name, address, city FROM `institutions`");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("lng", rs.getDouble(1));
				job.put("lat", rs.getDouble(2));
				job.put("info", "<b>" + rs.getString(3) + "</b><br>" + rs.getString(4) + "<br>" + rs.getString(5));
				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getLocationsJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
	
	public JSONArray getLocationsLevelJSON(int level){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT longitude, latitude, name, address, city FROM `institutions` WHERE educLevelID = ?");
			ps.setInt(1, level);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				System.out.print("waaat");
				job = new JSONObject();
				job.put("lng", rs.getDouble(1));
				job.put("lat", rs.getDouble(2));
				job.put("info", "<b>" + rs.getString(3) + "</b><br>" + rs.getString(4) + "<br>" + rs.getString(5));
				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getLocationsJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}

	public JSONArray getInstitutionsOfSystemJSON(int systemID){
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
	
	public JSONArray getInstitutionsJSON(){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT institutionID, name, city FROM `institutions` ORDER BY `name`");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("institutionID", rs.getInt(1));
				job.put("institutionName", rs.getString(2));
				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getInstitutionsJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
	

	public ArrayList<SearchResults> getInstitutionsResults(String searchWord)
	{
		ArrayList<SearchResults> temp = new ArrayList<SearchResults>();
		SearchResults tempResult = null;
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT institutionID, name, acronym, contactEmail, contactNumber FROM `institutions` WHERE name LIKE ?");
			ps.setString(1, "%" + searchWord + "%");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				String acronym = "";
				String contactEmail = "-";
				String contactNumber = "-";

				if(rs.getString(3)==null);
				else
					acronym = " (" + rs.getString(3) + ")";
				
				if(rs.getString(4)==null);
				else
					contactEmail = rs.getString(4);
				
				if(rs.getString(5)==null);
				else
					contactNumber = rs.getString(5);
				
				tempResult = new SearchResults(rs.getString(2) + acronym, "Contact E-mail: " + contactEmail + "<br>Contact Number: " + contactNumber, "Institution?institutionID=" + rs.getInt(1), "Institution");
				temp.add(tempResult);
			}
		
		} catch (Exception e){
			System.out.println("Error in BoardMembersUtil:getBMResults()");
			e.printStackTrace();
		}
		
		return temp;
	}
	
	public ArrayList<SearchResults> getInstitutionsWithProgram(String searchWord)
	{
		ArrayList<SearchResults> temp = new ArrayList<SearchResults>();
		SearchResults tempResult = null;
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT institutionID, name, acronym, contactEmail, contactNumber FROM `institutions` WHERE institutionID IN (SELECT institutionID FROM `school-program` WHERE degreeName LIKE ?)");
			ps.setString(1, "%" + searchWord + "%");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				String acronym = "";
				String contactEmail = "-";
				String contactNumber = "-";

				if(rs.getString(3)==null);
				else
					acronym = " (" + rs.getString(3) + ")";
				
				if(rs.getString(4)==null);
				else
					contactEmail = rs.getString(4);
				
				if(rs.getString(5)==null);
				else
					contactNumber = rs.getString(5);
				
				tempResult = new SearchResults(rs.getString(2) + acronym, rs.getString(2) + " has programs related to your search query: \"" + searchWord + "\"", "Institution?institutionID=" + rs.getInt(1), "Institution");
				temp.add(tempResult);
				
				System.out.print("asasd");
			}
		
		} catch (Exception e){
			System.out.println("Error in BoardMembersUtil:getBMResults()");
			e.printStackTrace();
		}
		
		return temp;
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
	
	
	public int getEducLevelID(int institutionID)
	{
		int ID = 0;
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT `educLevelID` FROM `institutions` where `institutionID`=?");
			ps.setInt(1, institutionID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){				
				ID = rs.getInt(1);
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getEducLevelName()");
			e.printStackTrace();
		}
		
		return ID;
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
				temp = new Institution(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), getEducLevelName(rs.getInt(19)), rs.getDouble(20), rs.getDouble(21));
				
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
	
	public JSONArray getLocationsCityJSON(String city) 
	{
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT longitude, latitude, name, address, city FROM `institutions` WHERE city LIKE ?");
			ps.setString(1, "%" + city + "%");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("lng", rs.getDouble(1));
				job.put("lat", rs.getDouble(2));
				job.put("info", "<b>" + rs.getString(3) + "</b><br>" + rs.getString(4) + "<br>" + rs.getString(5));
				
				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getLocationsJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
	
	public JSONArray getLocationsLevelCityJSON(int level, String city) {
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT longitude, latitude, name, address, city FROM `institutions` WHERE city LIKE ? AND educLevelID = ?");
			ps.setString(1, "%" + city + "%");
			ps.setInt(2, level);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("lng", rs.getDouble(1));
				job.put("lat", rs.getDouble(2));
				job.put("info", "<b>" + rs.getString(3) + "</b><br>" + rs.getString(4) + "<br>" + rs.getString(5));
				
				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getLocationsJSON()");
			e.printStackTrace();
		}
		
		return jArray;
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
	
	public JSONArray getCitiesJSON() {
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT DISTINCT city FROM `institutions` ORDER BY city asc");
		
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("city", rs.getString(1));
				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getCitiesJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
	
	public JSONArray getInstitutionInfo(int instID){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT name, systemID, acronym, head, hPosition, contactEmail, contactNumber, website, address, educLevelID FROM `institutions` WHERE institutionID = ?");
			ps.setInt(1, instID);
		
			ResultSet rs = ps.executeQuery();
			if(rs.first()){
				job = new JSONObject();
				job.put("institutionName", rs.getString(1));
				job.put("system", getSchoolSystemName(rs.getInt(2)));
				job.put("acronym", rs.getString(3));
				job.put("head", rs.getString(4));
				job.put("hPosition", rs.getString(5));
				job.put("contactEmail", rs.getString(6));
				job.put("contactNumber", rs.getString(7));
				job.put("website", rs.getString(8));
				job.put("address", rs.getString(9));
				job.put("educLevelID", rs.getInt(10));
				
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
				temp = new Institution(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), getEducLevelName(rs.getInt(19)), rs.getDouble(20), rs.getDouble(21));;;
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
				temp = new Institution(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18), getEducLevelName(rs.getInt(19)), rs.getDouble(20), rs.getDouble(21));;;
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

	public Double getLongitude(int ID) {
		Double lng = 0.0;
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT longitude FROM institutions WHERE `institutionID` = ?");
			ps.setInt(1, ID);
			ResultSet rs = ps.executeQuery();
			if(rs.first()){
				lng = rs.getDouble(1);
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getSchoolSystemInstitutions()");
			e.printStackTrace();
		}
		
	    return lng;
	}
	
	public Double getLatitude(int ID) {
		Double lat = 0.0;
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT latitude FROM institutions WHERE `institutionID` = ?");
			ps.setInt(1, ID);
			ResultSet rs = ps.executeQuery();
			if(rs.first()){
				lat = rs.getDouble(1);
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getSchoolSystemInstitutions()");
			e.printStackTrace();
		}
		
	    return lat;
	}

	public JSONArray getAddressOfInst(int instID) {
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT address FROM `institutions` WHERE institutionID = ?");
			ps.setInt(1, instID);
		
			ResultSet rs = ps.executeQuery();
			if(rs.first()){
				job = new JSONObject();
				job.put("address", rs.getString(1));
				
				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getInstitutionsForLevelJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}

	



	
}
