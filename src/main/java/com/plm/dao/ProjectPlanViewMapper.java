package com.plm.dao;

import com.plm.model.ProjectPlanView;
import com.plm.model.ProjectPlanViewExample;
import java.util.List;

public interface ProjectPlanViewMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_plan_view
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	int insert(ProjectPlanView record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_plan_view
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	int insertSelective(ProjectPlanView record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_plan_view
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	List<ProjectPlanView> selectByExample(ProjectPlanViewExample example);
}