package com.plm.util;

import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

/**
* 项目中已弃用
* @ClassName: SendEmail
* @Description: SendEmail类继承Thread，因此SendEmail就是一个线程类，
*               这个线程类用于给指定的用户发送Email
*
*/ 
public class SendEmail extends Thread {
        //用于给用户发送邮件的邮箱
    private String from = "xsflyblue@163.com";
        //邮箱的用户名
    private String username = "xsflyblue";
        //邮箱的密码
    private String password = "3GjXMRm8J84ZBG82";
        //发送邮件的服务器地址
    private String host = "smtp.163.com";
        //服务器端口
    private String port = "465";
        //收件人地址
    private String toAddr;
        //邮件主题
    private String subject;
        //邮件正文
    private String content;

    /**
     * 
     * @param toAddr
     */
	public SendEmail() {
		this.toAddr =  "xsflyblue@foxmail.com";
		this.subject = "无题";
		this.content = "这是一条测试邮件";
	}
    
	/**
	 * 
	 * @param toAddr 收件人地址
	 * @param subject 邮件主题
	 * @param content 邮件正文
	 */
	public SendEmail(String toAddr, String subject, String content) {
		this.toAddr = toAddr;
		this.subject = subject;
		this.content = content;
	}
    
    /* 重写run方法的实现，在run方法中发送邮件给指定的用户
     * @see java.lang.Thread#run()
     */
    @Override
    public void run() {
        try{
            Properties prop = new Properties();
            prop.setProperty("mail.host", host);
            prop.setProperty("mail.transport.protocol", "smtp");
            prop.setProperty("mail.smtp.auth", "true");
            prop.setProperty("mail.smtp.port", port);
            
            //使用SSL，企业邮箱必需！
            //开启安全协议
            MailSSLSocketFactory sf = null;
            try {
                sf = new MailSSLSocketFactory();
                sf.setTrustAllHosts(true);
            } catch (GeneralSecurityException e1) {
                e1.printStackTrace();
            }
            prop.put("mail.smtp.ssl.enable", "true");
            prop.put("mail.smtp.ssl.socketFactory", sf);
            
            Session session = Session.getDefaultInstance(prop,new Authenticator(){
	             protected PasswordAuthentication getPasswordAuthentication() {
	                 return new PasswordAuthentication(username, password);
	             }});  //获得一个默认会话session 
            
            session.setDebug(true);
            Message message = createEmail(session);
            Transport.send(message);
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    /**
    * @Method: createEmail
    * @Description: 创建要发送的邮件
    *
    * @param session
    * @param user
    * @return
    * @throws Exception
    */ 
    public Message createEmail(Session session) throws Exception{
        
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(toAddr));
        message.setSubject(subject);
        message.setContent(content, "text/html;charset=UTF-8");
        message.saveChanges();
        return message;
    }
}