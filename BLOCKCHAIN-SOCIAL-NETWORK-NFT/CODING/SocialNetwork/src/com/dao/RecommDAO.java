package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.beans.UploadImg;
import com.db.DatabaseConnection;

public class RecommDAO extends DatabaseConnection {
	
	public static List<UploadImg> getUHRecomm(String user) throws Exception{
		List<UploadImg> list =new ArrayList<UploadImg>();
		String query ="SELECT IMG_ID,IMAGE_NAME,PATH,USERNAME FROM UPLOADED_IMAGE WHERE CATEGORY IN(SELECT CATEGORY FROM UPLOADED_IMAGE WHERE USERNAME=?)";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,user);
		ResultSet rs =ps.executeQuery();
		while(rs.next()){
			UploadImg img =new UploadImg();
			img.setImg_id(rs.getInt(1));
			img.setImg_name(rs.getString(2));
			img.setPath(rs.getBytes(3));
			img.setUsername(rs.getString(4));
			list.add(img);
		}
		return list;
	}
	;
	
	public static List<UploadImg> getLIRecomm(String user) throws Exception{
		List<UploadImg> list =new ArrayList<UploadImg>();
		String query ="SELECT IMG_ID,IMAGE_NAME,PATH,USERNAME FROM UPLOADED_IMAGE WHERE CATEGORY IN(SELECT CATEGORY FROM UPLOADED_IMAGE WHERE IMG_ID IN(SELECT IMAGE_ID FROM IMAGE_LIKES WHERE LIKE_BY=?))";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,user);
		ResultSet rs =ps.executeQuery();
		while(rs.next()){
			UploadImg img =new UploadImg();
			img.setImg_id(rs.getInt(1));
			img.setImg_name(rs.getString(2));
			img.setPath(rs.getBytes(3));
			img.setUsername(rs.getString(4));
			list.add(img);
		}
		return list;
	}
	public static List<UploadImg> getRLRecomm(String user) throws Exception{
		List<UploadImg> list =new ArrayList<UploadImg>();
		String query ="SELECT IMG_ID,IMAGE_NAME,PATH,USERNAME FROM UPLOADED_IMAGE WHERE CATEGORY IN(SELECT CATEGORY FROM UPLOADED_IMAGE WHERE IMG_ID IN(SELECT IMAGE_ID FROM IMAGE_RATING WHERE RATE_BY=? AND RATING>3))";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,user);
		ResultSet rs =ps.executeQuery();
		while(rs.next()){
			UploadImg img =new UploadImg();
			img.setImg_id(rs.getInt(1));
			img.setImg_name(rs.getString(2));
			img.setPath(rs.getBytes(3));
			img.setUsername(rs.getString(4));
			list.add(img);
		}
		return list;
	}
}
