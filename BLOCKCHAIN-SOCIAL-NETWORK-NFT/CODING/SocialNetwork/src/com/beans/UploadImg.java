package com.beans;


public class UploadImg {
	private int img_id;
	private String img_name;
	private String cat;
	private String username;
	private byte[] path;
	public int getImg_id() {
		return img_id;
	}
	public void setImg_id(int imgId) {
		img_id = imgId;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String imgName) {
		img_name = imgName;
	}
	public String getCat() {
		return cat;
	}
	public void setCat(String cat) {
		this.cat = cat;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public byte[] getPath() {
		return path;
	}
	public void setPath(byte[] path) {
		this.path = path;
	}
}
