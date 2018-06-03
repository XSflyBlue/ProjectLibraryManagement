package com.plm.service;

import java.util.List;

import com.plm.model.ProjectPlan;
import com.plm.model.ProjectPlanView;
import com.plm.model.UserInfo;

/**
 * 项目计划管理服务
 * @author Flyblue
 *
 */
public interface IProjectPlanService {
	/**
	 * 增加一条计划
	 * @param plan
	 * @return
	 */
	int addProjectPlan(ProjectPlan plan);
	/**
	 * 删除一条计划
	 * @param planId
	 * @return
	 */
	int deleteProjectPlan(int planId);
	//改
	/**
	 * 修改计划
	 * @param plan
	 * @return
	 */
	int editProjectPlan(ProjectPlan plan);
	//查
	/**
	 * 查询计划（计划id）
	 * @param planId
	 * @return
	 */
	ProjectPlan findProjectPlan(int planId);
	/**
	 * 查询项目含项目（计划id）
	 * @param planId
	 * @return
	 */
	List<ProjectPlanView> findProject(int planId);
	
	/**
	 * 查询计划（全部）
	 * @param planId
	 * @return
	 */
	List<ProjectPlan> findProjectPlanAll();
	
	/**
	 * 查询计划（选择）
	 * @param planId
	 * @return
	 */
	List<ProjectPlan> findProjectPlanByUser(UserInfo user);
}
