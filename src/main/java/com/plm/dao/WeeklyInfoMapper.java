package com.plm.dao;

import com.plm.model.WeeklyInfo;
import com.plm.model.WeeklyInfoExample;
import java.util.List;

public interface WeeklyInfoMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	int deleteByPrimaryKey(Integer wId);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	int insert(WeeklyInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	int insertSelective(WeeklyInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	List<WeeklyInfo> selectByExample(WeeklyInfoExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	WeeklyInfo selectByPrimaryKey(Integer wId);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	int updateByPrimaryKeySelective(WeeklyInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table weekly_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	int updateByPrimaryKey(WeeklyInfo record);
}