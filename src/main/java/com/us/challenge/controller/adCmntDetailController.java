package com.us.challenge.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.us.challenge.model.service.ChallengeService;
import com.us.challenge.model.vo.Challenge;
import com.us.challenge.model.vo.Comment;
import com.us.common.model.vo.PageInfo;
import com.us.member.model.vo.Member;

/**
 * Servlet implementation class adCmntDetailController
 */
@WebServlet("/adCmntDetail.ch")
public class adCmntDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adCmntDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int challNo = Integer.parseInt(request.getParameter("no"));

		// * 페이징 처리
		int listCount = new ChallengeService().selectCmntCount(challNo); // 현재 게시글 내 댓글의 총 갯수
		int currentPage = Integer.parseInt(request.getParameter("cpage")); // 사용자가 보게 될 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit = 3; // 페이징바의 페이지 최대 갯수 (몇 개 단위씩)		
		int boardLimit = 5; // 한 페이지당 보여질 게시글의 최대 갯수 (몇 개 단위씩)
		
		int maxPage = (int)Math.ceil( (double)listCount / boardLimit ); // 제일 마지막 페이지 수 (총 페이지 수)
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1; // 페이징바의 시작 수
		int endPage = startPage + pageLimit - 1; // 페이징바의 끝 수

		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		// * 현재 요청한 페이지(currentPage)에 보여질 댓글 리스트 조회 (boardLimit수만큼 조회)
		ArrayList<Comment> list = new ChallengeService().selectCmntList(challNo, pi);
		
		// * 클릭한 챌린지 게시글 정보 조회
		Challenge ch = new ChallengeService().selectChall(challNo);
		
		if(loginUser == null) {
			response.sendRedirect(request.getContextPath() + "/goLogin.me");
		} else {
			request.setAttribute("ch", ch);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/challenge/adCmntDetailView.jsp").forward(request, response);
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