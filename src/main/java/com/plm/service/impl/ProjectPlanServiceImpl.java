package com.plm.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.AddressException;

import org.springframework.stereotype.Service;

import com.plm.dao.ProjectBaseMapper;
import com.plm.dao.ProjectBaseViewMapper;
import com.plm.dao.ProjectPlanMapper;
import com.plm.model.ProjectBase;
import com.plm.model.ProjectBaseExample;
import com.plm.model.ProjectBaseView;
import com.plm.model.ProjectBaseViewExample;
import com.plm.model.ProjectPlan;
import com.plm.model.ProjectPlanExample;
import com.plm.model.ProjectPlanView;
import com.plm.model.UserInfo;
import com.plm.service.IProjectPlanService;
import com.plm.util.IMailService;
import com.plm.util.MailEntry;
import com.plm.util.SendEmail;
import com.plm.util.StringUtils;

@Service("projectPlanService")
public class ProjectPlanServiceImpl implements IProjectPlanService {
	@Resource
	private ProjectPlanMapper ppDao;
	private ProjectPlanExample ppEX;
	@Resource
	private ProjectBaseViewMapper pbviewDao;
	private ProjectBaseViewExample pbViewEx;
	@Resource
	private IMailService mailService;

	public int addProjectPlan(ProjectPlan plan) {
		return ppDao.insertSelective(plan);
	}

	public int deleteProjectPlan(int planId) {
		pbViewEx = new ProjectBaseViewExample();
		pbViewEx.createCriteria().andPpIdEqualTo(planId);
		List<ProjectBaseView> projectlist = pbviewDao.selectByExample(pbViewEx);
		if(projectlist!=null) {
			for(ProjectBaseView project:projectlist) {
				if(project.getPbStatus()>-1) {//安排存在项目不能删除
					return 0;
				}
			}
		}
		
		return ppDao.deleteByPrimaryKey(planId);
	}

	public int editProjectPlan(ProjectPlan plan) {
		if(plan==null) {
			return 0;
		}
		
		int flag=0;
		ProjectPlan oldplan = ppDao.selectByPrimaryKey(plan.getPpId());
		
		flag = ppDao.updateByPrimaryKeySelective(plan);
		if(flag==1) {
			pbViewEx = new ProjectBaseViewExample();
			pbViewEx.createCriteria().andPpIdEqualTo(plan.getPpId());
			List<ProjectBaseView> projectlist = pbviewDao.selectByExample(pbViewEx);
			
        	//时间变更发送邮件
			if(projectlist!=null) {
				if(plan.getPpStartTime().getTime()!=oldplan.getPpStartTime().getTime()) {//立项时间
		        	//发送邮件
		        	MailEntry startmail = new MailEntry();
		        	startmail.setSubject("项目立项时间变更通知");
					for(ProjectBaseView project:projectlist) {
						try{
							String [] addr = new String [1];
							addr[0] = project.getEmail();
							startmail.setRecipients(addr);
							startmail.setText("《"+project.getPbName()+"》项目立项时间变更为："+StringUtils.dateToStr(plan.getPpStartTime(), "yyyy-MM-dd"));
				        	mailService.sendMail(startmail);
			        	}catch (Exception e) {
			        		return 2;
						}
					}
				}
				if(plan.getPpMidTime().getTime()!=oldplan.getPpMidTime().getTime()) {//中期时间
		        	//发送邮件
		        	MailEntry midmail = new MailEntry();
		        	midmail.setSubject("项目中期检查时间变更通知");
					for(ProjectBaseView project:projectlist) {
						try{
							String [] addr = new String [1];
							addr[0] = project.getEmail();
							midmail.setRecipients(addr);
							midmail.setText("《"+project.getPbName()+"》项目中期检查变更为："+StringUtils.dateToStr(plan.getPpMidTime(), "yyyy-MM-dd"));
				        	mailService.sendMail(midmail);
			        	}catch (Exception e) {
			        		return 2;
						}
					}

				}
				if(plan.getPpEndTime().getTime()!=oldplan.getPpEndTime().getTime()) {//验收时间
		        	//发送邮件
		        	MailEntry endmail = new MailEntry();
		        	endmail.setSubject("项目验收时间变更通知");
					for(ProjectBaseView project:projectlist) {
						try{
							String [] addr = new String [1];
							addr[0] = project.getEmail();
							endmail.setRecipients(addr);
							endmail.setText("《"+project.getPbName()+"》项目验收时间变更为："+StringUtils.dateToStr(plan.getPpEndTime(), "yyyy-MM-dd"));
				        	mailService.sendMail(endmail);
			        	}catch (Exception e) {
			        		return 2;
						}
					}
				}
			}
		}
		return flag;
	}

	public ProjectPlan findProjectPlan(int planId) {
		ProjectPlan pplan;
		pplan = ppDao.selectByPrimaryKey(planId);
		if(pplan!=null) {
			return pplan;
		}
		return null;
	}

	public List<ProjectPlanView> findProjectView(int planId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ProjectPlanView> findProject(int planId) {
		return null;
	}

	public List<ProjectPlan> findProjectPlanAll() {
		ppEX = new ProjectPlanExample();
		ppEX.createCriteria().andPpIdIsNotNull();
		List<ProjectPlan> list = ppDao.selectByExample(ppEX);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

	public List<ProjectPlan> findProjectPlanByUser(UserInfo user) {
		ppEX = new ProjectPlanExample();
		//满足入学时间
		//满足年份
		ppEX.createCriteria()
		.andAcceptTimeLessThanOrEqualTo(user.getAdmissionDate())
		.andPpYearEqualTo(StringUtils.getSysYear());
		
		List<ProjectPlan> list = ppDao.selectByExample(ppEX);
		if(list!=null&&list.size()>0) {
			return list;
		}
		return null;
	}

}
