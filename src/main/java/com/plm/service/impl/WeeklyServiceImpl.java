package com.plm.service.impl;

import com.plm.dao.WeeklyInfoMapper;
import com.plm.dao.WeeklyViewMapper;
import com.plm.model.WeeklyInfo;
import com.plm.model.WeeklyView;
import com.plm.model.WeeklyViewExample;
import com.plm.service.IWeeklyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("weeklyService")
public class WeeklyServiceImpl implements IWeeklyService {
	@Resource
	private WeeklyViewMapper weekViewDao;
	private WeeklyViewExample weekViewEx;
	@Resource
	private WeeklyInfoMapper weekinfoDao;

	public int addWeeklyInfo(WeeklyInfo weekly) {
		return weekinfoDao.insertSelective(weekly);
	}

	public int deleteWeeklyInfo(int weeklyId) {
		return weekinfoDao.deleteByPrimaryKey(weeklyId);
	}

	public int deleteWeeklyInfo(List<Integer> weeklyIdList) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int editWeeklyInfo(WeeklyInfo weekly) {
		return weekinfoDao.updateByPrimaryKeySelective(weekly);
	}

	public List<WeeklyView> findWeekly(int userId, int projectId) {
		weekViewEx = new WeeklyViewExample();
		weekViewEx.createCriteria().andUIdEqualTo(userId).andPbIdEqualTo(projectId);
		List<WeeklyView> list = weekViewDao.selectByExample(weekViewEx);
		if (!list.isEmpty()) {
			return list;
		}
		return null;
	}

	public WeeklyInfo findWeekly(int weeklyId) {
		return weekinfoDao.selectByPrimaryKey(weeklyId);
	}
}
