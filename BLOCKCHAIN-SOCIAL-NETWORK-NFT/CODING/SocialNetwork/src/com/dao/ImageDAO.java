package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.beans.UploadImg;
import com.db.DatabaseConnection;

public class ImageDAO extends DatabaseConnection{
	
	public static int addType(String type) throws Exception{
		String query ="INSERT INTO IMAGE_TYPE VALUES(?)";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,type);
		return ps.executeUpdate();
	}
	
	public static int addImgCat(String type,String cat) throws Exception{
		String query ="INSERT INTO IMAGE_CATEGORY VALUES(?,?)";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,cat);
		ps.setString(2,type);
		return ps.executeUpdate();
	}
	
	public static List<String> getTypes() throws Exception{
		List<String> list =new ArrayList<String>();
		String query ="SELECT TYPE FROM IMAGE_TYPE";
		ResultSet rs =connection.createStatement().executeQuery(query);
		while(rs.next())
			list.add(rs.getString(1));
		return list;
	}
	public static List<List<String>> getCategory() throws Exception{
		List<List<String>> l=new ArrayList<List<String>>(); 
		String query ="SELECT CATEGORY,TYPE FROM IMAGE_CATEGORY";
		ResultSet rs =connection.createStatement().executeQuery(query);
		while(rs.next()){
			List<String> list =new ArrayList<String>();
			list.add(rs.getString(1));
			list.add(rs.getString(2));
			l.add(list);
		}
		return l;
	}
	public static List<String> getCat() throws Exception{
		List<String> list =new ArrayList<String>();
		String query ="SELECT CATEGORY FROM IMAGE_CATEGORY";
		ResultSet rs =connection.createStatement().executeQuery(query);
		while(rs.next())
			list.add(rs.getString(1));
		return list;
	}
	
	public static int uploadImage(UploadImg img) throws Exception{
		String query="INSERT INTO UPLOADED_IMAGE(IMG_ID,IMAGE_NAME,CATEGORY,USERNAME,PATH) VALUES(?,?,?,?,?)";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setInt(1,img.getImg_id());
		ps.setString(2,img.getImg_name());
		ps.setString(3,img.getCat());
		ps.setString(4,img.getUsername());
		ps.setBytes(5,img.getPath());
		return ps.executeUpdate();
	}
	
	public static List<UploadImg> getImages(String user) throws Exception{
		List<UploadImg> list =new ArrayList<UploadImg>();
		String query ="SELECT IMG_ID,IMAGE_NAME,CATEGORY,PATH FROM UPLOADED_IMAGE WHERE USERNAME=?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,user);
		ResultSet rs =ps.executeQuery();
		while(rs.next()){
			UploadImg img =new UploadImg();
			img.setImg_id(rs.getInt(1));
			img.setImg_name(rs.getString(2));
			img.setCat(rs.getString(3));
			img.setPath(rs.getBytes(4));
			img.setUsername(user);
			list.add(img);
		}
		return list;
	}
	public static int getLikes(int Img_id) throws Exception{
		String query ="SELECT COUNT(*) FROM IMAGE_LIKES WHERE IMAGE_ID=?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setInt(1,Img_id);
		ResultSet rs =ps.executeQuery();
		rs.next();
		return rs.getInt(1);
	}
	public static boolean isLiked(int img_id,String user) throws Exception{
		String query ="SELECT COUNT(*) FROM IMAGE_LIKES WHERE LIKE_BY=? AND IMAGE_ID=?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,user);
		ps.setInt(2,img_id);
		ResultSet rs =ps.executeQuery();
		rs.next();
		if(rs.getInt(1)>0)
			return true;
		else 
			return false;
	}
	
	public static int like(int img_id,String user)throws Exception{
		String query="INSERT INTO IMAGE_LIKES(IMAGE_ID,LIKE_BY) VALUES(?,?)";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setInt(1,img_id);
		ps.setString(2,user);
		return ps.executeUpdate();
	}
	public static String getImgUser(int img_id) throws Exception{
			String query="SELECT USERNAME FROM UPLOADED_IMAGE WHERE IMG_ID=?";
			PreparedStatement ps =connection.prepareStatement(query);
			ps.setInt(1,img_id);
			ResultSet rs =ps.executeQuery();
			if(rs.next())
				return rs.getString(1);
			else 
				return null;
	}
	
	public static int rate(int img_id,String by,int rating) throws Exception{
		String query ="INSERT INTO IMAGE_RATING(IMAGE_ID,RATING,RATE_BY) VALUES(?,?,?)";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setInt(1,img_id);
		ps.setInt(2,rating);
		ps.setString(3,by);
		return ps.executeUpdate();
	}
	public static float getRating(int img_id) throws Exception{
		String query ="SELECT RATING FROM IMAGE_RATING WHERE IMAGE_ID=?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setInt(1,img_id);
		ResultSet rs =ps.executeQuery();
		int count=0;
		int rate=0;
		while(rs.next()){
			++count;
			rate =rate+rs.getInt(1);
		}
		if(rate==0)
			return 0;
		else
			return rate/(float)count;
	}
	public static boolean isRated(String by,int img_id) throws Exception{
		String query ="SELECT COUNT(*) FROM IMAGE_RATING WHERE RATE_BY=? AND IMAGE_ID=?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,by);
		ps.setInt(2,img_id);
		ResultSet rs =ps.executeQuery();
		rs.next();
		if(rs.getInt(1)>0)
			return true;
		else 
			return false;
	}
	
	public static byte[] getImage(int id) throws Exception{
		String query ="SELECT PATH FROM UPLOADED_IMAGE WHERE IMG_ID=?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setInt(1, id);
		ResultSet rs =ps.executeQuery();
		if(rs.next())
			return rs.getBytes(1);
		else 
			return null;
	}
}
