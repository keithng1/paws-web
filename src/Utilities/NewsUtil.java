package Utilities;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

import com.mysql.jdbc.Connection;

import Models.News;
import Models.SearchResults;



public class NewsUtil {

	
	private DBUtil db;

	
	public NewsUtil(){
		db = new DBUtil();
	}
	
	public News getNews(int newsID){
		News temp = new News();
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM news WHERE newsID=?");
			ps.setInt(1, newsID);
			ResultSet rs = ps.executeQuery();
			rs.next();
			temp = new News(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
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
					job.put("content", rs.getString(3).replaceAll("\\<.*?>",""));
					job.put("date", rs.getString(4));
					job.put("image", rs.getString(5));
					
					

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
					job.put("content", rs.getString(3).replaceAll("\\<.*?>",""));
					job.put("date", rs.getString(4));
					job.put("image", rs.getString(5));
					
					

					jArray.put(job);
					
				}
			}
			
		} catch (Exception e){
			System.out.println("Error in NewsUtil:getNewsInPageJSON()");
			e.printStackTrace();
		}
		
		return jArray;
		
	}
	
	public ArrayList<News> getHomepageNews(){
		ArrayList<News> news = new ArrayList<News>();
		News temp = new News();
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM `news` ORDER BY `date` desc LIMIT 2");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				
				String content = rs.getString(3);
				
				String noHTMLString = content.replaceAll("\\<.*?>","");
				
				if(noHTMLString.length() > 170)
					temp = new News(rs.getInt(1),rs.getString(2),noHTMLString.substring(0, 170) + "...", rs.getString(4), "/static/" + rs.getString(5));
				
				else
					temp = new News(rs.getInt(1),rs.getString(2),noHTMLString, rs.getString(4), "/static/" + rs.getString(5));
				
				news.add(temp);
			}
		} catch (Exception e){
			System.out.println("Error in NewsUtil:getHomepageNews()");
			e.printStackTrace();
		}
		
	    return news;
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
			System.out.println("Error in NewsUtil:getNewsYearsJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}

	public JSONArray getDashboardNewsJSON() {
		JSONArray jArray = new JSONArray();
		JSONObject job = new JSONObject();
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM `news` ORDER BY `date` desc LIMIT 2");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				job = new JSONObject();
				job.put("newsID", rs.getInt(1));
				job.put("title", rs.getString(2));
				job.put("content", rs.getString(3));
				job.put("date", rs.getString(4));
				job.put("image", "/static/" + rs.getString(5));
				
				

				jArray.put(job);
				
			}
		} catch (Exception e){
			System.out.println("Error in NewsUtil:getDashboardNewsJSON()");
			e.printStackTrace();
		}
		
		return jArray;
	}
	
}
