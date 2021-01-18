package com.others;

import java.util.Date;

import java.util.Properties;

import java.text.ParseException;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class EmailSender {
	/**
	 * Utility method to send simple HTML email
	 * @param session
	 * @param toEmail
	 * @param subject
	 * @param body
	 */
	public static void sendEmail(Session session, String toEmail, String subject, String body){
		try
	    {
	      MimeMessage msg = new MimeMessage(session);
	      //set message headers
	      msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
	      msg.addHeader("format", "flowed");
	      msg.addHeader("Content-Transfer-Encoding", "8bit");

	      msg.setFrom(new InternetAddress("samaanadaeman@gmail.com", "Travel.com"));
	     
	      msg.setSubject(subject, "UTF-8");

	      msg.setText(body, "UTF-8");

	      msg.setSentDate(new Date());

	      msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
	      System.out.println("Message is ready");
    	  Transport.send(msg);  

	      System.out.println("EMail Sent Successfully!!");
	    }
	    catch (Exception e) {
	      e.printStackTrace();
	    }
	}
	public static void sendMail(String mail) {
		final String fromEmail = "samaanadaeman@gmail.com"; //requires valid gmail id
		final String password = "NESR1_eman"; // correct password for gmail id
		final String toEmail = "eman.talha2000@gmail.com"; // can be any email id 
		
		System.out.println("TLSEmail Start");
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
		props.put("mail.smtp.port", "587"); //TLS Port
		props.put("mail.smtp.auth", "true"); //enable authentication
		props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
	            //create Authenticator object to pass in Session.getInstance argument
		Authenticator auth = new Authenticator() {
			//override the getPasswordAuthentication method
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		};
		Session session = Session.getInstance(props, auth);
		
		sendEmail(session, toEmail,"Forrget Password", mail);
	}
public static void SendPasswordMail(String toemail , String mail) {
	
	final String fromEmail = "samaanadaeman@gmail.com"; //requires valid gmail id
	final String password = "NESR1_eman"; // correct password for gmail id
	final String toEmail = toemail; // can be any email id 
	
	System.out.println("TLSEmail Start");
	Properties props = new Properties();
	props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
	props.put("mail.smtp.port", "587"); //TLS Port
	props.put("mail.smtp.auth", "true"); //enable authentication
	props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
	props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	
	Authenticator auth = new Authenticator() {
		
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(fromEmail, password);
		}
	};
	Session session = Session.getInstance(props, auth);
	
	sendEmail(session, toEmail,"Account Password", mail);
	
}

public static void SendCancelMail( String mail, String toEmail) {

	

	final String fromEmail = "samaanadaeman@gmail.com"; //requires valid gmail id

	final String password = "NESR1_eman"; // correct password for gmail id

	//final String toEmail = "nadagmel0bra@gmail.com"; // can be any email id 
	

	System.out.println("TLSEmail Start");

	Properties props = new Properties();

	props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host

	props.put("mail.smtp.port", "587"); //TLS Port

	props.put("mail.smtp.auth", "true"); //enable authentication

	props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

	props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

	

	Authenticator auth = new Authenticator() { 

		

		protected PasswordAuthentication getPasswordAuthentication() {

			return new PasswordAuthentication(fromEmail, password);

		}

	};
	
	Session session = Session.getInstance(props, auth);
	sendEmail(session, toEmail,"Client Cancellation", mail);

}

public static void main(String[] args) {
		
	final String fromEmail = "samaanadaeman@gmail.com"; //requires valid gmail id
	final String password = "NESR1_eman"; // correct password for gmail id
	final String toEmail = "nadagmel0bra@gmail.com"; // can be any email id 
	
	System.out.println("TLSEmail Start");
	Properties props = new Properties();
	props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
	props.put("mail.smtp.port", "587"); //TLS Port
	props.put("mail.smtp.auth", "true"); //enable authentication
	props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
	props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	
	Authenticator auth = new Authenticator() {
		
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(fromEmail, password);
		}
	};
	Session session = Session.getInstance(props, auth);
	
	sendEmail(session, toEmail,"Test 7aga kda", "Dear Nada,\nHello from eclipse");
	
}

}
