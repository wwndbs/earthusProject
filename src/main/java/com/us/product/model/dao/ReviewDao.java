package com.us.product.model.dao;

import static com.us.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.us.common.model.vo.Attachment;
import com.us.product.model.vo.Review;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		try {
			prop.loadFromXML( new FileInputStream( ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath() ) );
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	// 마이페이지의 리뷰 리스트를 조회해오는 selectList 메소드
	public ArrayList<Review> selectList(Connection conn, int userNo){
		ArrayList<Review> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectList");
		
		System.out.println(userNo);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Review(
							rset.getInt("REV_NO"),
							rset.getInt("USER_NO"),
							rset.getString("PRO_CODE"),
							rset.getString("PRO_NAME"),
							rset.getString("PRO_IMG_PATH"),
							rset.getDate("REV_DATE"),
							rset.getInt("REV_RATE"),
							rset.getString("REV_CONTENT"),
							rset.getString("REV_IMG_PATH"),
							rset.getString("REV_TYPE")
						));
			}
			
			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public ArrayList<Attachment> selectAttachmentList(Connection conn, int userNo){
		ArrayList<Attachment> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Attachment(
							rset.getInt("REF_BNO"),
							rset.getString("CHANGE_NAME"),
							rset.getString("FILE_PATH")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	public Review checkPurchase(Connection conn, int userNo, String proCode) {
		Review r = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("checkPurchase");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, proCode);
			pstmt.setInt(2, userNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				r = new Review();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
		
	}
	
	
	public int insertReview(Connection conn, Review r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getUserNo());
			pstmt.setString(2, r.getProCode());
			pstmt.setInt(3, r.getRevRate());
			pstmt.setString(4, r.getRevContent());
			pstmt.setString(5, r.getRevType());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	

}
