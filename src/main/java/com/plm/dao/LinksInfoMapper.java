package com.plm.dao;

import com.plm.model.LinksInfo;
import com.plm.model.LinksInfoExample;
import java.util.List;

public interface LinksInfoMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table links_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	int deleteByPrimaryKey(Integer liId);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table links_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	int insert(LinksInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table links_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	int insertSelective(LinksInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table links_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	List<LinksInfo> selectByExample(LinksInfoExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table links_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	LinksInfo selectByPrimaryKey(Integer liId);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table links_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	int updateByPrimaryKeySelective(LinksInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table links_info
	 * @mbg.generated  Tue May 15 22:59:52 CST 2018
	 */
	int updateByPrimaryKey(LinksInfo record);
}