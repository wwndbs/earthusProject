package com.us.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.product.model.service.CartService;

/**
 * Servlet implementation class AjaxCartUpdateController
 */
@WebServlet("/update.ct")
public class AjaxCartUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCartUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달받은 userNo, proCode, proQty를 Service > Dao로 전달
		// CART 테이블에 DELETE문을 수행
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String proCode = request.getParameter("proCode");
		int proQty = Integer.parseInt(request.getParameter("proQty"));
		
		int result = new CartService().updateQuantity(userNo, proCode, proQty);
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
