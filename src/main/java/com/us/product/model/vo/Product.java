package com.us.product.model.vo;

import java.sql.Date;

public class Product {
	
	private String proCode;
	private String category;
	private String proName;
	private String proInfo;
	private String price;
	private int stock;
	private Date proEnrollDate;
	private String proImgPath;
	private String detailImgPath;
	private String reqInfoImgPath;
	private int proCount; // 조회수
	
	private int productCount; // 카테고리별 상품 개수 조회용 변수
	
	public Product() {}

	public Product(String proCode, String category, String proName, String proInfo, String price, int stock,
			Date proEnrollDate, String proImgPath, String detailImgPath, String reqInfoImgPath, int proCount) {
		super();
		this.proCode = proCode;
		this.category = category;
		this.proName = proName;
		this.proInfo = proInfo;
		this.price = price;
		this.stock = stock;
		this.proEnrollDate = proEnrollDate;
		this.proImgPath = proImgPath;
		this.detailImgPath = detailImgPath;
		this.reqInfoImgPath = reqInfoImgPath;
		this.proCount = proCount;
	}

	public Product(String proCode, String category, String proName, String price, Date proEnrollDate, String proImgPath,
			int proCount) {
		super();
		this.proCode = proCode;
		this.category = category;
		this.proName = proName;
		this.price = price;
		this.proEnrollDate = proEnrollDate;
		this.proImgPath = proImgPath;
		this.proCount = proCount;
	}

	public Product(String proCode, String category, String proName, int stock, Date proEnrollDate) {
		super();
		this.proCode = proCode;
		this.category = category;
		this.proName = proName;
		this.stock = stock;
		this.proEnrollDate = proEnrollDate;
	}

	public Product(int productCount) {
		super();
		this.productCount = productCount;
	}

	public String getProCode() {
		return proCode;
	}

	public void setProCode(String proCode) {
		this.proCode = proCode;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProInfo() {
		return proInfo;
	}

	public void setProInfo(String proInfo) {
		this.proInfo = proInfo;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public Date getProEnrollDate() {
		return proEnrollDate;
	}

	public void setProEnrollDate(Date proEnrollDate) {
		this.proEnrollDate = proEnrollDate;
	}

	public String getProImgPath() {
		return proImgPath;
	}

	public void setProImgPath(String proImgPath) {
		this.proImgPath = proImgPath;
	}

	public String getDetailImgPath() {
		return detailImgPath;
	}

	public void setDetailImgPath(String detailImgPath) {
		this.detailImgPath = detailImgPath;
	}

	public String getReqInfoImgPath() {
		return reqInfoImgPath;
	}

	public void setReqInfoImgPath(String seqInfoImgPath) {
		this.reqInfoImgPath = seqInfoImgPath;
	}

	public int getProCount() {
		return proCount;
	}

	public void setProCount(int proCount) {
		this.proCount = proCount;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	@Override
	public String toString() {
		return "Product [proCode=" + proCode + ", category=" + category + ", proName=" + proName + ", proInfo="
				+ proInfo + ", price=" + price + ", stock=" + stock + ", proEnrollDate=" + proEnrollDate
				+ ", proImgPath=" + proImgPath + ", detailImgPath=" + detailImgPath + ", reqInfoImgPath="
				+ reqInfoImgPath + ", proCount=" + proCount + "]";
	}
	
	

}
