package com.us.product.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.us.common.JDBCTemplate.*;
import com.us.product.model.vo.Cart;

public class CartDao {
	
	private Properties prop = new Properties();
	
	public CartDao() {
		try {
			prop.loadFromXML(new FileInputStream( CartDao.class.getResource("/db/sql/cart-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Cart> selectList(Connection conn, int userNo){
		ArrayList<Cart> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Cart(userNo,
								  rset.getString("PRO_CODE"),
								  rset.getString("PRO_NAME"),
								  rset.getInt("PRICE"),
								  rset.getInt("PRO_QTY"),
								  rset.getDate("ADD_DATE")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;		
	}
	
	
	public int deleteSelected(Connection conn, int userNo, String proCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteSelected");
		
		// 동적 SQL문
		sql += "AND PRO_CODE IN(";
		
		String[] proCodes = proCode.split(",");
		for(int i=0; i<proCodes.length; i++) {
			sql += proCodes[i];
			if(i != proCodes.length - 1) {
				sql += ",";
			}
		}
		sql += ")";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;		
	}
	
	
	public int updateQuantity(Connection conn, int userNo, String proCode, int proQty) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateQuantity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proQty);
			pstmt.setInt(2, userNo);
			pstmt.setString(3, proCode);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;		
		
		
		
	}
	

}
