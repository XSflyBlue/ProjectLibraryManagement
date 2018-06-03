package com.plm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.plm.util.DrawImage;

/**
 * 验证码控制器
 * @author Flyblue
 *
 */
@Controller
public class VerifyCodeController {

	/**
	 * 将验证码写入响应
	 * @param request
	 * @param response
	 * @param model
	 * @throws ServletException
	 * @throws IOException
	 */
    @RequestMapping("/verifyCode")
    public void VerifyCode(HttpServletRequest request, HttpServletResponse response,Model model)
            throws ServletException, IOException {
    	String code = DrawImage.getImage(response);
    	request.getSession().setAttribute("code", code);
    }
}
