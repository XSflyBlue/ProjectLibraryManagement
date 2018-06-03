package com.plm.service;

import java.util.List;

import com.plm.model.ProjectBase;
import com.plm.model.ProjectBaseView;
import com.plm.model.ProjectFundsView;
import com.plm.model.ProjectUser;
import com.plm.model.UserInfo;

/**
 * 项目基本信息管理服务
 * @author Flyblue
 *
 */
public interface IProjectBaseService {
	//删除
	/**
	 * 删除一条记录（通过id）
	 * @param pbId
	 * @return
	 */
    int deleteProject(Integer pbId);
	/**
	 * 删除多条记录（通过id）
	 * @param pbId
	 * @return
	 */
    int deleteProject(List<Integer> pbId);
    //增
    /**
     * 插入一条记录
     * @param record
     * @return
     */
    int addProject(ProjectBase record);
    //查
    /**
     * 查询记录（通过用户id）
     * @param userId
     * @param uType
     * @return
     */
    List<ProjectBaseView> findProject(UserInfo user);
    /**
     * 查询所有记录
     * @return
     */
    List<ProjectBaseView> findAll();
    /**
     * 查询记录（通过项目级别）
     * @param example
     * @return
     */
    List<ProjectBaseView> selectByLevel(Integer level);
    /**
     * 查询记录（通过项目类型）
     * @param example
     * @return
     */
    List<ProjectBaseView> selectByType(Integer type);
    /**
     * 查询记录（通过项目id）
     * @param example
     * @return
     */
    List<ProjectBaseView> selectByPbid(Integer projectid);
    /**
     * 查询记录（通过项目学科类别）
     * @param example
     * @return
     */
    List<ProjectBaseView> selectBySubjectType(Integer subjectType);
    /**
     * 查询一条记录（通过id）
     * @param pbId
     * @return
     */
    ProjectBase selectById(Integer pbId);
    //改
    /**
     * 更新一条记录
     * @param record
     * @return
     */
    int editProject(ProjectBase record);
    /**
     * 更新项目状态（全）
     * @param record
     * @return
     */
    int editProjectStatus(Integer status,Integer pid);
    /**
     * 查询项目预算列表
     * @param example
     * @return
     */
    List<ProjectFundsView> findfunds(Integer userid);
    
    /**
     * 查询项目预算列表
     * @param example
     * @return
     */
    List<ProjectFundsView> findfunds();
    
    /**
     * 查询项目预算列表
     * @param example
     * @return
     */
    List<ProjectFundsView> findfunds(String college);
    
    /**
     * 查询项目预算详情
     * @param example
     * @return
     */
    ProjectFundsView findfundsDetail(Integer projectId);
    
    //项目与人员关系
    int deleteprojectuser(Integer projectuserId);
    
    int editprojectuser(ProjectUser projectUser);
    
    List<ProjectUser> findprojectuserbyuser(Integer userid);
    
	List<ProjectBase> findExcellentProject();
}
