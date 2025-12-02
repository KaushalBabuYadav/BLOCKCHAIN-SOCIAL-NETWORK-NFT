package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.beans.UserBO;
import com.db.DatabaseConnection;

import blockChain.Blockchain;

public class UserDAO extends DatabaseConnection{
	
	public static int login(String user,String pass) throws Exception{
		String query ="SELECT COUNT(*) FROM USERLIST WHERE USERNAME=? AND PASSWORD =?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,user);
		ps.setString(2,pass);
		ResultSet rs =ps.executeQuery();
		rs.next();
		return rs.getInt(1);
	}
	
	public static String getRole(String user) throws Exception{
		String query ="SELECT ROLE FROM USERLIST WHERE USERNAME=?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,user);
		ResultSet rs =ps.executeQuery();
		rs.next();
		return rs.getString(1);
	}
	
	public static int preRegister(String user,String email) throws Exception{
		String query ="INSERT INTO USER_REQUESTS(USERNAME,EMAIL) VALUES(?,?)";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,user);
		ps.setString(2,email);
		return ps.executeUpdate();
	}
	public static String getPEmail(String user)throws Exception{
		String query ="SELECT EMAIL FROM USER_REQUESTS WHERE USERNAME=?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,user);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
			return rs.getString(1);
		else
			return null;
	}
	public static int saveKey(String user,String key) throws Exception{
		String query="UPDATE USER_REQUESTS SET P_KEY =?,STATUS=1 WHERE USERNAME =?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,key);
		ps.setString(2,user);
		return ps.executeUpdate();
	}
	public static String getKey(String user) throws Exception{
		String query ="SELECT P_KEY FROM USER_REQUESTS WHERE USERNAME=?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,user);
		ResultSet rs =ps.executeQuery();
		if(rs.next())
			return rs.getString(1);
		else 
			return null;
	}
	public static List<List<String>> getUserReqs() throws Exception{
		List<List<String>> list =new ArrayList<List<String>>();
		String query="SELECT USERNAME,EMAIL,STATUS FROM USER_REQUESTS";
		ResultSet rs =connection.createStatement().executeQuery(query);
		while(rs.next()){
			List<String> l =new ArrayList<String>();
			l.add(rs.getString(1));
			l.add(rs.getString(2));
			l.add(rs.getInt(3)+"");
			list.add(l);
		}
		return list;
	}
	
	public static int register(UserBO bo) throws Exception{
		connection.setAutoCommit(false);
		String query ="INSERT INTO USERLIST(USERNAME,PASSWORD,ROLE,EMAIL) VALUES(?,?,?,?)";
		String query1 ="INSERT INTO USER_DETAILS(USERNAME,NAME,EMAIL,DOB,MOBILE,GENDER) VALUES(?,?,?,?,?,?)";
		int result=0;
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,bo.getUsername());
		ps.setString(2,bo.getPassword());
		ps.setString(3,"user");
		ps.setString(4,bo.getEmail());
		int r =ps.executeUpdate();
		if(r>0){
			PreparedStatement ps1 =connection.prepareStatement(query1);
			ps1.setString(1,bo.getUsername());
			ps1.setString(2,bo.getName());
			ps1.setString(3,bo.getEmail());
			ps1.setDate(4,bo.getDob());
			ps1.setLong(5,bo.getMobile());
			ps1.setString(6,bo.getGender());
			result =ps1.executeUpdate();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	        // Use the format() method to convert the Date object to a string
	        String dateString = sdf.format(bo.getDob());
			
			String data=bo.getUsername()+
					" ".concat(bo.getName())+
					" ".concat(bo.getEmail())+
					" ".concat(dateString)+
					" ".concat(String.valueOf(bo.getMobile()))+
					" ".concat(bo.getGender());
			
			System.out.println("msg=====>"+data);
			
			Blockchain blockchain = new Blockchain();
			blockchain.addBlock(data);			
			
			System.out.println("*****User data Stored in Block Chain******");
		}
		if(result>0){
			connection.commit();
			connection.setAutoCommit(true);
		}else{
			connection.rollback();
			connection.setAutoCommit(true);
		}
		return result;
	}
	
	public static List<UserBO> getUsers() throws Exception{
		List<UserBO> list =new ArrayList<UserBO>();
		String query ="SELECT USERNAME,NAME,EMAIL,DOB,MOBILE,GENDER FROM USER_DETAILS";
		PreparedStatement ps =connection.prepareStatement(query);
		ResultSet rs =ps.executeQuery();
		while(rs.next()){
			UserBO bo =new UserBO();
			bo.setUsername(rs.getString(1));
			bo.setName(rs.getString(2));
			bo.setEmail(rs.getString(3));
			bo.setDob(rs.getDate(4));
			bo.setMobile(rs.getLong(5));
			bo.setGender(rs.getString(6));
			list.add(bo);
		}
		return list;
	}
		
	public static UserBO getUser(String username) throws Exception{
		String query ="SELECT NAME,EMAIL,DOB,MOBILE,GENDER FROM USER_DETAILS WHERE USERNAME= ?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,username);
		ResultSet rs =ps.executeQuery();
		UserBO bo =new UserBO();
		if(rs.next()){
			bo.setUsername(username);
			bo.setName(rs.getString(1));
			bo.setEmail(rs.getString(2));
			bo.setDob(rs.getDate(3));
			bo.setMobile(rs.getLong(4));
			bo.setGender(rs.getString(5));
		}
		return bo;
	}
	
	public static int sendReq(String username,String friend)throws Exception{
		int status=0;
		String query ="INSERT INTO FRIENDLIST(USERNAME,FRIEND,REQ_STATUS) VALUES(?,?,?)";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,username);
		ps.setString(2,friend);
		ps.setInt(3, status);
		return ps.executeUpdate();
	}
	public static int insertFrnd(String user,String frnd)throws Exception{
		String query ="INSERT INTO FRIENDLIST(USERNAME,FRIEND,REQ_STATUS) VALUES(?,?,1)";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,user);
		ps.setString(2,frnd);
		return ps.executeUpdate();
	}
	public static List<String> getFriends(String username) throws Exception{
		List<String> list =new ArrayList<String>();
		String query ="SELECT FRIEND FROM FRIENDLIST WHERE REQ_STATUS=1 AND USERNAME=?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,username);
		ResultSet rs =ps.executeQuery();
		while(rs.next())
			list.add(rs.getString(1));
		return list;
	}
	
	
	public static List<String> getFriendSugg(String user) throws Exception{
		List<String> list  =new ArrayList<String>();
		String query ="SELECT USERNAME FROM USER_DETAILS WHERE USERNAME NOT IN(SELECT FRIEND FROM FRIENDLIST WHERE USERNAME=?) AND USERNAME NOT IN(SELECT USERNAME FROM FRIENDLIST WHERE FRIEND=?)";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,user);
		ps.setString(2,user);
		ResultSet rs =ps.executeQuery();
		while(rs.next())
			list.add(rs.getString(1));
		return list;
	}
	public static String getEmail(String user) throws Exception{
		String query ="SELECT EMAIL FROM USER_DETAILS WHERE USERNAME=?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,user);
		ResultSet rs =ps.executeQuery();
		if(rs.next())
			return rs.getString(1);
		else
			return null;
	}

	public static List<String> getReq(String user) throws Exception{
		List<String> list =new ArrayList<String>();
		String query ="SELECT USERNAME FROM FRIENDLIST WHERE FRIEND='"+user+"' AND REQ_STATUS=0";
		PreparedStatement ps =connection.prepareStatement(query);
		//ps.setString(1,user);
		ResultSet rs =ps.executeQuery();
		while(rs.next())
			list.add(rs.getString(1));
		return list;
	}
	public static int acceptReq(String user,String frnd) throws Exception{
		String query ="UPDATE FRIENDLIST SET REQ_STATUS=1 WHERE USERNAME=? AND FRIEND =?";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,frnd);
		ps.setString(2,user);
		int r= ps.executeUpdate();
		if(r>0)
			insertFrnd(user, frnd);
		return r;
	}
	
	public static int createNotfication(String username,String msg) throws Exception{
		
		String query= "INSERT INTO NOTIFICATIONS(USERNAME,MESSAGE) VALUES(?,?)";
		PreparedStatement ps =connection.prepareStatement(query);
		
		ps.setString(1, username);
		ps.setString(2, msg);
		return ps.executeUpdate();
	}
	public static List<String> getNotification(String user) throws Exception{
		List<String> list =new ArrayList<String>();
		String query="SELECT MESSAGE FROM NOTIFICATIONS WHERE USERNAME=? ORDER BY ID DESC";
		PreparedStatement ps =connection.prepareStatement(query);
		ps.setString(1,user);
		ResultSet rs =ps.executeQuery();
		while(rs.next())
			list.add(rs.getString(1));
		return list;
	}
	
}
