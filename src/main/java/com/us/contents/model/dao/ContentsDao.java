package com.us.contents.model.dao;

import static com.us.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.us.common.model.vo.Attachment;
import com.us.contents.model.vo.Contents;

public class ContentsDao {

	private Properties prop = new Properties();
	
	public ContentsDao() {
		try {
			prop.loadFromXML(new FileInputStream( ContentsDao.class.getResource("/db/sql/contents-mapper.xml").getPath() ));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertContents(Connection conn, Contents c) {
		// contents에 insert => 처리된 행수(한 행)
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertContents");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getCntTitle());
			pstmt.setString(2, c.getCntContent());
			pstmt.setString(3, c.getCntThumbnail());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertAttachment(Connection conn, Attachment at) {
		// attachment에 insert => 처리된 행수(한 행)
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
}
