package com.plm.service.impl;

import com.plm.dao.ProjectBaseMapper;
import com.plm.dao.ProjectBaseViewMapper;
import com.plm.dao.ProjectFundsViewMapper;
import com.plm.dao.ProjectUserMapper;
import com.plm.model.*;
import com.plm.service.IProjectBaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("projectBaseService")
public class ProjectBaseServiceImpl implements IProjectBaseService {
	@Resource
	private ProjectBaseViewMapper pbviewDao;
	private ProjectBaseViewExample pbViewEx;
	@Resource
	private ProjectBaseMapper pbDao;
	private ProjectBaseExample pbEx;
	
	@Resource
	private ProjectFundsViewMapper fundViewDao;
	private ProjectFundsViewExample fundViewEx;
	
	@Resource
	private ProjectUserMapper puDao;
	private ProjectUserExample puEx;
	
	public int deleteProject(Integer pbId) {
		return pbDao.deleteByPrimaryKey(pbId);
	}

	public int deleteProject(List<Integer> pbId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int addProject(ProjectBase record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<ProjectBaseView> findProject(UserInfo user) {
		pbViewEx = new ProjectBaseViewExample();
		List<ProjectBaseView> pbviewList;
		
		if(user.getRole()==1) {//学校
			pbViewEx.createCriteria().andPbIdIsNotNull();
			pbviewList = pbviewDao.selectHasGroup(pbViewEx);
		}else if(user.getRole()==2) {//学院
			pbViewEx.createCriteria().andCollegeEqualTo(user.getCollege());
			pbviewList = pbviewDao.selectHasGroup(pbViewEx);
		}else {
			pbViewEx.createCriteria().andUIdEqualTo(user.getuId());
			pbviewList = pbviewDao.selectByExample(pbViewEx);
		}
		
		
		if (!pbviewList.isEmpty()) {
			return pbviewList;
		}
		return null;
	}

	public List<ProjectBaseView> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ProjectBaseView> selectByLevel(Integer level) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ProjectBaseView> selectByType(Integer type) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ProjectBaseView> selectBySubjectType(Integer subjectType) {
		// TODO Auto-generated method stub
		return null;
	}

	public ProjectBase selectById(Integer pbId) {
		return pbDao.selectByPrimaryKey(pbId);
	}

	public int editProject(ProjectBase record) {
		return pbDao.updateByPrimaryKeySelective(record);
	}

	public int editProjectStatus(Integer status, Integer pid) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<ProjectFundsView> findfunds(Integer userid) {
		fundViewEx = new ProjectFundsViewExample();
		fundViewEx.createCriteria().andUIdEqualTo(userid);
		List<ProjectFundsView> fundViewList = fundViewDao.selectByExample(fundViewEx);
		if (!fundViewList.isEmpty()) {
			return fundViewList;
		}
		return null;
	}

	public ProjectFundsView findfundsDetail(Integer projectId) {
		fundViewEx = new ProjectFundsViewExample();
		fundViewEx.createCriteria().andPbIdEqualTo(projectId);
		List<ProjectFundsView> fundViewList = fundViewDao.selectByExample(fundViewEx);
		if (!fundViewList.isEmpty()) {
			return fundViewList.get(0);
		}
		return null;
	}

	public List<ProjectBaseView> selectByPbid(Integer projectId) {
		pbViewEx = new ProjectBaseViewExample();
		pbViewEx.createCriteria().andPbIdEqualTo(projectId);
		List<ProjectBaseView> pbviewList = pbviewDao.selectByExample(pbViewEx);
		if (!pbviewList.isEmpty()) {
			return pbviewList;
		}
		return null;
	}

	public List<ProjectFundsView> findfunds() {
		fundViewEx = new ProjectFundsViewExample();
		fundViewEx.createCriteria().andPbIdIsNotNull();
		List<ProjectFundsView> fundViewList = fundViewDao.selectHasGroup(fundViewEx);
		if (!fundViewList.isEmpty()) {
			return fundViewList;
		}
		return null;
	}

	public List<ProjectFundsView> findfunds(String college) {
		fundViewEx = new ProjectFundsViewExample();
		fundViewEx.createCriteria().andCollegeEqualTo(college);
		List<ProjectFundsView> fundViewList = fundViewDao.selectHasGroup(fundViewEx);
		if (!fundViewList.isEmpty()) {
			return fundViewList;
		}
		return null;
	}

	/**
	 * 增加修改人员关系
	 */
	public int editprojectuser(ProjectUser projectUser) {
		return puDao.updateByPrimaryKeySelective(projectUser);
	}

	/**
	 * 删除项目人员关系
	 */
	public int deleteprojectuser(Integer projectuserId) {
		return puDao.deleteByPrimaryKey(projectuserId);
	}

	/**
	 * 查询用户下用户项目关系
	 */
	public List<ProjectUser> findprojectuserbyuser(Integer userid) {
		puEx = new ProjectUserExample();
		puEx.createCriteria().andUIdEqualTo(userid);
		return puDao.selectByExample(puEx);
	}

	public List<ProjectBase> findExcellentProject() {
		pbEx = new ProjectBaseExample();
		pbEx.createCriteria().andPbStatusEqualTo(5);
		return pbDao.selectByExample(pbEx);
	}
}
