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

import Models.News;
import Models.Program;
import Models.SchoolSystem;
import Models.SearchResults;



public class NewsUtil {

	
	private DBUtil db;

	
	public NewsUtil(){
		db = new DBUtil();
	}
	
	
	
	
	
	public void addNews(String title, String content, String date){
		try{
			Connection conn = db.getConnection();

			PreparedStatement ps = conn.prepareStatement("INSERT INTO `news`(title, content, date) VALUES (?, ?, ?)");
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, date);
			ps.executeUpdate();			
		} catch (Exception e){
			System.out.println("Error in NewsUtil:addNews()");
			e.printStackTrace();	
		}
	}
	
	
	
	public void deleteNews(int newsID){
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("DELETE from news WHERE newsID = ?");
			ps.setInt(1, newsID);
			ps.executeUpdate();
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:deleteInstitution()");
			e.printStackTrace();
		}		
		
	}
	
	
	
	public News getNews(int newsID){
		News temp = new News();
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM news WHERE newsID=?");
			ps.setInt(1, newsID);
			ResultSet rs = ps.executeQuery();
			rs.next();
			temp = new News(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4));
		} catch (Exception e){
			System.out.println("Error in NewsUtil:getNews()");
			e.printStackTrace();
		}
		
	    return temp;
	}
	
	public JSONArray getNewsInPageJSON(int page, int year){
		
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
		
			if(year==0)
			{
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM `news` ORDER BY `date` desc LIMIT ?, ?");
				
				ps.setInt(1, (page-1)*5);
				ps.setInt(2, (page-1)*5+5);
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					job = new JSONObject();
					job.put("newsID", rs.getInt(1));
					job.put("title", rs.getString(2));
					job.put("content", rs.getString(3));
					job.put("date", rs.getString(4));
					
					

					jArray.put(job);
					
				}	
			}
			else
			{
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM `news` WHERE `date` LIKE ? ORDER BY `date` desc LIMIT ?, ?");
				

				ps.setString(1, String.valueOf(year) + "%");
				ps.setInt(2, (page-1)*5);
				ps.setInt(3, (page-1)*5+5);
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					job = new JSONObject();
					job.put("newsID", rs.getInt(1));
					job.put("title", rs.getString(2));
					job.put("content", rs.getString(3));
					job.put("date", rs.getString(4));
					
					

					jArray.put(job);
					
				}
			}
			
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getAllInstitutionsJSON()");
			e.printStackTrace();
		}
		
		return jArray;
		
	}
	
	public void updateNews(int newsID, String title, String content, String date){

		try{

			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE news SET newsID=?, title=?, content=?, date=? WHERE newsID=?");
		
			ps.setInt(1, newsID);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.setString(4, date);
			ps.setInt(5, newsID);
		
		    ps.executeQuery();
			
			
		} catch (Exception e){
			System.out.println("Error in NewsUtil:getNews()");
			e.printStackTrace();
		}
		
	
	}
	
	
	

	public ArrayList<News> getAllNews(){
		ArrayList<News> news = new ArrayList<News>();
		News temp = new News();
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM `news` ORDER BY `newsID`");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				temp = new News(rs.getInt(1),rs.getString(2),rs.getString(3), rs.getString(4));
				news.add(temp);
			}
		} catch (Exception e){
			System.out.println("Error in NewsUtil:getAllNews()");
			e.printStackTrace();
		}
		
	    return news;
	}
		
	
	
	

	public JSONArray getAllNewsJSON(){
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM `news` ORDER BY `newsID`");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("newsID", rs.getInt(1));
				job.put("title", rs.getString(2));
				job.put("content", rs.getString(3));
				job.put("date", rs.getString(4));
				
				

				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getAllInstitutionsJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
	
	public int getTotalCountNews(int year){
		int count = 0;
		try{
			Connection conn = db.getConnection();
			
			if(year==0)
			{
				PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM news");
				ResultSet rs = ps.executeQuery();
				rs.next();
				count = rs.getInt(1);
			}
			else
			{
				
				PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM news WHERE date LIKE ?");
				ps.setString(1, year + "%");
				ResultSet rs = ps.executeQuery();
				rs.next();
				count = rs.getInt(1);
			}
		} catch (Exception e){
			System.out.println("Error in NewsUtil:getCountNews()");
			e.printStackTrace();
		}
		
	    return count;
	}
	
	

	public SearchResults getNewsResults(String searchWord)
	{
		SearchResults temp = null;
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT title, content, newsID FROM `news` WHERE title LIKE ? OR content LIKE ?");
			ps.setString(1, "%" + searchWord + "%");
			ps.setString(2, "%" + searchWord + "%");
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.first())
				if(rs.getString(2).length() > 430)
					temp = new SearchResults(rs.getString(1), rs.getString(2).substring(0, 430) + "...", "ViewNews?newsID=" + rs.getInt(3), "News");
				
				else
					temp = new SearchResults(rs.getString(1), rs.getString(2), "ViewNews?newsID=" + rs.getInt(3), "News");
		
		} catch (Exception e){
			System.out.println("Error in NewsUtil:getNewsResults()");
			e.printStackTrace();
		}
		
		return temp;
	}





	public JSONArray getNewsYearsJSON() {
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT DISTINCT LEFT(date, 4) FROM news ORDER BY LEFT(date, 4) DESC");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("year", rs.getString(1));
				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in InstitutionsUtil:getAllInstitutionsJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
	
}
