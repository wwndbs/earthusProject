package com.us.member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class VerificationNumController
 */
@WebServlet("/veriNum.me")
public class VerificationNumController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerificationNumController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비밀번호 메일 인증
		
		request.setCharacterEncoding("UTF-8");
		
		String uEmail = request.getParameter("userMail");	// 회원 이메일
		
		// 인증번호
		Random random = new Random();
		int veriNum = random.nextInt(888888) + 111111;
		String strNum = Integer.toString(veriNum);
		
		// 페이지 이동
		
		//HttpSession session = request.getSession();
		request.setAttribute("strNum", strNum);
		request.getRequestDispatcher("/views/member/veriNum.jsp").forward(request, response);
	
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		try {
			String mailFrom = "rntnalseee@gmail.com";
			String mailTo = uEmail;
			mailFrom = new String(mailFrom.getBytes("UTF-8"), "UTF-8");
			mailTo = new String(mailTo.getBytes("UTF-8"), "UTF-8");
			
			Properties props = new Properties();
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			props.put("mail.smtp.auth", "true");
			
			Authenticator auth = new SMTPAuthenticator();
			
			Session sess = Session.getDefaultInstance(props, auth);	// 세션 생성
			
			MimeMessage msg = new MimeMessage(sess);
			
			msg.setFrom(new InternetAddress(mailFrom));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(mailTo));   
			msg.setSubject("[EarthUs] 비밀번호 인증번호 입니다.", "UTF-8");   // 발송할 메세지 제목
			msg.setContent("<br><br>인증번호 : "+ veriNum +"입니다", "text/html; charset=UTF-8");     // 발송할 메세지 내용
			msg.setHeader("Content-type", "text/html; charset=UTF-8");
			Transport.send(msg);
			
			
		} catch (MessagingException e) {
			e.printStackTrace();
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
