package com.plm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.plm.model.PostInfo;
import com.plm.model.PostView;
import com.plm.model.ProjectPlan;
import com.plm.model.UserInfo;
import com.plm.service.IPostService;
import com.plm.service.IProjectPlanService;
import com.plm.util.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 项目过程管理相关控制器
 * @author Flyblue
 *
 */
@Controller
public class ProjectProcessController {
	@Resource
	private IPostService postService;
	@Resource
	private IProjectPlanService projectPlanService;
    
	/**
	 * 公告列表（页面跳转）
	 * @param request
	 * @return
	 */
    @RequestMapping("/postlist")
    public String postlist(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return "postlist";
		}
		if(user.getRole()==1||user.getRole()==2) {
			return "manager/postlist";
		}else {
			return "postlist";
		}
    }
    
    /**
     * 公告详情页面
     * @param request
     * @return
     */
    @RequestMapping("/postdetail")
    public String postdetail(HttpServletRequest request) {
    	String piId = request.getParameter("piId");
    	if(!StringUtils.isNotNullString(piId)) {
    		return "postlist";
    	}
    	request.getSession().setAttribute("piId", piId);
    	return "postdetail";
    }
    
    /**
     * 公告详情内容
     * @param request
     * @return
     */
	@RequestMapping("/postinfo")
	public @ResponseBody PostView postinfo(HttpServletRequest request) {
		String piId = request.getParameter("piId");
		if(StringUtils.isNotNullString(piId)) {
			return postService.findbyPostid(Integer.parseInt(piId));
		}else {
			return null;
		}
	}
	
	/**
	 * 公告列表
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/listPost")
	public @ResponseBody PageInfo<PostView> listPost(
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize
			) {
		PageHelper.startPage(page, pageSize); 
		List<PostView> listPost = postService.findPost();
		return new PageInfo<PostView>(listPost);
	}
	
	/**
	 * 新增公告（编辑）
	 * @param request
	 * @return
	 */
	@RequestMapping("/addpost")
    public @ResponseBody Integer addpost(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		
		String postname = request.getParameter("postname");
		String postcontent = request.getParameter("postcontent");
		String postid = request.getParameter("postid");
		
		PostInfo postInfo = new PostInfo();
		PostInfo post = postService.findPostBytitle(postname);
		
		try {
			if(StringUtils.isNotNullString(postname,postcontent,postid)) {//编辑
				if(post!=null) {//标题已存在
					if(!postname.equals(post.getPiTitle())) {
						return -2;
					}
				}
				postInfo.setPiId(Integer.parseInt(postid));
				postInfo.setPiContent(postcontent);
				postInfo.setPiTitle(postname);
				postInfo.setPostEditTime(StringUtils.getDate());
				return postService.editPost(postInfo);
			}
			if(StringUtils.isNotNullString(postname,postcontent)) {//新增
				if(post!=null) {//标题已存在
					return -2;
				}
				postInfo.setuId(user.getuId());
				postInfo.setPiContent(postcontent);
				postInfo.setPiTitle(postname);
				postInfo.setPostTime(StringUtils.getDate());
				postInfo.setPostEditTime(StringUtils.getDate());
				return postService.addPost(postInfo);
			}
		} catch (Exception e) {//参数转换错误
			return -1;
		}
		
		return 0;
	}
	
	/**
	 * 删除公告
	 * @param request
	 * @return
	 */
	@RequestMapping("/deletepost")
    public @ResponseBody Integer deletepost(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		String postid = request.getParameter("postid");
		if(postid==null) {
			return 0;
		}
		try {
			return postService.deletePost(Integer.parseInt(postid));
		} catch (Exception e) {//参数错误
			return -1;
		}
	}
	
	/**
	 * 计划列表页面
	 * @param request
	 * @return
	 */
    @RequestMapping("/planlist")
    public String planlist(HttpServletRequest request) {
    	return "manager/planlist";
    }
	/**
	 * 计划列表
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/listPlan")
	public @ResponseBody PageInfo<ProjectPlan> listPlan(
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize,
			HttpServletRequest request
			) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		PageHelper.startPage(page, pageSize);
		List<ProjectPlan> list = null;
		
		if(user!=null&&(user.getRole()==1||user.getRole()==2)) {//学校教务管理员查看所有项目安排
			list = projectPlanService.findProjectPlanAll();
		}else if(user!=null&&user.getRole()==5){//学生查看满足条件的项目安排
			 list = projectPlanService.findProjectPlanByUser(user);
		}
		if(list==null) {
			return null;
		}

		return new PageInfo<>(list);
	}
	
	/**
	 * 计划列表（不分页）
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/listPlanNopage")
	public @ResponseBody List<ProjectPlan> listPlanNopage(
			HttpServletRequest request
			) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		List<ProjectPlan> list = null;
		if(user!=null&&(user.getRole()==1||user.getRole()==2)) {//学校教务管理员查看所有项目安排
			list = projectPlanService.findProjectPlanAll();
		}else if(user!=null&&user.getRole()==5){//学生查看满足条件的项目安排
			 list = projectPlanService.findProjectPlanByUser(user);
		}
		return list;
	}
	
	/**
	 * 新增计划
	 * @param request
	 * @return
	 */
    @RequestMapping("/addplan")
    public @ResponseBody Integer addplan(HttpServletRequest request) {
    	//获取参数
    	String ppName = request.getParameter("ppName");
    	String ppYear = request.getParameter("ppYear");
    	String startTime = request.getParameter("startTime");
    	String midTime = request.getParameter("midTime");
    	String endTime = request.getParameter("endTime");
    	String stuNum = request.getParameter("stuNum");
    	String acceptTime = request.getParameter("acceptTime");
    	String tuStuNum = request.getParameter("tuStuNum");
    	
    	ProjectPlan plan;
    	
    	//判断参数
    	if(StringUtils.isNotNullString(ppName,ppYear,startTime,midTime,endTime,stuNum,acceptTime,tuStuNum)) {
    		plan = new ProjectPlan();
    		plan.setPpName(ppName);
    		plan.setPpYear(ppYear);
    		try {
        		plan.setPpStartTime(StringUtils.strToDate(startTime, "yyyy-MM-dd"));
        		plan.setPpMidTime(StringUtils.strToDate(midTime, "yyyy-MM-dd"));
        		plan.setPpEndTime(StringUtils.strToDate(endTime, "yyyy-MM-dd"));
        		plan.setStuNum(Integer.parseInt(stuNum));
        		plan.setAcceptTime(StringUtils.strToDate(acceptTime, "yyyy-MM-dd"));
        		plan.setTuStuNum(Integer.parseInt(tuStuNum));
			} catch (Exception e) {//转换失败
				return 0;
			}

    	}else {//参数为空
    		return 0;
    	}
    	
    	//数据处理
    	return projectPlanService.addProjectPlan(plan);
    }
    
	/**
	 * 修改计划
	 * @param request
	 * @return
	 */
    @RequestMapping("/editplan")
    public @ResponseBody Integer editplan(HttpServletRequest request) {
    	//获取参数
    	String ppId = request.getParameter("ppId");
    	String ppName = request.getParameter("ppName");
    	String ppYear = request.getParameter("ppYear");
    	String startTime = request.getParameter("startTime");
    	String midTime = request.getParameter("midTime");
    	String endTime = request.getParameter("endTime");
    	String stuNum = request.getParameter("stuNum");
    	String acceptTime = request.getParameter("acceptTime");
    	String tuStuNum = request.getParameter("tuStuNum");
    	
    	ProjectPlan plan;
    	
    	//判断参数
    	if(StringUtils.isNotNullString(ppId,ppName,ppYear,startTime,midTime,endTime,stuNum,acceptTime,tuStuNum)) {
    		plan = new ProjectPlan();
    		plan.setPpName(ppName);
    		plan.setPpYear(ppYear);
    		try {
    			plan.setPpId(Integer.parseInt(ppId));
        		plan.setPpStartTime(StringUtils.strToDate(startTime, "yyyy-MM-dd"));
        		plan.setPpMidTime(StringUtils.strToDate(midTime, "yyyy-MM-dd"));
        		plan.setPpEndTime(StringUtils.strToDate(endTime, "yyyy-MM-dd"));
        		plan.setStuNum(Integer.parseInt(stuNum));
        		plan.setAcceptTime(StringUtils.strToDate(acceptTime, "yyyy-MM-dd"));
        		plan.setTuStuNum(Integer.parseInt(tuStuNum));
			} catch (Exception e) {//转换失败
				return 0;
			}

    	}else {//参数为空
    		return 0;
    	}
    	
    	return projectPlanService.editProjectPlan(plan);
    }
    
	/**
	 * 删除计划
	 * @param request
	 * @return
	 */
    @RequestMapping("/deleteplan")
    public @ResponseBody Integer deleteplan(HttpServletRequest request) {
    	//获取参数
    	String ppId = request.getParameter("ppId");
    	//判断参数
    	if(StringUtils.isNotNullString(ppId)) {
    		try {
            	//数据处理
    			return projectPlanService.deleteProjectPlan(Integer.parseInt(ppId)); 
			} catch (Exception e) {//转换错误
				return 0;
			}
    	}
    	return 0;
    }
}
