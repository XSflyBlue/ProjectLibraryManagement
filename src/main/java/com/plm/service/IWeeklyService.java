package com.plm.service;

import java.util.List;

import com.plm.model.WeeklyInfo;
import com.plm.model.WeeklyView;

/**
 * 项目周报管理服务
 * 
 * @author Flyblue
 *
 */
public interface IWeeklyService {
	// 周报
	// 增
	/**
	 * 新增一条周报
	 * 
	 * @param weekly
	 * @return
	 */
	int addWeeklyInfo(WeeklyInfo weekly);

	// 删
	/**
	 * 删除一条周报
	 * 
	 * @param weeklyId
	 * @return
	 */
	int deleteWeeklyInfo(int weeklyId);

	/**
	 * 删除多条周报
	 * 
	 * @param weeklyIdList
	 * @return
	 */
	int deleteWeeklyInfo(List<Integer> weeklyIdList);

	// 改
	/**
	 * 修改周报信息（内容）
	 * 
	 * @param weekly
	 * @param userId
	 * @return
	 */
	int editWeeklyInfo(WeeklyInfo weekly);

	// 查
	/**
	 * 查看周报信息
	 * 
	 * @param userId
	 * @param projectId
	 * @return
	 */
	List<WeeklyView> findWeekly(int userId, int projectId);
	
	/**
	 * 查看周报信息
	 * 
	 * @param weeklyId
	 * @return
	 */
	WeeklyInfo findWeekly(int weeklyId);
}
