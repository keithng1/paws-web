package Utilities;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Date;

import com.mysql.jdbc.Connection;

import Models.SearchResults;

public class ContactUsUtil {

	private DBUtil db;

	public ContactUsUtil() {
		db = new DBUtil();
	}
	
	
	public void submitContactUs(String name, String email, String message, String ip)
	{
		Connection conn = db.getConnection();
		
		try{
			conn.setAutoCommit(false);
	        PreparedStatement ps = conn.prepareStatement("INSERT INTO contactus (name, email, message, dateTime, ipAddress) VALUES (?, ?, ?, ?, ?)");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, message);
			ps.setString(4, getCurrentTimeStamp());
			ps.setString(5, ip);
			
			
			ps.executeUpdate();
			conn.commit();
	        conn.setAutoCommit(true);
			
		} catch (Exception e){
			System.out.println("Error in ContactUsUtil:submitContactUs()");
			e.printStackTrace();
		}

	    
	}


	public boolean isLastEntry(String name, String email, String message) {
		
		try{
			Connection conn = db.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT name, email, message FROM contactus WHERE contactID = (select max(contactID) from contactus)");
		
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.first())
			{
				if(!message.equalsIgnoreCase(rs.getString(3)))
				{
					if(!name.equalsIgnoreCase(rs.getString(1)))
						if(!email.equalsIgnoreCase(rs.getString(2)))
							return false;
				}
			}
			else
				return false;
			
		} catch (Exception e){
			System.out.println("Error in ContactUsUtil:isLastEntry()");
			e.printStackTrace();
		}
		return true;
	}
	
	
	public String getCurrentTimeStamp() {
		
		Instant instant = Instant.now();
		ZoneId z = ZoneId.of( "Asia/Manila" );
		ZonedDateTime zdt = instant.atZone( z );
		
	    return zdt.toString();
	}
}
