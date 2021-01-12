package com.plm.service.impl;

import com.plm.dao.UserInfoMapper;
import com.plm.model.UserInfo;
import com.plm.model.UserInfoExample;
import com.plm.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Resource
	private UserInfoMapper userInfoDao;
	private UserInfoExample userEx;

	//插入学生用户
	public int insertUserStuSelective(UserInfo user) {
		return 0;
	}
	
	//插入用户
	public int insertUserSelective(UserInfo user) {
		return userInfoDao.insertSelective(user);
	}

	//插入管理员用户
	public int insertUserAdminSelective(UserInfo user) {
		return 0;
	}

	//插入导师/评审
	public int insertUserTuSelective(UserInfo user) {
		return 0;
	}
	
	//查询所有用户
	public List<UserInfo> selectUserAll() {
		userEx = new UserInfoExample();
		userEx.createCriteria().andUIdIsNotNull();
		
    	List <UserInfo> userList = userInfoDao.selectByExample(userEx);
    	if(!userList.isEmpty()&&userList.size()>0) {
    		return userList;
    	}
    	return null;
	}

	// 根据ID查询用户信息
	public UserInfo selectUserById(int id) {
		return this.userInfoDao.selectByPrimaryKey(id);
	}

	// 动态查询查询
	public List<UserInfo> selectUserByExample(UserInfoExample userEx) {
		this.userEx = userEx;
		return this.userInfoDao.selectByExample(userEx);
	}

	// 更新用户信息
	public int updateUserById(UserInfo user) {
		return this.userInfoDao.updateByPrimaryKeySelective(user);
	}

	// 删除用户信息
	public int deleteUserById(int id) {
		return this.userInfoDao.deleteByPrimaryKey(id);
	}

	// 根据用户名查询
	public UserInfo selectUserByUsename(String username) {
		if(username == null) {
			return null;
		}
		userEx = new UserInfoExample();
    	userEx.createCriteria().andUNameEqualTo(username);
    	
    	List <UserInfo> userList = userInfoDao.selectByExample(userEx);
    	UserInfo user = null;
    	if(!userList.isEmpty()) {
    		user = userList.get(0);
    	}
    	return user;
	}

	// 根据用户邮箱查询
	public UserInfo selectUserByEmail(String email) {
		if(email == null) {
			return null;
		}
		userEx = new UserInfoExample();
    	userEx.createCriteria().andEmailEqualTo(email);
    	
    	List <UserInfo> userList = userInfoDao.selectByExample(userEx);
    	UserInfo user = null;
    	if(!userList.isEmpty()) {
    		user = userList.get(0);
    	}
    	return user;
	}

	//根据用户ucode查询
	public UserInfo selectUserByuCode(String uCode) {
		if(uCode == null) {
			return null;
		}
		userEx = new UserInfoExample();
    	userEx.createCriteria().andUCodeEqualTo(uCode);
    	
    	List <UserInfo> userList = userInfoDao.selectByExample(userEx);
    	UserInfo user = null;
    	if(!userList.isEmpty()) {
    		user = userList.get(0);
    	}
    	return user;
	}

	//更新用户状态（通过id）
	public int updateUserStatusById(Integer id, Integer status) {
		int flag;
		UserInfo user = new UserInfo();
		user.setuId(id);
		user.setStatus(status);
		flag = updateUserById(user);
		return flag;
	}

	public List<UserInfo> selectUserList(int role) {
		userEx = new UserInfoExample();
		userEx.createCriteria().andRoleEqualTo(role);
		
    	List <UserInfo> userList = userInfoDao.selectByExample(userEx);
    	if(!userList.isEmpty()) {
    		return userList;
    	}
    	return null;
	}

	public List<UserInfo> selectUserList(String college, int role) {
		userEx = new UserInfoExample();
		userEx.createCriteria().andRoleEqualTo(role).andCollegeEqualTo(college);
		
    	List <UserInfo> userList = userInfoDao.selectByExample(userEx);
    	if(!userList.isEmpty()) {
    		return userList;
    	}
    	return null;
	}
}
