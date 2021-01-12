package com.plm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.plm.model.*;
import com.plm.service.IProjectBaseService;
import com.plm.service.ISiteInfoService;
import com.plm.util.FileOperateUtils;
import com.plm.util.StringUtils;
import com.plm.util.WordUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 网站信息相关控制器
 * @author Flyblue
 *
 */
@Controller
public class SiteInfoController {
	@Resource
	private ISiteInfoService siteInfoServeice;
	@Resource
	private IProjectBaseService projectBaseService;
	/**
	 * 主页（页面跳转）
	 * @param request
	 * @return
	 */
    @RequestMapping("/index")
    public String index(HttpServletRequest request) {
    	return "index";
    }
	
    /**
     * 优秀项目列表（页面跳转）
     * @param request
     * @return
     */
    @RequestMapping("/excellentProjectlist")
    public String excellentProjectlist(HttpServletRequest request) {
		return "excellentlist";
    }
    
    /**
     * 优秀项目列表
     * @param page
     * @param pageSize
     * @return
     */
	@RequestMapping("/listexcellentProject")
	public @ResponseBody PageInfo<ProjectBase> listexcellentProject(
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize
			) {
		PageHelper.startPage(page, pageSize); 
		List<ProjectBase> list = projectBaseService.findExcellentProject();
		if(list==null) {
			return null;
		}
		PageInfo<ProjectBase> p = new PageInfo<ProjectBase>(list);
		return p;
	}
    
    /**
     * 资源下载列表（页面跳转）
     * @param request
     * @return
     */
    @RequestMapping("/filelist")
    public String filelist(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return "filelist";
		}
		if(user.getRole()==0) {
			return "admin/filelist";
		}else {
			return "filelist";
		}
    }
    
    /**
     * 帮助列表
     * @param page
     * @param pageSize
     * @return
     */
	@RequestMapping("/listfile")
	public @ResponseBody PageInfo<SiteFileInfo> listfile(
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize
			) {
		PageHelper.startPage(page, pageSize); 
		List<SiteFileInfo> list = siteInfoServeice.selectFileAll();
		return new PageInfo<SiteFileInfo>(list);
	}
	
	/**
	 * 新增链接（编辑）
	 * @param request
	 * @return
	 */
	@RequestMapping("/addfile")
    public @ResponseBody Integer addfile(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		
		String info = (String) request.getAttribute("info");
		if("文件上传成功！".equals(info)) {
			SiteFileInfo sitefile = (SiteFileInfo) request.getAttribute("sitefile");
			if(sitefile!=null) {
				return siteInfoServeice.insertFile(sitefile);
			}
		}
		//上传失败
		return -1;
	}
	
    /**
     * 帮助详情内容
     * @param request
     * @return
     */
	@RequestMapping("/fileinfo")
	public @ResponseBody SiteFileInfo fileinfo(HttpServletRequest request) {
		String fileid = request.getParameter("fileid");
		if(StringUtils.isNotNullString(fileid)) {
			return siteInfoServeice.selectFileById(Integer.parseInt(fileid));
		}else {
			return null;
		}
	}
	
	/**
	 * 删除文件
	 * @param request
	 * @return
	 */
	@RequestMapping("/deletefile")
    public @ResponseBody Integer deletefile(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		String fileid = request.getParameter("fileid");
		if(fileid==null) {
			return 0;
		}
		try {
			SiteFileInfo info = siteInfoServeice.selectFileById(Integer.parseInt(fileid));
			if(info!=null) {
				FileOperateUtils.delAllFile(info.getSfPath());
			}
			return siteInfoServeice.deleteFileById(Integer.parseInt(fileid));
		} catch (Exception e) {//参数错误
			return -1;
		}
	}
	
    /**
     * 帮助列表（页面跳转）
     * @param request
     * @return
     */
    @RequestMapping("/helplist")
    public String helplist(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return "helplist";
		}
		if(user.getRole()==0) {
			return "admin/helplist";
		}else {
			return "helplist";
		}
    }
    
    /**
     * 帮助列表
     * @param page
     * @param pageSize
     * @return
     */
	@RequestMapping("/listhelp")
	public @ResponseBody PageInfo<HelpInfo> listhelp(
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize
			) {
		PageHelper.startPage(page, pageSize); 
		List<HelpInfo> list = siteInfoServeice.selectHelpAll();
		return new PageInfo<HelpInfo>(list);
	}
	
    /**
     * 帮助详情内容
     * @param request
     * @return
     */
	@RequestMapping("/helpinfo")
	public @ResponseBody HelpInfo helpinfo(HttpServletRequest request) {
		String helpid = request.getParameter("helpid");
		if(StringUtils.isNotNullString(helpid)) {
			return siteInfoServeice.selectHelpById(Integer.parseInt(helpid));
		}else {
			return null;
		}
	}
	
	/**
	 * 删除帮助
	 * @param request
	 * @return
	 */
	@RequestMapping("/deletehelp")
    public @ResponseBody Integer deletehelp(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		String helpid = request.getParameter("helpid");
		if(helpid==null) {
			return 0;
		}
		try {
			return siteInfoServeice.deleteHelpById(Integer.parseInt(helpid));
		} catch (Exception e) {//参数错误
			return -1;
		}
	}
    
	/**
	 * 新增帮助（编辑）
	 * @param request
	 * @return
	 */
	@RequestMapping("/addhelp")
    public @ResponseBody Integer addhelp(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		
		String helptitle = request.getParameter("helptitle");
		String helptype = request.getParameter("helptype");
		String helpcontent = request.getParameter("helpcontent");
		String helpid = request.getParameter("helpid");
		
		HelpInfo info = new HelpInfo();
		
		try {
			if(StringUtils.isNotNullString(helptitle,helptype,helpcontent,helpid)) {//编辑
				info.sethId(Integer.parseInt(helpid));
				info.sethTitle(helptitle);
				info.sethType(helptype);
				info.sethContent(helpcontent);

				return siteInfoServeice.updateHelpByIdSelective(info);
			}
			if(StringUtils.isNotNullString(helptitle,helptype,helpcontent)) {//新增
				info.sethTitle(helptitle);
				info.sethType(helptype);
				info.sethContent(helpcontent);

				return siteInfoServeice.insertHelpSelective(info);
			}
		} catch (Exception e) {//参数转换错误
			return -1;
		}
		return 0;
	}
	
    /**
     * 友情链接（页面跳转）
     * @param request
     * @return
     */
    @RequestMapping("/linklist")
    public String listlink(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return "linklist";
		}
		if(user.getRole()==0) {
			return "admin/linklist";
		}else {
			return "linklist";
		}
    }
	
    /**
     * 友情链接列表
     * @param page
     * @param pageSize
     * @return
     */
	@RequestMapping("/listLinks")
	public @ResponseBody PageInfo<LinksInfo> listLiks(
			@RequestParam(required=true,defaultValue="1") Integer page,
			@RequestParam(required=true,defaultValue="5") Integer pageSize
			) {
		PageHelper.startPage(page, pageSize); 
		List<LinksInfo> linkList = siteInfoServeice.selectLinkAll();
		return new PageInfo<>(linkList);
	}
	
    /**
     * 链接详情内容
     * @param request
     * @return
     */
	@RequestMapping("/linkinfo")
	public @ResponseBody LinksInfo linkinfo(HttpServletRequest request) {
		String linkid = request.getParameter("linkid");
		if(StringUtils.isNotNullString(linkid)) {
			return siteInfoServeice.selectLinkById(Integer.parseInt(linkid));
		}else {
			return null;
		}
	}
	
	/**
	 * 删除链接
	 * @param request
	 * @return
	 */
	@RequestMapping("/deletelink")
    public @ResponseBody Integer deletelink(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		String linkid = request.getParameter("linkid");
		if(linkid==null) {
			return 0;
		}
		try {
			return siteInfoServeice.deleteLinkById(Integer.parseInt(linkid));
		} catch (Exception e) {//参数错误
			return -1;
		}
	}
	
	/**
	 * 新增链接（编辑）
	 * @param request
	 * @return
	 */
	@RequestMapping("/addlink")
    public @ResponseBody Integer addlink(HttpServletRequest request) {
		UserInfo user = (UserInfo) request.getSession().getAttribute("user");
		if(user==null) {
			return 0;
		}
		
		String linkname = request.getParameter("linkname");
		String linkurl = request.getParameter("linkurl");
		String linkid = request.getParameter("linkid");
		
		LinksInfo linkinfo = new LinksInfo();
		LinksInfo link = siteInfoServeice.selectLinkByname(linkname);
		
		try {
			if(StringUtils.isNotNullString(linkname,linkurl,linkid)) {//编辑
				if(link!=null) {//标题已存在
					if(!linkname.equals(link.getLiName())) {
						return -2;
					}
				}
				linkinfo.setLiId(Integer.parseInt(linkid));
				linkinfo.setLiName(linkname);
				linkinfo.setLiUrl(linkurl);

				return siteInfoServeice.updateLinkByIdSelective(linkinfo);
			}
			if(StringUtils.isNotNullString(linkname,linkurl)) {//新增
				if(link!=null) {//标题已存在
					return -2;
				}
				linkinfo.setLiName(linkname);
				linkinfo.setLiUrl(linkurl);

				return siteInfoServeice.insertLink(linkinfo);
			}
		} catch (Exception e) {//参数转换错误
			return -1;
		}
		return 0;
	}
	/*** 
     * 导出立项信息 
     * @return 
     * @throws Exception 
     */
    @RequestMapping("/exportStart")
    public void exportStart(HttpServletRequest request,  HttpServletResponse response) 
    		throws Exception {  
        //参数获取及处理
    	//项目信息
    	String pId = request.getParameter("pId");
		ProjectBase info = projectBaseService.selectById(Integer.parseInt(pId));
		if(info==null) {
			return;
		}
		//成员信息
		List<ProjectBaseView> list = projectBaseService.selectByPbid(Integer.parseInt(pId));
    	
        //把要填写的数据放在一个map里  
        Map<String, Object> map = new HashMap<>();
        map.put("filename", "0001");
        map.put("title", "立项信息");
        map.put("info", info);
        map.put("memberinfo", list);
        WordUtils.exportWord(request, response, map);
    }  
}