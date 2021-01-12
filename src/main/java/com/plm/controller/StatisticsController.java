package com.plm.controller;

import com.plm.model.Pblevel;
import com.plm.model.Pbtype;
import com.plm.model.UserInfo;
import com.plm.service.IProjectExtendService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 统计与分析相关控制器
 * @author Flyblue
 *
 */
@Controller
@RequestMapping("/statistics")
public class StatisticsController {
	@Resource
	private IProjectExtendService projectExtendService;
	
	/**
	 * 统计页面（页面跳转）
	 * @param request
	 * @return
	 */
    @RequestMapping("/statistics")
    public String index(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user!=null&&(user.getRole()==1||user.getRole()==2)) {
			return "manager/statistics";
		}else {
			return "index";
		}
    }
    
	/**
	 * 项目级别统计
	 * @return
	 */
	@RequestMapping("/pblevel")
	public @ResponseBody Pblevel pblevel() {
		return projectExtendService.findpblevel();
	}
	
	/**
	 * 项目级别统计
	 * @return
	 */
	@RequestMapping("/pbtype")
	public @ResponseBody Pbtype pbtype() {
		return projectExtendService.findpbtype();
	}
	
	/**
	 * 项目学科统计
	 * @return
	 */
	@RequestMapping("/pbsubject")
	public @ResponseBody Pbtype pbsubject() {
		return projectExtendService.findpbsubject();
	}
	
	/**
	 * 项目学科统计
	 * @return
	 */
	@RequestMapping("/pbstatus")
	public @ResponseBody Pbtype pbstatus() {
		return projectExtendService.findpbstatus();
	}
	
	/**
	 * 项目安排统计
	 * @return
	 */
	@RequestMapping("/pbplan")
	public @ResponseBody List<Map<String, Object>> pbplan() {
		return projectExtendService.findpbplan();
	}
	
	/**
	 * 学生统计
	 * @return
	 */
	@RequestMapping("/pbstudent")
	public @ResponseBody List<Map<String, Object>> pbstudent(HttpServletRequest request) {
		return projectExtendService.findpbstudent();
	}
	
	/**
	 * 学生统计（专业）
	 * @return
	 */
	@RequestMapping("/pbcolstudent")
	public @ResponseBody List<Map<String, Object>> pbcolstudent(HttpServletRequest request) {
		String college = request.getParameter("college");
		if(college==null) {
			return null;
		}
		return projectExtendService.findpbcolstudent(college);
	}
}
