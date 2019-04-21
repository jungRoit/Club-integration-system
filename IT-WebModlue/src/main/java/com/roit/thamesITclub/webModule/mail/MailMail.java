/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.roit.thamesITclub.webModule.mail;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.MailParseException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

/**
 *
 * @author User
 */
public class MailMail {

    private JavaMailSender sender;
    private MailSender mailSender;

    public void setMailSender(MailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendMail(String to, String subject, String msg) {

        SimpleMailMessage message = new SimpleMailMessage();

        message.setTo(to);
        message.setSubject(subject);
        message.setText(msg);
        mailSender.send(message);
    }
    
     public void sendMailToALl(String[] mailingList, String subject, String msg) {

        SimpleMailMessage message = new SimpleMailMessage();
        
        

        message.setTo(mailingList);
        message.setSubject(subject);
        message.setText(msg);
        mailSender.send(message);
    }
    
    
    

   public void sendAttached(String to ,String subject, String msg) {

	   MimeMessage message = sender.createMimeMessage();

	   try{
		MimeMessageHelper helper = new MimeMessageHelper(message, true);

		
		helper.setTo(new InternetAddress(to));
		helper.setSubject(subject);
		helper.setText(msg,true);
                sender.send(message);

	     }catch (MessagingException e) {
		throw new MailParseException(e);
	     }
	     
   }
   
   
}
