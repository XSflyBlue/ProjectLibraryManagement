package com.plm.controller;

import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.plm.model.ProjectUser;
import com.plm.model.UserInfo;
import com.plm.service.IProjectBaseService;
import com.plm.service.IUserService;
import com.plm.util.IMailService;
import com.plm.util.MD5Utils;
import com.plm.util.MailEntry;
import com.plm.util.PasswordUtils;
import com.plm.util.StringUtils;

/**
 * 用户相关控制器
 * @author Flyblue
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private IUserService userService;
	private UserInfo user;
	@Resource
	private IMailService mailService;
	@Resource
	private IProjectBaseService projectBaseService;
	
	/**
	 * 登陆页面跳转
	 * @param request
	 * @param model
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/login")
    public String login(HttpServletRequest request,Model model)
            throws ServletException, IOException {
		HttpSession session = request.getSession();
		user = (UserInfo) session.getAttribute("user");
		if(user != null) {
			session.removeAttribute("user");
		}
    	return "login";
    }
	
	/**
	 * 登陆验证
	 * @param request
	 * @param model
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpServletRequest request, Model model) throws ServletException, IOException {
		// 跳转页面URL
		String url = "";
		request.getSession().removeAttribute("info");
		HttpSession session = request.getSession();
		user = (UserInfo) session.getAttribute("user");
		
		if (user == null) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String verifyCode = request.getParameter("verifyCode");
			String code = (String) request.getSession().getAttribute("code");
			if(!StringUtils.isNotNullString(username,password,verifyCode)) {
//				model.addAttribute("info", "请正确输入用户名和密码");
				url = "redirect:/user/login";
				return url;
			}
			if(!verifyCode.equalsIgnoreCase(code)) {
				model.addAttribute("uname", username);
				model.addAttribute("info", "验证码验证失败");
				url = "login";
				return url;
			}
			// 编译正则表达式
			String regEx = "^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.[a-zA-Z0-9]{2,6}$";
			Pattern pattern = Pattern.compile(regEx);
			// 匹配正则
			Matcher matcher = pattern.matcher(username);
			if (matcher.matches()) {
				// 登陆用户名为邮箱
				user = userService.selectUserByEmail(username);
			} else {
				// 登陆用户名为用户名
				user = userService.selectUserByUsename(username);
			}
			if (user == null) {// 用户不存在
				model.addAttribute("info", "用户不存在");
				model.addAttribute("uname", username);
				url = "login";
				return url;
			} else {
				// 验证密码
				if (!user.getuPassword().equals(MD5Utils.stringEncoder(password))) {
					// 验证失败
					model.addAttribute("info", "用户名或密码错误");
					model.addAttribute("uname", username);
					url = "login";
					return url;
				}
				if(user.getStatus()!=1) {
					model.addAttribute("info", "账号未激活，请联系管理员进行激活");
					url = "login";
					return url;
				}
				// 验证成功
				session.removeAttribute("code");
				session.setAttribute("user", user);
			}
		}
		// 验证角色
		switch (user.getRole()) {
		case 0:
			// "0"超级管理员
			url = "admin/index";
			break;
		case 1:
		case 2:
			// "1"学院教务部门管理员、"2"学院或系管理员
			url = "manager/index";
			break;
		case 3:
		case 4:
			// "3"评审专家、"4"指导教师
			url = "tutor/index";
			break;
		case 5:
			// "5"学生
			url = "student/index";
			break;
		}
		return url;
	}
	
	/**
	 * 注销登陆
	 * @param request
	 * @param model
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/logout")
    public String logout(HttpServletRequest request,Model model)
            throws ServletException, IOException {
		HttpSession session = request.getSession();
		user = (UserInfo) session.getAttribute("user");
		if(user != null) {
			session.removeAttribute("user");
		}
    	return "redirect:/";
    }
	
	@RequestMapping("/register")
    public String register(HttpServletRequest request,Model model)
            throws ServletException, IOException {
    	return "register";
    }
	
	/**
	 * 注册验证
	 * @param request
	 * @param model
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/registerCheck")
    public String registerCheck(HttpServletRequest request,Model model)
            throws ServletException, IOException {
		//获取表单参数
		String uName = request.getParameter("uName");
		String uRealname = request.getParameter("uRealname");
		String uPassword = request.getParameter("uPassword");
		String sex = request.getParameter("sex");
		String email = request.getParameter("email");
		String uCode = request.getParameter("uCode");
		String userType = request.getParameter("userType");
		
		//表单参数判空
		if(!StringUtils.isNotNullString(uName,uRealname,uPassword,email,uCode,userType)) {
			model.addAttribute("info", "传参不完整");
			model.addAttribute("uName", uName);
			model.addAttribute("uRealname", uRealname);
			model.addAttribute("email", email);
			model.addAttribute("uCode", uCode);
			return "register";
		}
		
		//封装用户对象
		user = new UserInfo();
		user.setuName(uName);
		user.setuPassword(MD5Utils.stringEncoder(uPassword));
		user.setuRealname(uRealname);
		user.setGender(Integer.parseInt(sex));
		user.setEmail(email);
		user.setuCode(uCode);
		user.setStatus(0);//未激活
		if(userType.equals("0")) {
			user.setRole(5);//学生
		}else {
			user.setRole(4);//指导教师
		}
		//判断数据库中是否存在相同用户名或邮箱
		if(userService.selectUserByUsename(uName)!=null) {
			model.addAttribute("info", "该用户名已存在");
			model.addAttribute("uRealname", uRealname);
			model.addAttribute("email", email);
			model.addAttribute("uCode", uCode);
		}else if(userService.selectUserByEmail(email)!=null){
			model.addAttribute("info", "该email已存在");
			model.addAttribute("uName", uName);
			model.addAttribute("uRealname", uRealname);
			model.addAttribute("uCode", uCode);
		}else {
			// 进入详细资料页面
			if(userType.equals("0")) {
				//学生
				//写入数据库
				if(userService.insertUserSelective(user)!=1) {
			    	model.addAttribute("info", "服务器错误，修改失败");
			    	// 返回主页
			    	return "info";
				}else {
					user = userService.selectUserByEmail(email);
					request.getSession().setAttribute("userNew", user);
				}
			}else {
				//指导教师
				//写入数据库
				if(userService.insertUserSelective(user)!=1) {
			    	model.addAttribute("info", "服务器错误，修改失败");
			    	// 返回主页
			    	return "info";
				}else {
					user = userService.selectUserByEmail(email);
					request.getSession().setAttribute("userNew", user);
				}
			}
			return "register-detail";
		}
		return "register";
    }

	@RequestMapping("/registerDetail")
    public String registerDetail(HttpServletRequest request,Model model)
            throws ServletException, IOException {
		//获取表单参数
		String userType = request.getParameter("userType");
		//获取session
		HttpSession session = request.getSession();
		user = (UserInfo) session.getAttribute("userNew");
		UserInfo userNew = new UserInfo();
		userNew.setuId(user.getuId());
		
		if(!StringUtils.isNotNullString(userType) || user==null) {
			model.addAttribute("info", "传参错误");
			return "info";
		}
		//获取参数
		String college = request.getParameter("college");
		String major = request.getParameter("major");
		String note = request.getParameter("note");
		String tel = request.getParameter("tel");
		//参数判空
		if(!StringUtils.isNotNullString(college,major,note,tel)) {
			model.addAttribute("info", "信息不足");
			return "info";
		}
		userNew.setCollege(college);
		userNew.setMajor(major);
		userNew.setTel(tel);
		//判断参数操作
		if(userType.equals("0")) {//学生
			//对象封装
			userNew.setAdmissionDate(StringUtils.strToDate(note, "yyyy-MM-dd"));
		}else if(userType.equals("1")) {//教师
			//对象封装
			userNew.setJobTitle(note);
		}
		System.out.println(user);
		//数据库操作
		if(userService.updateUserById(userNew)==1) {
			model.addAttribute("info", "注册成功");
			return "login";
		}else {
			model.addAttribute("info", "服务器错误");
			return "info";
		}
    }
	/**
	 * 忘记密码页面跳转
	 * @param request
	 * @param model
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/reset")
    public String reset(HttpServletRequest request,Model model)
            throws ServletException, IOException {
    	return "forgot-password";
    }
	
	/**
	 * 忘记密码，发送重置密码链接
	 * @param email
	 * @param request
	 * @param model
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
    @RequestMapping("/forgetPWD")
    public String forgetPWD(HttpServletRequest request,Model model)
            throws ServletException, IOException {
    	String email = request.getParameter("email");
    	if(StringUtils.isNotNullString(email)) {
    		user = userService.selectUserByEmail(email);
    		if(user!=null) {
    			String content = PasswordUtils.createLink(user,request,userService);
            	try{
                	//发送邮件
                	MailEntry mail = new MailEntry();
                	mail.setSubject("重置密码");
                	String [] addr = new String [1];
                	addr[0] = user.getEmail();
                	try {
            			mail.setRecipients(addr);
            		} catch (AddressException e) {
            			e.printStackTrace();
            		}
                	mail.setText(content);
                	mailService.sendMail(mail);
            	}catch (Exception e) {
                	model.addAttribute("info", "邮件发送失败");
                	return "forgot-password";
				}
            	model.addAttribute("info", "邮件发送成功");
            	return "info";
    		}
    	}else {
        	model.addAttribute("info", "传参失败");
        	return "forgot-password";
    	}
    	model.addAttribute("info", "邮箱地址不存在");
    	return "forgot-password";
    }
    
    /**
     * 重置密码链接验证
     * @param request
     * @param model
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/toResetPWD")
    public String toResetPWD(HttpServletRequest request,Model model)
            throws ServletException, IOException {
    	if("验证成功".equals(PasswordUtils.toFindPassword(request, userService))) {
    		model.addAttribute("info", "验证成功");
    		request.getSession().setAttribute("sid",request.getParameter("sid"));
    		return "reset-password";
    	}
    	model.addAttribute("info", "验证失败");
    	return "info";
    }
    
    /**
     * 密码重置
     * @param id       用户id
     * @param password 重置密码
     * @param request
     * @param model
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/resetPWD")
    public String resetPWD(@RequestParam(required=true) String id,
    		@RequestParam(required=true) String password
    		,HttpServletRequest request,Model model)
            throws ServletException, IOException {
    	if("验证成功".equals(PasswordUtils.toFindPassword(request, userService))) {
    		model.addAttribute("info", "验证成功");
    		// 重置密码
    		user = new UserInfo();
    		user.setuId(Integer.parseInt(id));
    		user.setuPassword(MD5Utils.stringEncoder(password));
    		
    		if(userService.updateUserById(user)!=1) {
    	    	model.addAttribute("info", "服务器错误，修改失败");
    	    	// 返回主页
    	    	return "index";
    		}
    		request.getSession().removeAttribute("sid");
    		// 返回登陆页
    		return "login";
    	}
    	model.addAttribute("info", "非法操作");
    	// 返回主页
    	return "index";
    }
    
    /**
	 * 用户列表（页面跳转）
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/userlist")
    public String userlist(HttpServletRequest request,Model model)
            throws ServletException, IOException {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String url = "redirect:/";
		if(user==null) {
			return "redirect:/";
		}
		
		// 验证角色
		switch (user.getRole()) {
		case 0:
			//"0"超级管理员
			url = "admin/usermanager";
			break;
		case 1:
		case 2:
			// "1"学院教务部门管理员、"2"学院或系管理员
			url = "manager/usermanager";
			break;
		default:
			url = "redirect:/";
		}
		return url;
    }
    
	/**
	 * 立项列表
	 * @param page
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping("/listuser")
	public @ResponseBody PageInfo<UserInfo> listuser(
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize,
			@RequestParam(required=true) Integer type,
			HttpServletRequest request
			) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return null;
		}
		PageHelper.startPage(page, pageSize); 
		List<UserInfo> list = null;
		
		if(user.getRole()==1||user.getRole()==0) {//学校教务和超级管理员
			list = userService.selectUserList(type);
		}else if(user.getRole()==2) {//学院
			list = userService.selectUserList(user.getCollege(),type);
		}
		
		if(list==null) {
			return null;
		}
		PageInfo<UserInfo> p = new PageInfo<UserInfo>(list);
		return p;
	}
	
    /**
     * 修改当前用户信息
     * @param request
     * @return
     */
	@RequestMapping("/edituser")
    public @ResponseBody Integer edituser(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		//获取参数
		String uName = request.getParameter("uName");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String jobTitle = request.getParameter("jobTitle");
		String major = request.getParameter("major");
		String college = request.getParameter("college");
		UserInfo usernew = null;
		if(StringUtils.isNotNullString(uName,email)) {
			if(!email.equals(user.getEmail())) {
				usernew = userService.selectUserByEmail(email);
				if(usernew!=null) {
					return 2;
				}
			}
			if(!uName.equals(user.getuName())) {
				usernew = userService.selectUserByUsename(uName);
				if(usernew!=null) {
					return 3;
				}
			}
		}
		if(StringUtils.isNotNullString(uName,email,tel,jobTitle,major,college)) {//教师或评审
			usernew = new UserInfo();
			usernew.setuId(user.getuId());
			usernew.setuName(uName);
			usernew.setTel(tel);
			usernew.setEmail(email);
			usernew.setJobTitle(jobTitle);
			usernew.setMajor(major);
			usernew.setCollege(college);
			return userService.updateUserById(user);
		}
		
		if(StringUtils.isNotNullString(uName,email,tel,major,college)) {//学院或系管理员
			usernew = new UserInfo();
			usernew.setuId(user.getuId());
			usernew.setuName(uName);
			usernew.setTel(tel);
			usernew.setEmail(email);
			usernew.setMajor(major);
			usernew.setCollege(college);
			return userService.updateUserById(user);
		}
		
		//判断参数
		if(StringUtils.isNotNullString(uName,email,tel)) {//学生
			usernew = new UserInfo();
			usernew.setuId(user.getuId());
			usernew.setuName(uName);
			usernew.setTel(tel);
			usernew.setEmail(email);
			return userService.updateUserById(user);
		}
		return 0;
    }
	
	/**
     * 修改当前用户信息
     * @param request
     * @return
     */
	@RequestMapping("/manageredituser")
    public @ResponseBody Integer manageredituser(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		//获取参数
		String uId = request.getParameter("uId");
		String uName = request.getParameter("uName");
		String uRealname = request.getParameter("uRealname");
		String email = request.getParameter("email");
		String uCode = request.getParameter("uCode");
		String admissionDate = request.getParameter("admissionDate");
		String tel = request.getParameter("tel");
		String jobTitle = request.getParameter("jobTitle");
		String major = request.getParameter("major");
		String college = request.getParameter("college");
		String gender = request.getParameter("sex");
		String type = request.getParameter("type");
		
		//封装信息
		UserInfo usernew = new UserInfo();
		if(admissionDate!=null) {
			usernew.setAdmissionDate(StringUtils.strToDate(admissionDate, "yyyy-MM-dd"));
		}
		usernew.setuName(uName);
		usernew.setuRealname(uRealname);
		usernew.setTel(tel);
		usernew.setEmail(email);
		usernew.setJobTitle(jobTitle);
		usernew.setMajor(major);
		usernew.setCollege(college);
		usernew.setuCode(uCode);
		
		try {
			usernew.setGender(Integer.parseInt(gender));
		} catch (Exception e) {//参数错误
			return -1;
		}
		//验证用户名、邮箱、ucode唯一性
		if(StringUtils.isNotNullString(uName,email,uCode)) {
			UserInfo otheruser = null;
			//邮箱已存在
			otheruser = userService.selectUserByEmail(email);
			if(otheruser!=null) {
				return -2;
			}
			//用户名已存在
			otheruser = userService.selectUserByUsename(uName);
			if(otheruser!=null) {
				return -3;
			}
			//code已存在
			otheruser = userService.selectUserByuCode(uCode);
			if(otheruser!=null) {
				return -4;
			}
		}
		
		if(uId==null) {//新增
			//分身份添加
			if(type.equals("5")) {//学生
				usernew.setRole(5);
			}else if(type.equals("4")) {//导师
				usernew.setRole(4);
			}else if(type.equals("3")) {//评审
				usernew.setRole(3);
			}else if(type.equals("2")) {//学院
				usernew.setRole(2);
			}else if(type.equals("1")) {//学校
				usernew.setRole(1);
			}
			usernew.setuPassword(MD5Utils.stringEncoder("123456"));//默认密码
			usernew.setStatus(1);//已激活
			return userService.insertUserSelective(usernew);
		}else {//编辑
			try {
				usernew.setuId(Integer.parseInt(uId));
			} catch (Exception e) {//参数错误
				return -1;
			}
			return userService.updateUserById(usernew);
		}
    }
	
	/**
     * 删除用户信息
     * @param request
     * @return
     */
	@RequestMapping("/deleteuser")
    public @ResponseBody Integer deleteuser(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		//获取参数
		String uId = request.getParameter("uId");
		if(uId==null) {
			return 0;
		}

		try {
			//判断是否存在项目
			List<ProjectUser> list = projectBaseService.findprojectuserbyuser(Integer.parseInt(uId));
			if(list!=null&&list.size()>0) {//存在项目关联暂无法删除
				return -2;
			}
			return userService.deleteUserById(Integer.parseInt(uId));
		} catch (Exception e) {//转换错误
			return -1;
		}
    }
	
	/**
     * 激活用户
     * @param request
     * @return
     */
	@RequestMapping("/activateuser")
    public @ResponseBody Integer activateuser(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		//获取参数
		String uId = request.getParameter("uId");
		if(uId==null) {
			return 0;
		}
		try {
			return userService.updateUserStatusById(Integer.parseInt(uId), 1);
		} catch (Exception e) {//转换错误
			return -1;
		}
    }
	
	/**
	 * 用户详情
	 * @param uId
	 * @param request
	 * @return
	 */
	@RequestMapping("/userinfo")
	public @ResponseBody UserInfo userinfo(@RequestParam Integer uId,HttpServletRequest request) {
		UserInfo info = userService.selectUserById(uId);
		if(info==null) {
			return null;
		}
		return info;
	}
}
