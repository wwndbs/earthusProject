package com.us.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.member.model.vo.Member;
import com.us.product.model.service.ProductService;
import com.us.product.model.vo.Cart;

/**
 * Servlet implementation class CartInsertController
 */
@WebServlet("/insert.ca")
public class CartInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		String proCode = request.getParameter("proCode");
		String proName = request.getParameter("proName");
		int price = Integer.parseInt(request.getParameter("price"));
		int proQty = Integer.parseInt(request.getParameter("proQty"));
		
		Cart c = new Cart();
		c.setUserNo(userNo);
		c.setProCode(proCode);
		c.setProName(proName);
		c.setPrice(price);
		c.setProQty(proQty);
		
		int result = new ProductService().insertCart(c);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
