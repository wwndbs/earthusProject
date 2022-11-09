package com.us.member.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator{
		
	public SMTPAuthenticator() {
		super();
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		// 메일을 보낼 때 필요한 클래스
		
		String name = "rntnalseee@gmail.com";
		String pass = "wxkyzioisupehatg";
		
		return new PasswordAuthentication(name, pass);
	}

}
