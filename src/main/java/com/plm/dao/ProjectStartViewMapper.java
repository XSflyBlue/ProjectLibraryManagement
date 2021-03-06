package com.plm.dao;

import com.plm.model.ProjectStartView;
import com.plm.model.ProjectStartViewExample;
import java.util.List;

public interface ProjectStartViewMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_start_view
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	int insert(ProjectStartView record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_start_view
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	int insertSelective(ProjectStartView record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table project_start_view
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	List<ProjectStartView> selectByExample(ProjectStartViewExample example);
	
	List<ProjectStartView> selectHasGroup(ProjectStartViewExample example);
	
	List<ProjectStartView> selectByCollege(String college);
}