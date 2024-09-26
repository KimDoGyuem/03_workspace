package com.test;

import java.sql.ResultSet;
import java.util.ArrayList;

public class Dao extends Da {
	public void del(String no) {
		super.connect();
		String sql = String.format("delete from %s where b_no=%s"
				, Db.TABLE_PS_BOARD_FREE,no);
		super.update(sql);
		super.close();
	}
	
	public void write(Dto d) {
		super.connect();
		String sql = String.format("insert into %s(b_title,b_id,b_text) values('%s','%s','%s')"
				, Db.TABLE_PS_BOARD_FREE,d.title,d.id,d.text);
		super.update(sql);
		super.close();
	}

	public Dto read(String no) {
		super.connect();
		Dto post = null;
		try {
			String sql= String.format("select*from %s where b_no=%s"
					, Db.TABLE_PS_BOARD_FREE,no);
			ResultSet rs = st.executeQuery(sql);
			rs.next();
			post = new Dto(
					rs.getString("B_NO"),
					rs.getString("B_TITLE"),
					rs.getString("B_ID"),
					rs.getString("B_DATETIME"),
					rs.getString("B_HIT"),
					rs.getString("B_TEXT"),
					rs.getString("B_REPLY_COUNT"),
					rs.getString("B_REPLY_ORI")
					);
		}catch(Exception e) {
			e.printStackTrace();
		}
		super.close();
		return post;
	}
	
	public ArrayList<Dto> list(String page){
		super.connect();
		ArrayList<Dto> posts = new ArrayList<>();
		try {
			int startIndex = ((Integer.parseInt(page))-1)*Board.LIST_AMOUNT;
			String sql = String.format("select*from %s limit %s,%s"
					,Db.TABLE_PS_BOARD_FREE,startIndex,Board.LIST_AMOUNT);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				posts.add(new Dto(
						rs.getString("B_NO"),
						rs.getString("B_TITLE"),
						rs.getString("B_ID"),
						rs.getString("B_DATETIME"),
						rs.getString("B_HIT"),
						rs.getString("B_TEXT"),
						rs.getString("B_REPLY_COUNT"),
						rs.getString("B_REPLY_ORI")
						));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		super.close();
		return posts;
	}
	
	public void edit(Dto d, String no) {
		super.connect();
		String sql = String.format("update %s set b_title='%s',b_text='%s' where b_no=%s"
				, Db.TABLE_PS_BOARD_FREE,d.title,d.text,no);
		super.update(sql);
		super.close();
	}
	
	public int getPostCount() {
		int count = 0;
		super.connect();
		try {
			String sql = String.format("select count(*) from %s"
					,Db.TABLE_PS_BOARD_FREE);
			ResultSet rs = st.executeQuery(sql);
			rs.next();
			count = rs.getInt("count(*)");
		}catch(Exception e) {
			e.printStackTrace();
		}
		super.close();
		return count;
	}
	
	public int getSearchPostCount(String word) {
		int count=0;
		super.connect();
		try {
			String sql = String.format("select count(*) from %s where b_title like '%%%s%%'"
					, Db.TABLE_PS_BOARD_FREE,word);
			ResultSet rs = st.executeQuery(sql);
			rs.next();
			count = rs.getInt("count(*)");
		}catch(Exception e) {
			e.printStackTrace();
		}
		super.close();
		return count;
	}
	
	public ArrayList<Dto> listSearch(String word,String page){
		super.connect();
		ArrayList<Dto> posts = new ArrayList<>();
		try {
			int startIndex = ((Integer.parseInt(page))-1)*Board.LIST_AMOUNT;
			String sql = String.format("select*from %s where b_title like '%%%s%%' limit %s,%s"
					, Db.TABLE_PS_BOARD_FREE,word,startIndex,Board.LIST_AMOUNT);
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				posts.add(new Dto(
						rs.getString("B_NO"),
						rs.getString("B_TITLE"),
						rs.getString("B_ID"),
						rs.getString("B_DATETIME"),
						rs.getString("B_HIT"),
						rs.getString("B_TEXT"),
						rs.getString("B_REPLY_COUNT"),
						rs.getString("B_REPLY_ORI")
						));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		super.close();
		return posts;
	}
	
	public int getTotalPageCount() {
		int totalPageCount = 0;
		int count = getPostCount();
		if(count%Board.LIST_AMOUNT == 0) {
			totalPageCount = count/Board.LIST_AMOUNT;
		}else {
			totalPageCount = count/Board.LIST_AMOUNT+1;
		}
		return totalPageCount;
	}
	
	public int getSearchTotalPageCount(String word) {
		int totalPageCount = 0;
		int count =getSearchPostCount(word);
		if(count%Board.LIST_AMOUNT==0) {
			totalPageCount = count/Board.LIST_AMOUNT;
		}else {
			totalPageCount = count/Board.LIST_AMOUNT+1;
		}
		return totalPageCount;
	}
}
