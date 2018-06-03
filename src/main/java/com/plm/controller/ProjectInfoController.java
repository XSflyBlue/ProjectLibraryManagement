package com.plm.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.plm.model.OpinionInfo;
import com.plm.model.ProjectBase;
import com.plm.model.ProjectBaseView;
import com.plm.model.ProjectEndView;
import com.plm.model.ProjectFundsView;
import com.plm.model.ProjectMidView;
import com.plm.model.ProjectOtherView;
import com.plm.model.ProjectPlan;
import com.plm.model.ProjectProcessInfo;
import com.plm.model.ProjectStartView;
import com.plm.model.ProjectUser;
import com.plm.model.UserInfo;
import com.plm.model.WeeklyInfo;
import com.plm.model.WeeklyView;
import com.plm.service.IOpinionService;
import com.plm.service.IProjectBaseService;
import com.plm.service.IProjectExtendService;
import com.plm.service.IProjectPlanService;
import com.plm.service.IUserService;
import com.plm.service.IWeeklyService;
import com.plm.util.StringUtils;
/**
 * 项目信息管理相关控制器
 * @author Flyblue
 *
 */
@Controller
@RequestMapping("/projectinfo")
public class ProjectInfoController {
	@Resource
	private IProjectBaseService projectBaseService;
	@Resource
	private IProjectExtendService projectExtendService;
	@Resource
	private IProjectPlanService projectPlanService;
	@Resource
	private IWeeklyService weeklyService;
	@Resource
	private IOpinionService opinionService;
	@Resource
	private IUserService userService;
	private UserInfo user;
	
	/**
	 * 新增预算信息
	 * @param projectId
	 * @param pfundcontent
	 * @return
	 */
	@RequestMapping("/addfunds")
    public @ResponseBody Integer addfunds(HttpServletRequest request) {
		String pfundcontent = request.getParameter("pfundcontent");
		String projectId = request.getParameter("projectId");
		String fopinion = request.getParameter("fopinion");
		String fstatus = request.getParameter("fstatus");
		
		if(projectId!=null&&pfundcontent!=null) {
			ProjectBase record = new ProjectBase();
			record.setPbId(Integer.parseInt(projectId));
			record.setfContent(pfundcontent);
			record.setfStatus(1);
			return projectBaseService.editProject(record);
		}else if(projectId!=null&&fopinion!=null&&fstatus!=null){
			ProjectBase record = new ProjectBase();
			record.setPbId(Integer.parseInt(projectId));
			record.setfOpinion(fopinion);
			record.setfOpinionTime(StringUtils.getDate());
			record.setfStatus(Integer.parseInt(fstatus));
			return projectBaseService.editProject(record);
		}else if(projectId!=null&&fopinion==null&&fstatus==null&&pfundcontent==null) {
			ProjectBase record = new ProjectBase();
			record.setPbId(Integer.parseInt(projectId));
			record.setfOpinion("");
			record.setfOpinionTime(StringUtils.strToDate("0000-00-00", "yyyy-MM-dd"));
			record.setfStatus(1);
			return projectBaseService.editProject(record);
		}
    	return 0;
    }
	
	/**
	 * 编辑预算
	 * @param projectId
	 * @param pfundcontent
	 * @return
	 */
	@RequestMapping("/editfunds")
    public @ResponseBody Integer editfunds(@RequestParam Integer projectId,
    		@RequestParam String pfundcontent) {
		if(projectId!=null && StringUtils.isNotNullString(pfundcontent)) {
			ProjectBase record = new ProjectBase();
			record.setPbId(projectId);
			record.setfContent(pfundcontent);
			record.setfStatus(1);//待审核
			return projectBaseService.editProject(record);
		}
    	return 0;
    }
	
	/**
	 * 立项列表（页面跳转）
	 * @param request
	 * @param model
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/startlist")
    public String startlist(HttpServletRequest request,Model model)
            throws ServletException, IOException {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String url = "index";
		if(user==null) {
			return "index";
		}
		
		// 验证角色
		switch (user.getRole()) {
		case 1:
		case 2:
			// "1"学院教务部门管理员、"2"学院或系管理员
			url = "manager/projectstartlist";
			break;
		case 3:
		case 4:
			// "3"评审专家、"4"指导教师
			url = "tutor/projectstartlist";
			break;
		case 5:
			// "5"学生
			url = "student/projectstartlist";
			break;
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
	@RequestMapping("/liststart")
	public @ResponseBody PageInfo<ProjectStartView> liststart(
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize,
			HttpServletRequest request
			) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return null;
		}
		PageHelper.startPage(page, pageSize); 
		List<ProjectStartView> list = null;
		
		if(user.getRole()==1) {//学校教务
			list = projectExtendService.findProjectStartView();
		}else if(user.getRole()==2) {//学院
			list = projectExtendService.findProjectStartView(user.getCollege());
		}else {
			list = projectExtendService.findProjectStartView(user.getuId());
		}
		
		if(list==null) {
			return null;
		}
		PageInfo<ProjectStartView> p = new PageInfo<ProjectStartView>(list);
		return p;
	}
	
	/**
	 * 新增立项信息
	 * @return
	 */
	@RequestMapping("/addstart")
    public @ResponseBody Integer addstart(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		
		String projectname = request.getParameter("projectname");
		String projectplan = request.getParameter("projectplan");
		String level = request.getParameter("level");
		String type = request.getParameter("type");
		String subject = request.getParameter("subject");
		String psiBrief = request.getParameter("psiBrief");
		String psiReason = request.getParameter("psiReason");
		String psiContent = request.getParameter("psiContent");
		String psiFeature = request.getParameter("psiFeature");
		String psiPlan = request.getParameter("psiPlan");
		String psiResult = request.getParameter("psiResult");
		
		if(!StringUtils.isNotNullString(projectname,projectplan,level,type,subject
				,psiBrief,psiReason,psiContent,psiFeature,psiPlan,psiResult)) {
			return 0;
		}
		
		List<ProjectUser> list = projectBaseService.findprojectuserbyuser(user.getuId());
		if(list!=null && list.size()>0) {//项目安排下已存在该用户
			for(ProjectUser pu:list) {
				if(pu.getuType()==0) {//负责人
					ProjectBase pb = projectBaseService.selectById(pu.getPbId());
					if(pb!=null) {
						if(pb.getPpId()==Integer.parseInt(projectplan)) {
							return -2;
						}
					}
				}
			}
		}
		
		ProjectBase projectBase = new ProjectBase();
		projectBase.setPpId(Integer.parseInt(projectplan));
		projectBase.setPbName(projectname);
		projectBase.setPbLevel(Integer.parseInt(level));
		projectBase.setPbType(Integer.parseInt(type));
		projectBase.setSubjectType(Integer.parseInt(subject));
		projectBase.setPsiBrief(psiBrief);
		projectBase.setPsiReason(psiReason);
		projectBase.setPsiContent(psiContent);
		projectBase.setPsiFeature(psiFeature);
		projectBase.setPsiPlan(psiPlan);
		projectBase.setPsiResult(psiResult);
		
		int flag = 0;
		flag = projectExtendService.addproject(projectBase);
		if(flag!=0&&flag!=-1) {
			projectExtendService.addprojectuser(flag, user.getuCode(), 0);//负责人
		}
		return flag;
    }
	
	/**
	 * 修改立项信息
	 * @return
	 */
	@RequestMapping("/editstart")
    public @ResponseBody Integer editstart(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		
		String projectid = request.getParameter("projectid");
		String psiBrief = request.getParameter("psiBrief");
		String psiReason = request.getParameter("psiReason");
		String psiContent = request.getParameter("psiContent");
		String psiFeature = request.getParameter("psiFeature");
		String psiPlan = request.getParameter("psiPlan");
		String psiResult = request.getParameter("psiResult");
		
		if(!StringUtils.isNotNullString(projectid,psiBrief,psiReason,psiContent,psiFeature,psiPlan,psiResult)) {
			return 0;
		}
		
		ProjectBase projectBase = new ProjectBase();
		projectBase.setPbId(Integer.parseInt(projectid));
		projectBase.setPsiBrief(psiBrief);
		projectBase.setPsiReason(psiReason);
		projectBase.setPsiContent(psiContent);
		projectBase.setPsiFeature(psiFeature);
		projectBase.setPsiPlan(psiPlan);
		projectBase.setPsiResult(psiResult);
		projectBase.setPbEditTime(StringUtils.getDate());
		projectBase.setPsiOStatus(11);//状态变为待导师审核
		
		return projectBaseService.editProject(projectBase);
    }
	
	/**
	 * 删除项目信息
	 * @param projectId
	 * @return
	 */
	@RequestMapping("/deletestart")
    public @ResponseBody Integer deletestart(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		String projectid = request.getParameter("projectid");
		if(projectid==null) {
			return 0;
		}
		
		return projectBaseService.deleteProject(Integer.parseInt(projectid));
    }
	
	/**
	 * 中期列表（页面跳转）
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/midlist")
    public String midlist(HttpServletRequest request,Model model)
            throws ServletException, IOException {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String url = "index";
		if(user==null) {
			return "index";
		}
		
		// 验证角色
		switch (user.getRole()) {
		case 1:
		case 2:
			// "1"学院教务部门管理员、"2"学院或系管理员
			url = "manager/projectmidlist";
			break;
		case 3:
		case 4:
			// "3"评审专家、"4"指导教师
			url = "tutor/projectmidlist";
			break;
		case 5:
			// "5"学生
			url = "student/projectmidlist";
			break;
		}
		return url;
    }
	
	/**
	 * 中期列表
	 * @param page
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping("/listmid")
	public @ResponseBody PageInfo<ProjectMidView> listmid(
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize,
			HttpServletRequest request
			) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return null;
		}
		PageHelper.startPage(page, pageSize); 
		List<ProjectMidView> list = null;
		
		if(user.getRole()==1) {//学校教务
			list = projectExtendService.findProjectMidView();
		}else if(user.getRole()==2) {//学院
			list = projectExtendService.findProjectMidView(user.getCollege());
		}else {
			list = projectExtendService.findProjectMidView(user.getuId());
		}
		if(list==null) {
			return null;
		}
		PageInfo<ProjectMidView> p = new PageInfo<ProjectMidView>(list);
		return p;
	}
	
	/**
	 * 项目中期详情
	 * @param pId
	 * @param request
	 * @return
	 */
	@RequestMapping("/midinfo")
	public @ResponseBody ProjectMidView midinfo(@RequestParam Integer ppiId,HttpServletRequest request) {
		ProjectMidView info = projectExtendService.findProjectMidViewDetail(ppiId);
		if(info==null) {
			return null;
		}
		return info;
	}
	
	/**
	 * 新增中期信息
	 * @param projectId
	 * @return
	 */
	@RequestMapping("/addmid")
    public @ResponseBody Integer addmid(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		
		String projectid = request.getParameter("projectid");
		String pmiContent = request.getParameter("pmiContent");
		String pmiIssue = request.getParameter("pmiIssue");
		
		if(!StringUtils.isNotNullString(projectid,pmiContent,pmiIssue)) {
			return 0;
		}
		//检验项目所有中期
		List<ProjectMidView> list = projectExtendService.findProjectMidView(user.getuId());
		if(list!=null) {
			for(ProjectMidView pm:list) {
				if(pm.getPbId()==Integer.parseInt(projectid)) {//存在中期信息
					if(pm.getPmiOStatus()==21||pm.getPmiOStatus()==23
							||pm.getPmiOStatus()==25||pm.getPmiOStatus()==27||pm.getPmiOStatus()==29) {
						return -1;
					}else {//不合格时删除原纪录
						projectExtendService.deleteProcessInfo(pm.getPpiId());
					}
				}
			}
		}
		//时间限制（待完成）
		
		//封装数据
		ProjectMidView pmid =new ProjectMidView();
		pmid.setPbId(Integer.parseInt(projectid));
		pmid.setPmiContent(pmiContent);
		pmid.setPmiIssue(pmiIssue);
		
		return projectExtendService.addmidprocess(pmid);
    }
	
	/**
	 * 修改中期信息
	 * @return
	 */
	@RequestMapping("/editmid")
    public @ResponseBody Integer editmid(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		
		String ppiId = request.getParameter("ppiId");
		String pmiContent = request.getParameter("pmiContent");
		String pmiIssue = request.getParameter("pmiIssue");
		
		if(!StringUtils.isNotNullString(ppiId,pmiContent,pmiIssue)) {
			return 0;
		}
		
		ProjectProcessInfo ppi = new ProjectProcessInfo();
		ppi.setPpiId(Integer.parseInt(ppiId));
		ppi.setPmiContent(pmiContent);
		ppi.setPmiIssue(pmiIssue);
		ppi.setPpiEditTime(StringUtils.getDate());
		
		return projectExtendService.editProcessInfo(ppi);
    }
	
	/**
	 * 删除项目中期信息
	 * @return
	 */
	@RequestMapping("/deletemid")
    public @ResponseBody Integer deletemid(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		String ppiId = request.getParameter("ppiId");
		if(ppiId==null) {
			return 0;
		}
		
		return projectExtendService.deleteProcessInfo(Integer.parseInt(ppiId));
    }
	
	/**
	 * 项目审核详情
	 * @param ppiId
	 * @param request
	 * @return
	 */
	@RequestMapping("/checkinfo")
	public @ResponseBody List<OpinionInfo> checkinfo(@RequestParam Integer ppiId,HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return null;
		}
		List<OpinionInfo> info = opinionService.findOpinion(ppiId);
		if(info==null) {
			return null;
		}
		return info;
	}
	
	/**
	 * 项目审核详情(单个)
	 * @param request
	 * @return
	 */
	@RequestMapping("/checkoneinfo")
	public @ResponseBody OpinionInfo checkoneinfo(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return null;
		}
		String  ppiId = request.getParameter("ppiId");
		String  outype = request.getParameter("outype");
		if(!StringUtils.isNotNullString(ppiId,outype)) {
			return null;
		}
		
		OpinionInfo info = opinionService.findOpinion(Integer.parseInt(ppiId),Integer.parseInt(outype));
		if(info==null) {
			return null;
		}
		return info;
	}
	
	/**
	 * 新增审核信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/addopinion")
    public @ResponseBody Integer addopinion(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		
		String ppiId = request.getParameter("ppiId");
		String outype = request.getParameter("outype");
		String oContent = request.getParameter("oContent");
		String oStatus = request.getParameter("oStatus");
		String oid = request.getParameter("oid");
		
		OpinionInfo opinfo = new OpinionInfo();
		try {
			//编辑
			if(StringUtils.isNotNullString(ppiId,outype,oContent,oStatus,oid)) {
				opinfo.setoId(Integer.parseInt(oid));
				opinfo.setPpiId(Integer.parseInt(ppiId));
				opinfo.setoUType(Integer.parseInt(outype));
				opinfo.setoContent(oContent);
				opinfo.setoStatus(Integer.parseInt(oStatus));
				return projectExtendService.editopinion(opinfo);
			}
			//新增
			if(StringUtils.isNotNullString(ppiId,outype,oContent,oStatus)) {
				opinfo.setPpiId(Integer.parseInt(ppiId));
				opinfo.setoUType(Integer.parseInt(outype));
				opinfo.setoContent(oContent);
				opinfo.setoStatus(Integer.parseInt(oStatus));
				return projectExtendService.addopinion(opinfo);
			}
		} catch (Exception e) {//参数转换错误
			return -2;
		}
		
		return -1;
    }
	
	/**
	 * 删除项目审核信息
	 * @return
	 */
	@RequestMapping("/deleteopinion")
    public @ResponseBody Integer deleteopinion(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		String oid = request.getParameter("oid");
		if(oid==null) {//暂无审核信息
			return -1;
		}
		String pId = request.getParameter("pId");
		String type = request.getParameter("type");
		String outype = request.getParameter("outype");
		if(pId==null||type==null||outype==null) {
			return 0;
		}
		int flag = 0;
		flag = opinionService.deleteOpinion(Integer.parseInt(oid));
		if(flag==1) {//切换项目状态
			ProjectBase info = projectBaseService.selectById(Integer.parseInt(pId));
			ProjectBase newinfo = new ProjectBase();

			if(info!=null) {
				newinfo.setPbId(info.getPbId());//项目id
				if(type.equals("1")) {//立项
					if(outype.equals("0")) {//导师
						newinfo.setPsiOStatus(11);
					}else if(outype.equals("1")) {//专家
						newinfo.setPsiOStatus(17);
					}else if(outype.equals("2")) {//学院
						newinfo.setPsiOStatus(13);
					}else if(outype.equals("3")) {//学校
						newinfo.setPsiOStatus(15);
					}
				}else if(type.equals("2")) {//中期
					if(outype.equals("0")) {//导师
						newinfo.setPmiOStatus(21);
					}else if(outype.equals("1")) {//专家
						newinfo.setPmiOStatus(27);
					}else if(outype.equals("2")) {//学院
						newinfo.setPmiOStatus(23);
					}else if(outype.equals("3")) {//学校
						newinfo.setPmiOStatus(25);
					}
				}else if(type.equals("3")) {//验收
					if(outype.equals("0")) {//导师
						newinfo.setPeiOStatus(31);
					}else if(outype.equals("1")) {//专家
						newinfo.setPeiOStatus(37);
					}else if(outype.equals("2")) {//学院
						newinfo.setPeiOStatus(33);
					}else if(outype.equals("3")) {//学校
						newinfo.setPeiOStatus(35);
					}
				}else if(type.equals("4")) {//其他
					if(outype.equals("0")) {//导师
						newinfo.setPoiOStatus(41);
					}else if(outype.equals("1")) {//专家
						newinfo.setPoiOStatus(47);
					}else if(outype.equals("2")) {//学院
						newinfo.setPoiOStatus(43);
					}else if(outype.equals("3")) {//学校
						newinfo.setPoiOStatus(45);
					}
				}
			}
			projectBaseService.editProject(newinfo);
		}
		return flag;
    }
	
	/**
	 * 验收列表（页面跳转）
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/endlist")
    public String endlist(HttpServletRequest request,Model model){
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String url = "index";
		if(user==null) {
			return "index";
		}
		
		// 验证角色
		switch (user.getRole()) {
		case 1:
		case 2:
			// "1"学院教务部门管理员、"2"学院或系管理员
			url = "manager/projectendlist";
			break;
		case 3:
		case 4:
			// "3"评审专家、"4"指导教师
			url = "tutor/projectendlist";
			break;
		case 5:
			// "5"学生
			url = "student/projectendlist";
			break;
		}
		return url;
    }
	
	/**
	 * 验收列表
	 * @param page
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping("/listend")
	public @ResponseBody PageInfo<ProjectEndView> listend(
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize,
			HttpServletRequest request
			) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return null;
		}
		PageHelper.startPage(page, pageSize); 
		List<ProjectEndView> list = null;
		
		if(user.getRole()==1) {//学校教务
			list = projectExtendService.findProjectEndView();
		}else if(user.getRole()==2) {//学院
			list = projectExtendService.findProjectEndView(user.getCollege());
		}else {
			list = projectExtendService.findProjectEndView(user.getuId());
		}
		
		if(list==null) {
			return null;
		}
		PageInfo<ProjectEndView> p = new PageInfo<ProjectEndView>(list);
		return p;
	}
	
	/**
	 * 项目验收详情
	 * @param pId
	 * @param request
	 * @return
	 */
	@RequestMapping("/endinfo")
	public @ResponseBody ProjectEndView endinfo(@RequestParam Integer ppiId,HttpServletRequest request) {
		ProjectEndView info = projectExtendService.findProjectEndViewDetail(ppiId);
		if(info==null) {
			return null;
		}
		return info;
	}
	
	/**
	 * 新增验收信息
	 * @return
	 */
	@RequestMapping("/addend")
    public @ResponseBody Integer addend(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		
		String projectid = request.getParameter("projectid");
		String pmiContent = request.getParameter("pmiContent");
		String peiMission = request.getParameter("peiMission");
		String peiOpoinion = request.getParameter("peiOpoinion");
		
		if(!StringUtils.isNotNullString(projectid,pmiContent,peiMission,peiOpoinion)) {
			return 0;
		}
		//检验项目所有验收
		List<ProjectEndView> list = projectExtendService.findProjectEndView(user.getuId());
		if(list!=null) {
			for(ProjectEndView pe:list) {
				if(pe.getPbId()==Integer.parseInt(projectid)) {//存在中期信息
					if(pe.getPmiOStatus()==31||pe.getPmiOStatus()==33
							||pe.getPmiOStatus()==35||pe.getPmiOStatus()==37||pe.getPmiOStatus()==39) {
						return -1;
					}else {//不合格时删除原纪录
						projectExtendService.deleteProcessInfo(pe.getPpiId());
					}
				}
			}
		}
		//时间限制（待完成）
		
		//封装数据
		ProjectEndView peid =new ProjectEndView();
		peid.setPbId(Integer.parseInt(projectid));
		peid.setPmiContent(pmiContent);
		peid.setPeiLevel(-1);//验收等级暂无
		peid.setPeiMission(peiMission);
		peid.setPeiOpoinion(peiOpoinion);
		
		return projectExtendService.addendprocess(peid);
    }
	
	/**
	 * 修改验收信息
	 * @return
	 */
	@RequestMapping("/editend")
    public @ResponseBody Integer editend(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		
		String ppiId = request.getParameter("ppiId");
		String pmiContent = request.getParameter("pmiContent");
		String peiMission = request.getParameter("peiMission");
		String peiOpoinion = request.getParameter("peiOpoinion");
		
		if(!StringUtils.isNotNullString(ppiId,pmiContent,peiMission,peiOpoinion)) {
			return 0;
		}
		
		ProjectProcessInfo ppi = new ProjectProcessInfo();
		ppi.setPpiId(Integer.parseInt(ppiId));
		ppi.setPmiContent(pmiContent);
		ppi.setPeiMission(peiMission);
		ppi.setPeiOpoinion(peiOpoinion);
		ppi.setPpiEditTime(StringUtils.getDate());
		
		return projectExtendService.editProcessInfo(ppi);
    }
	
	/**
	 * 删除项目验收信息
	 * @return
	 */
	@RequestMapping("/deleteend")
    public @ResponseBody Integer deleteend(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		String ppiId = request.getParameter("ppiId");
		if(ppiId==null) {
			return 0;
		}
		
		return projectExtendService.deleteProcessInfo(Integer.parseInt(ppiId));
    }
	
	/**
	 * 其他申请列表（页面跳转）
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/otherlist")
    public String otherlist(HttpServletRequest request,Model model) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String url = "index";
		if(user==null) {
			return "index";
		}
		
		// 验证角色
		switch (user.getRole()) {
		case 1:
		case 2:
			// "1"学院教务部门管理员、"2"学院或系管理员
			url = "manager/projectotherlist";
			break;
		case 3:
		case 4:
			// "3"评审专家、"4"指导教师
			url = "tutor/projectotherlist";
			break;
		case 5:
			// "5"学生
			url = "student/projectotherlist";
			break;
		}
		return url;
    }
	
	/**
	 * 其他申请列表
	 * @param page
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping("/listother")
	public @ResponseBody PageInfo<ProjectOtherView> listother(
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize,
			HttpServletRequest request
			) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return null;
		}
		PageHelper.startPage(page, pageSize); 
		List<ProjectOtherView> list = null;
		
		if(user.getRole()==1) {//学校教务
			list = projectExtendService.findProjectOtherView();
		}else if(user.getRole()==2) {//学院
			list = projectExtendService.findProjectOtherView(user.getCollege());
		}else {
			list = projectExtendService.findProjectOtherView(user.getuId());
		}
		
		if(list==null) {
			return null;
		}
		PageInfo<ProjectOtherView> p = new PageInfo<ProjectOtherView>(list);
		return p;
	}
	
	/**
	 * 项目验收详情
	 * @param pId
	 * @param request
	 * @return
	 */
	@RequestMapping("/otherinfo")
	public @ResponseBody ProjectOtherView otherinfo(@RequestParam Integer ppiId,HttpServletRequest request) {
		ProjectOtherView info = projectExtendService.findProjectOtherViewDetail(ppiId);
		if(info==null) {
			return null;
		}
		return info;
	}
	
	/**
	 * 新增验收信息
	 * @return
	 */
	@RequestMapping("/addother")
    public @ResponseBody Integer addother(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		
		String projectid = request.getParameter("projectid");
		String poiContent = request.getParameter("poiContent");
		String poiType = request.getParameter("poiType");
		
		if(!StringUtils.isNotNullString(projectid,poiContent,poiType)) {
			return 0;
		}
		//检验项目所有验收
		List<ProjectOtherView> list = projectExtendService.findProjectOtherView(user.getuId());
		if(list!=null) {
			for(ProjectOtherView po:list) {
				if(po.getPbId()==Integer.parseInt(projectid)) {//存在中期信息
					if(po.getPoiOStatus()==43
							||po.getPoiOStatus()==45||po.getPoiOStatus()==47||po.getPoiOStatus()==49) {
						return -1;
					}else {//不合格时删除原纪录
						projectExtendService.deleteProcessInfo(po.getPpiId());
					}
				}
			}
		}
		//时间限制（待完成）
		
		//封装数据
		ProjectOtherView poid =new ProjectOtherView();
		poid.setPbId(Integer.parseInt(projectid));
		poid.setPoiContent(poiContent);
		poid.setPoiType(Integer.parseInt(poiType));
		
		return projectExtendService.addotherprocess(poid);
    }
	
	/**
	 * 修改验收信息
	 * @return
	 */
	@RequestMapping("/editother")
    public @ResponseBody Integer editother(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		
		String ppiId = request.getParameter("ppiId");
		String poiContent = request.getParameter("poiContent");
		
		if(!StringUtils.isNotNullString(ppiId,poiContent)) {
			return 0;
		}
		
		ProjectProcessInfo ppi = new ProjectProcessInfo();
		ppi.setPpiId(Integer.parseInt(ppiId));
		ppi.setPoiContent(poiContent);
		ppi.setPpiEditTime(StringUtils.getDate());
		
		return projectExtendService.editProcessInfo(ppi);
    }
	
	/**
	 * 删除项目其他信息
	 * @return
	 */
	@RequestMapping("/deleteother")
    public @ResponseBody Integer deleteother(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		String ppiId = request.getParameter("ppiId");
		if(ppiId==null) {
			return 0;
		}
		
		return projectExtendService.deleteProcessInfo(Integer.parseInt(ppiId));
    }
	
	/**
	 * 个人中心列表（页面跳转）
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/userprojectlist")
    public String userprojectlist(HttpServletRequest request,Model model) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String url = "index";
		if(user==null) {
			return "index";
		}
		
		// 验证角色
		switch (user.getRole()) {
		case 3:
		case 4:
			// "3"评审专家、"4"指导教师
			url = "tutor/projectweeklylist";
			break;
		case 5:
			// "5"学生
			url = "student/projectweeklylist";
			break;
		}
		return url;
    }
	
	/**
	 * 个人中心列表
	 * @param page
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping("/listuserproject")
	public @ResponseBody PageInfo<ProjectBaseView> listuserproject(
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize,
			HttpServletRequest request
			) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return null;
		}
		PageHelper.startPage(page, pageSize); 
		List<ProjectBaseView> list = projectBaseService.findProject(user);
		if(list==null) {
			return null;
		}
		PageInfo<ProjectBaseView> p = new PageInfo<ProjectBaseView>(list);
		return p;
	}
	/**
	 * 项目详情
	 * @param pId
	 * @param request
	 * @return
	 */
	@RequestMapping("/projectinfo")
	public @ResponseBody ProjectBase projectinfo(@RequestParam Integer pId,HttpServletRequest request) {
		ProjectBase info = projectBaseService.selectById(pId);
		if(info==null) {
			return null;
		}
		return info;
	}
	
	/**
	 * 预算列表（跳转）
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/fundslist")
    public String fundslist(HttpServletRequest request,Model model) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String url = "index";
		if(user==null) {
			return "index";
		}
		
		// 验证角色
		switch (user.getRole()) {
		case 1:
		case 2:
			// "1"学院教务部门管理员、"2"学院或系管理员
			url = "manager/projectfundslist";
			break;
		case 5:
			// "5"学生
			url = "student/projectfundslist";
			break;
		}
		return url;
    }
	
	/**
	 * 预算列表
	 * @param page
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping("/listfunds")
	public @ResponseBody PageInfo<ProjectFundsView> listfunds(
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize,
			HttpServletRequest request
			) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return null;
		}
		PageHelper.startPage(page, pageSize); 
		List<ProjectFundsView> list = null;
		if(user.getRole()==1) {//学校教务
			list = projectBaseService.findfunds();
		}else if(user.getRole()==2) {//学院
			list = projectBaseService.findfunds(user.getCollege());
		}else {
			list = projectBaseService.findfunds(user.getuId());
		}
		
		if(list==null) {
			return null;
		}
		PageInfo<ProjectFundsView> p = new PageInfo<ProjectFundsView>(list);
		return p;
	}
	
	/**
	 * 预算详情
	 * @param request
	 * @return
	 */
	@RequestMapping("/fundsdetail")
	public @ResponseBody ProjectFundsView fundsdetail(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String projectId = request.getParameter("projectId");
		if(user==null||!StringUtils.isNotNullString(projectId)) {
			return null;
		}
		ProjectFundsView info = null;
		info = projectBaseService.findfundsDetail(Integer.parseInt(projectId));
		if(info==null) {
			return null;
		}
		return info;
	}
	
	/**
	 * 周报列表
	 * @param page
	 * @param pageSize
	 * @param projectId
	 * @param request
	 * @return
	 */
	@RequestMapping("/listweekly")
	public @ResponseBody PageInfo<WeeklyView> listweekly(
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize,
			Integer projectId,
			HttpServletRequest request
			) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return null;
		}
		PageHelper.startPage(page, pageSize); 
		List<WeeklyView> list = weeklyService.findWeekly(user.getuId(), projectId);
		if(list==null) {
			return null;
		}
		PageInfo<WeeklyView> p = new PageInfo<WeeklyView>(list);
		return p;
	}
	
	/**
	 * 周报列表（未分页）
	 * @param request
	 * @return
	 */
	@RequestMapping("/listweeklynopage")
	public @ResponseBody List<WeeklyView> listweeklynopage(
			HttpServletRequest request
			) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		String projectId = request.getParameter("projectId");
		if(user==null||!StringUtils.isNotNullString(projectId)) {
			return null;
		}
		List<WeeklyView> list = weeklyService.findWeekly(user.getuId(), Integer.parseInt(projectId));
		if(list==null) {
			return null;
		}
		return list;
	}
	
	/**
	 * 周报详情
	 * @param request
	 * @return
	 */
	@RequestMapping("/weeklydetail")
	public @ResponseBody WeeklyInfo weeklydetail(
			HttpServletRequest request
			) 
	{
		String weekId = request.getParameter("weekId");
		if(!StringUtils.isNotNullString(weekId)) {
			return null;
		}
		WeeklyInfo info = weeklyService.findWeekly(Integer.parseInt(weekId));
		if(info==null) {
			return null;
		}
		return info;
	}
	
	/**
	 * 新增周报
	 * @param request
	 * @return
	 */
	@RequestMapping("/addweekly")
    public @ResponseBody Integer addweekly(HttpServletRequest request) {
		String projectId = request.getParameter("projectId");
		String wStartTime = request.getParameter("wStartTime");
		String wEndTime = request.getParameter("wEndTime");
		String wThisWeek = request.getParameter("wThisWeek");
		String wNextWeek = request.getParameter("wNextWeek");
		if(projectId==null||wStartTime==null||wEndTime==null||wThisWeek==null||wNextWeek==null) {
			return 2;
		}else {
			WeeklyInfo weekly = new WeeklyInfo();
			weekly.setPbId(Integer.parseInt(projectId));
			weekly.setwStartTime(StringUtils.strToDate(wStartTime, "yyyy-MM-dd"));
			weekly.setwEndTime(StringUtils.strToDate(wEndTime, "yyyy-MM-dd"));
			weekly.setwThisWeek(wThisWeek);
			weekly.setwNextWeek(wNextWeek);
			weekly.setwStatus(1);
			return weeklyService.addWeeklyInfo(weekly);
		}
    }
	
	/**
	 * 编辑周报
	 * @param request
	 * @return
	 */
	@RequestMapping("/editweekly")
    public @ResponseBody Integer editweekly(HttpServletRequest request) {
		String weekid = request.getParameter("weekid");
		String wThisWeek = request.getParameter("wThisWeek");
		String wNextWeek = request.getParameter("wNextWeek");
		String wopinion = request.getParameter("wopinion");
		String wstatus = request.getParameter("wstatus");
		WeeklyInfo weekly = new WeeklyInfo();
		if(weekid!=null) {
			weekly.setwId(Integer.parseInt(weekid));
			
			if(wThisWeek==null||wNextWeek==null) {
				if(wopinion==null||wstatus==null) {
					weekly.setwOpinion("");
					weekly.setwStatus(1);//变为待审核状态
					return weeklyService.editWeeklyInfo(weekly);
				}else {
					weekly.setwOpinion(wopinion);
					weekly.setwStatus(Integer.parseInt(wstatus));
					return weeklyService.editWeeklyInfo(weekly);
				}
			}else {//学生
				weekly.setwThisWeek(wThisWeek);
				weekly.setwNextWeek(wNextWeek);
				weekly.setwStatus(1);
				return weeklyService.editWeeklyInfo(weekly);
			}
		}else {
			return 2;
		}
    }
	
	/**
	 * 删除周报
	 * @param weeklyId
	 * @return
	 */
	@RequestMapping("/deleteweekly")
    public @ResponseBody Integer deleteweekly(@RequestParam Integer weeklyId) {
		return weeklyService.deleteWeeklyInfo(weeklyId);
    }
	
	/**
	 * 项目安排详情
	 * @param planid
	 * @return
	 */
	@RequestMapping("/projectplandetail")
	public @ResponseBody ProjectPlan projectplandetail(@RequestParam Integer planid) {
		if(planid==null) {
			return null;
		}
		ProjectPlan info = projectPlanService.findProjectPlan(planid);
		if(info==null) {
			return null;
		}
		return info;
	}
	
	/**
	 * 项目关联用户信息（未分页）
	 * @param request
	 * @return
	 */
	@RequestMapping("/listprojectuserno")
	public @ResponseBody List<ProjectBaseView> listprojectuser(@RequestParam Integer projectid) {
		if(projectid==null) {
			return null;
		}
		List<ProjectBaseView> list = projectBaseService.selectByPbid(projectid);
		if(list==null) {
			return null;
		}
		return list;
	}
	
	/**
	 * 项目列表（未分页）
	 * @param request
	 * @return
	 */
	@RequestMapping("/listprojectnopage")
	public @ResponseBody List<ProjectBaseView> listprojectnopage(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return null;
		}
		List<ProjectBaseView> list = projectBaseService.findProject(user);
		if(list==null) {
			return null;
		}
		return list;
	}
	
	/**
	 * 最近项目详情
	 * @param request
	 * @return
	 */
	@RequestMapping("/recentproject")
	public @ResponseBody ProjectBaseView recentproject(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return null;
		}
		
		List<ProjectBaseView> list = projectBaseService.findProject(user);
		if(list==null) {
			return null;
		}
		return list.get(0);
	}
	
	/**
	 * 项目管理（页面跳转）
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/projectmanager")
    public String projectmanager(HttpServletRequest request,Model model) {
		
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return "index";
		}
		if(user.getRole()==1||user.getRole()==2) {
			return "manager/projectmanager";
		}
		return "index";
    }
	
	/**
	 * 项目切换状态
	 * @param projectId
	 * @param pstatus
	 * @return
	 */
	@RequestMapping("/changestatus")
    public @ResponseBody Integer changestatus(@RequestParam Integer projectId,
    		@RequestParam Integer pstatus) {
		if(projectId!=null && pstatus!=null) {
			ProjectBase record = new ProjectBase();
			record.setPbId(projectId);
			if(pstatus.intValue()==0 || pstatus.intValue()==5 ) {//结题优秀项目状态转化
				record.setPbStatus(pstatus);
				return projectBaseService.editProject(record);
			}else {
				ProjectBase info = projectBaseService.selectById(projectId);
				if(info.getPeiOStatus()!=null && info.getPeiOStatus()<=39) {//验收
					record.setPbStatus(3);
					return projectBaseService.editProject(record);
				}
				if(info.getPmiOStatus()!=null && info.getPmiOStatus()<=29) {//中期
					record.setPbStatus(2);
					return projectBaseService.editProject(record);
				}
				if(info.getPsiOStatus()!=null && info.getPsiOStatus()<=19) {//立项
					record.setPbStatus(1);
					return projectBaseService.editProject(record);
				}
				record.setPbStatus(1);
				return projectBaseService.editProject(record);
			}
		}
    	return 0;
    }
	
	/**
	 * 新增学生（项目人员关系）
	 * @param request
	 * @return
	 */
	@RequestMapping("/addstudent")
    public @ResponseBody Integer addstudent(HttpServletRequest request) {
		String ucode = request.getParameter("ucode");
		String ppid = request.getParameter("ppid");
		String pId = request.getParameter("pId");
		UserInfo loginuser = (UserInfo) request.getSession().getAttribute("user");
		if(ucode==null||ppid==null||pId==null) {
			return 0;
		}
		//用户是否存在
		user = userService.selectUserByuCode(ucode);
		if(user==null) {//用户不存在
			return -1;
		}
		if(user.getRole()!=5) {//非学生
			return -6;
		}
		if(user.getuId()==loginuser.getuId()) {//本人
			return -7;
		}
		//项目安排制约
		ProjectPlan pplan = projectPlanService.findProjectPlan(Integer.parseInt(ppid));
		if(pplan==null) {//项目安排不存在
			return -2;
		}
		if(pplan.getAcceptTime().getTime() > user.getAdmissionDate().getTime()) {//学生年级限制
			return -3;
		}
		//学生人数限制
		List<ProjectBaseView> list = projectBaseService.selectByPbid(Integer.parseInt(pId));
		int stuNum = 0;
		for(ProjectBaseView pb:list) {
			if(pb.getuType()==0||pb.getuType()==1) {
				stuNum += 1;
			}
		}
		if(pplan.getStuNum()<=stuNum) {//学生人数
			return -5;
		}
		//处理部分
    	return projectExtendService.addprojectuser(Integer.parseInt(pId),ucode,1);
    }
	
	/**
	 * 新增导师（项目人员关系）
	 * @param request
	 * @return
	 */
	@RequestMapping("/addteacher")
    public @ResponseBody Integer addteacher(HttpServletRequest request) {
		String ucode = request.getParameter("ucode");
		String ppid = request.getParameter("ppid");
		String pId = request.getParameter("pId");
		String type = request.getParameter("type");
		if(ucode==null||ppid==null||pId==null) {
			return 0;
		}
		//用户是否存在
		user = userService.selectUserByuCode(ucode);
		if(user==null) {//用户不存在
			return -1;
		}
		if(type==null) {
			if(user.getRole()!=4) {//非教师
				return -8;
			}
			//项目安排制约
			ProjectPlan pplan = projectPlanService.findProjectPlan(Integer.parseInt(ppid));
			if(pplan==null) {//项目安排不存在
				return -2;
			}
			//导师指导人数限制
			List<ProjectBaseView> list = projectBaseService.selectByPbid(Integer.parseInt(pId));
			int tuStuNum = 0;
			for(ProjectBaseView pb:list) {
				if(pb.getuType()==0||pb.getuType()==1) {
					tuStuNum += 1;
				}
			}
			if(pplan.getTuStuNum()<=tuStuNum) {//导师指导人数
				return -4;
			}
			//处理部分
			return projectExtendService.addprojectuser(Integer.parseInt(pId),ucode,2);
		}else {
			if(user.getRole()!=3) {//非专家
				return -8;
			}
			//处理部分
			return projectExtendService.addprojectuser(Integer.parseInt(pId),ucode,3);
		}
    }
	
	/**
	 * 删除项目成员
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteprojectuser")
    public @ResponseBody Integer deleteprojectuser(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		String puId = request.getParameter("puId");
		if(puId==null) {
			return 0;
		}
		return projectBaseService.deleteprojectuser(Integer.parseInt(puId));
	}
}
