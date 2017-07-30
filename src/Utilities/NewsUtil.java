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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
