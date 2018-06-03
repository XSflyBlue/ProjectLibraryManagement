package com.plm.util;

import java.util.Date;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.plm.model.UserInfo;
import com.plm.service.IUserService;

/**
 * 密码工具类
 * @author Flyblue
 *
 */
public class PasswordUtils {

	private static Random random;

	static {
		random = new Random();
	}

	/**
	 * 创建指定长度的随机数字密码
	 * 
	 * @param len
	 * @return
	 */
	public static String createRandomNumPwd(int len) {
		String ret = "";
		for (int i = 0; i < len; i++) {
			ret += random.nextInt(10);
		}
		return ret;
	}

	/**
	 * 生成邮箱链接地址
	 * 
	 * @author Flyblue
	 * @param userService 
	 */
	public static String createLink(UserInfo user, HttpServletRequest request, IUserService userService) {

		// 生成密钥
		String secretKey = UUID.randomUUID().toString();
		// 设置过期时间
		Date outDate = new Date(System.currentTimeMillis() + 30 * 60 * 1000);// 30分钟后过期
		System.out.println(System.currentTimeMillis());
		Long date = outDate.getTime() / 1000 * 1000;// 忽略毫秒数 mySql 取出时间是忽略毫秒数的

		// 此处应该更新userbase表中的过期时间、密钥信息
		user.setOutDate(date);
		user.setValidataCode(secretKey);

		userService.updateUserById(user);
		// 将用户名、过期时间、密钥生成链接密钥
		String key = user.getuName() + "$" + date + "$" + secretKey;

		String digitalSignature = MD5Utils.stringEncoder(key);// 数字签名

		String path = request.getContextPath();

		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;

		String resetPassHref = basePath + "/user/toResetPWD?sid=" + digitalSignature + "&id=" + user.getuId();

		String emailContent = "请勿回复本邮件.点击下面的链接,重设密码,本邮件超过30分钟,链接将会失效，需要重新申请找回密码." + resetPassHref;

		return emailContent;
	}

	/**
	 * 处理从邮箱链接过来的修改密码请求
	 * @author Flyblue
	 * @param request
	 * @return String
	 */
	public static String toFindPassword(HttpServletRequest request,IUserService userService) {
		String message = "";
		// 获取链接中的加密字符串
		String sid = request.getParameter("sid");
		if(!StringUtils.isNotNullString(sid)) {
			sid = (String)request.getSession().getAttribute("sid");
		}
		// 获取链接中的用户名
		String id = request.getParameter("id");
		System.out.println(sid);
		System.out.println(id);
		if (!StringUtils.isNotNullString(sid) || !StringUtils.isNotNullString(id)) {
			System.out.println("请求的链接不正确,请重新操作.");
			message = "请求的链接不正确,请重新操作.";
			return message;
		}
		
		UserInfo user = userService.selectUserById(Integer.parseInt(id));

		if (user != null) {
			// 获取当前用户申请找回密码的过期时间
			// 找回密码链接已经过期
			if (user.getOutDate() <= System.currentTimeMillis()) {
				System.out.println("链接已经过期");
				message = "链接已经过期";
			}
			// 获取当前登陆人的加密码
			String key = user.getuName() + "$" + user.getOutDate() / 1000 * 1000 + "$" + user.getValidataCode();// 数字签名

			String digitalSignature = MD5Utils.stringEncoder(key);// 数字签名

			if (!digitalSignature.equals(sid)) {
				System.out.println("链接加密密码不正确");
				message = "链接加密密码不正确";
			} else {
				// 验证成功,跳入到修改密码界面
				request.setAttribute("user", user);
				message = "验证成功";
			}
		} else {
			System.out.println("用户信息不存在");
			message = "用户信息不存在";
		}
		return message;
	}
}
