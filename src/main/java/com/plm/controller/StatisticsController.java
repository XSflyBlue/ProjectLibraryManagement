package com.plm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.plm.model.Pblevel;
import com.plm.model.Pbtype;
import com.plm.model.UserInfo;
import com.plm.service.IProjectExtendService;

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
		Pblevel level = projectExtendService.findpblevel();
		if(level==null) {
			return null;
		}
	    return level;
	}
	
	/**
	 * 项目级别统计
	 * @return
	 */
	@RequestMapping("/pbtype")
	public @ResponseBody Pbtype pbtype() {
		Pbtype type = projectExtendService.findpbtype();
		if(type==null) {
			return null;
		}
	    return type;
	}
	
	/**
	 * 项目学科统计
	 * @return
	 */
	@RequestMapping("/pbsubject")
	public @ResponseBody Pbtype pbsubject() {
		Pbtype type = projectExtendService.findpbsubject();
		if(type==null) {
			return null;
		}
	    return type;
	}
	
	/**
	 * 项目学科统计
	 * @return
	 */
	@RequestMapping("/pbstatus")
	public @ResponseBody Pbtype pbstatus() {
		Pbtype type = projectExtendService.findpbstatus();
		if(type==null) {
			return null;
		}
	    return type;
	}
	
	/**
	 * 项目安排统计
	 * @return
	 */
	@RequestMapping("/pbplan")
	public @ResponseBody List<Map<String, Object>> pbplan() {
		List<Map<String, Object>> list = projectExtendService.findpbplan();
		if(list==null) {
			return null;
		}
	    return list;
	}
	
	/**
	 * 学生统计
	 * @return
	 */
	@RequestMapping("/pbstudent")
	public @ResponseBody List<Map<String, Object>> pbstudent(HttpServletRequest request) {
		List<Map<String, Object>> list = projectExtendService.findpbstudent();
		if(list==null) {
			return null;
		}
	    return list;
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
		List<Map<String, Object>> list = projectExtendService.findpbcolstudent(college);
		if(list==null) {
			return null;
		}
	    return list;
	}
}
