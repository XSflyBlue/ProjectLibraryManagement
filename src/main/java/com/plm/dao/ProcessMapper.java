package com.plm.dao;

import java.util.List;
import java.util.Map;

import com.plm.model.Pblevel;
import com.plm.model.Pbtype;

public interface ProcessMapper {
	/**
	 * 增加立项
	 * @param map
	 */
    public void addproject(Map<Object,Object> map);
	/**
	 * 增加成员信息
	 * @param map
	 */
	public void addprojectuser(Map<Object,Object> map);
	/**
	 * 增加中期信息
	 * @param map
	 */
	public void addmidprocess(Map<Object,Object> map);
	/**
	 * 增加验收信息
	 * @param map
	 */
	public void addendprocess(Map<Object,Object> map);
	/**
	 * 增加其他申请信息
	 * @param map
	 */
	public void addotherprocess(Map<Object,Object> map);
	/**
	 * 增加审核信息
	 * @param map
	 */
	public void addopinion(Map<Object,Object> map);
	/**
	 * 修改审核信息
	 * @param map
	 */
	public void editopinion(Map<Object,Object> map);
	/**
	 * 获取项目级别统计信息
	 * @return
	 */
	Pblevel findpblevel();
	/**
	 * 获取项目类型统计信息
	 * @return
	 */
    Pbtype findpbtype();
	/**
	 * 获取项目状态统计信息
	 * @return
	 */
    Pbtype findpbstatus();
	/**
	 * 获取项目学科统计信息
	 * @return
	 */
    Pbtype findpbsubject();
	/**
	 * 获取项目安排统计信息
	 * @return
	 */
    List<Map<String, Object>> findpbplan();
	/**
	 * 获取项目学生参与统计信息
	 * @return
	 */
    List<Map<String, Object>> findpbstudent();
	/**
	 * 获取项目学生（学院内）参与统计信息
	 * @return
	 */
    List<Map<String, Object>> findpbcolstudent(String college);
}
