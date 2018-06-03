package com.plm.util;

import org.springframework.core.task.TaskExecutor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * 邮件服务实现类
 * @author Flyblue
 */
@Service("mailService")
public class MailService implements IMailService{
    @Resource
    private TaskExecutor taskExecutor;
    @Resource
    private JavaMailSender javaMailSender;

    /**
     * @desc 使用多线程发送邮件
     * @param message MimeMessage邮件封装类
     */
    private void addSendMailTask(final MimeMessage message){
        try{
            taskExecutor.execute(new Runnable() {
                public void run() {
                    javaMailSender.send(message);
                }
            });
        }catch (Exception e){
        	System.out.println("邮件转换异常,邮件详细信息为{"+e.getMessage()+"}");
        }

    }
    
	public void sendMail(MailEntry mailEntry) {
		MimeMessage message = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, false, "utf-8");
            helper.setFrom("2014214164@stu.cqupt.edu.cn");
            helper.setTo(mailEntry.getRecipients()); //收件人
//            if(ArrayUtils.isNotEmpty(mailEntry.getCarbonCopy())){
//                helper.setCc(mailEntry.getCarbonCopy()); //抄送人
//            }
            helper.setSubject(mailEntry.getSubject());
            helper.setText(mailEntry.getText(),false);//设置为TRUE则可以使用Html标记
            addSendMailTask(message);
        } catch (MessagingException e) {
        	System.out.println("邮件转换异常,邮件详细信息为{"+e.getMessage()+"}");
        }
	}
}