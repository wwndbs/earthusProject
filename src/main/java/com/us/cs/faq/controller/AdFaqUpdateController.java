package com.us.cs.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.cs.faq.model.service.FaqService;
import com.us.cs.faq.model.vo.Faq;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class AdFaqUpdateController
 */
@WebServlet("/adUpdate.fq")
public class AdFaqUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdFaqUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 전달값
		int fNo = Integer.parseInt(request.getParameter("fNo"));
		String csCate = request.getParameter("csCate");
		String fTitle = request.getParameter("fTitle");
		String fContent = request.getParameter("fContent");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String fWriter = Integer.toString(loginUser.getUserNo());
		
		Faq f = new Faq(fNo, fWriter, csCate, fTitle, fContent);
		
		int result = new FaqService().updateFaq(f);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/adUpdateForm.fq?fNo=" + fNo);
		} else {
			session.setAttribute("modalMsg", "자주 묻는 질문 수정에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorModal.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
