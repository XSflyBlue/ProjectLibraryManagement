package com.plm.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.plm.model.UserInfo;
import com.plm.service.IUserService;
import com.plm.util.IMailService;
import com.plm.util.MailEntry;

/**
 * 前期测试相关控制器
 * @author Flyblue
 *
 */
@Controller
public class TestController {
	@Resource
	private IUserService userService;
	private UserInfo user;
	@Resource
	private IMailService mailService;
	
    @RequestMapping("/sendEmail")
    public String sendEmail(HttpServletRequest request,Model model)
            throws ServletException, IOException {
    	MailEntry mail = new MailEntry();
    	mail.setSubject("test");
    	String [] addr = new String [1];
    	addr[0] = "xsflyblue@foxmail.com";
    	try {
			mail.setRecipients(addr);
		} catch (AddressException e) {
			e.printStackTrace();
		}
    	mail.setText("你好啊");
    	mailService.sendMail(mail);
    	return "test";
    }
    
    @RequestMapping("/test")
    public String test(HttpServletRequest request,Model model)
            throws ServletException, IOException {
    	return "test";
    }
    
    //测试请求的是key/value，保存数据到request域
	@RequestMapping("/userList") 
	public String userList(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,Model model)
	{   //PageHelper.startPage(page, pageSize);这段代码表示，程序开始分页了，page默认值是1，pageSize默认是10，意思是从第1页开始，每页显示10条记录。 
		PageHelper.startPage(page, 5); 
		//查询条件有待改变
		List<UserInfo> userList = userService.selectUserAll(); 
		PageInfo<UserInfo> p= new PageInfo<UserInfo>(userList); 
		model.addAttribute("page", p); 
		model.addAttribute("userList",userList); 
		return "info"; 
	}
	
	//测试请求的是key/value，输出json（普通对象）
	@RequestMapping("/requestJson")
	public @ResponseBody UserInfo requestJson(@RequestParam(required=true,defaultValue="1") Integer id) {
		user = userService.selectUserById(1);
	    return user; //由于@ResponseBody注解，将userBase转成json格式返回
	}
}
