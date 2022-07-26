package com.us.challenge.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.us.challenge.model.service.ChallengeService;
import com.us.challenge.model.vo.Challenge;
import com.us.common.model.vo.Attachment;
import com.us.contents.model.vo.Contents;

/**
 * Servlet implementation class ChallDetailController
 */
@WebServlet("/detail.ch")
public class ChallDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int challNo = Integer.parseInt(request.getParameter("no"));
		
		ChallengeService cs = new ChallengeService();
		
		// 1) 조회수 증가
		int result = cs.increaseCount(challNo);
		
		if(result > 0) { // 성공 => 조회 가능한 글 맞음
			
			// 2) 게시글 데이터 조회(이전글, 다음글 번호 포함)
			Challenge ch = cs.selectChall(challNo);

			// 3) 상세 이미지 첨부파일 조회
			Attachment at = cs.selectAttachment(challNo);
			
			// 4) 이전 글, 다음 글 데이터 조회
			Challenge prev = cs.selectPrevNextChall(ch.getPrevNo());
			Challenge next = cs.selectPrevNextChall(ch.getNextNo());	
			
			request.setAttribute("ch", ch);
			request.setAttribute("at", at);
			request.setAttribute("prev", prev);
			request.setAttribute("next", next);
			request.getRequestDispatcher("views/challenge/challDetailView.jsp").forward(request, response);
			
		}else { // 실패 => 유효한 글번호가 아니거나 삭제될 글번호 => 조회 불가능
			request.getSession().setAttribute("modalMsg", "유효한 글이 아닙니다.");
			request.getRequestDispatcher("views/common/errorModal.jsp").forward(request, response);
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
