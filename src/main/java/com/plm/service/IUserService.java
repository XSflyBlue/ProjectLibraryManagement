package com.plm.service;

import java.util.List;

import com.plm.model.UserInfo;
import com.plm.model.UserInfoExample;


/**
 * 用户管理相关服务类
 * @author Flyblue
 *
 */
public interface IUserService {
//----------------------新增用户-------------------------
	/**
	 * 新增用户（选择性数据）
	 * @param user
	 * @return 1为成功，0为失败
	 */
	public int insertUserSelective(UserInfo user);
	
	/**
	 * 新增管理员（超级管理员、学校教务部门管理员、学院或系管理员）（选择性数据）
	 * @param user
	 * @return 1为成功，0为失败
	 */
	public int insertUserAdminSelective(UserInfo user);
	
	/**
	 * 新增学生（选择性数据）
	 * @param UserBase,StudentInfo
	 * @return 1为成功，0为失败
	 */
	public int insertUserStuSelective(UserInfo user);
	
	/**
	 * 新增导师/评审（选择性数据）
	 * @param UserBase,TutorExpertInfo
	 * @return 1为成功，0为失败
	 */
	public int insertUserTuSelective(UserInfo user);
//----------------------查询用户信息-------------------------
	/**
	 * 查询所有用户
	 * @return List<UserBase>
	 */
	public List<UserInfo> selectUserAll();
	/**
	 * 查询用户（通过id）
	 * @param id
	 * @return UserBase
	 */
	public UserInfo selectUserById(int id);
	/**
	 * 查询用户（通过用户名）
	 * @param username
	 * @return UserBase
	 */
	public UserInfo selectUserByUsename(String username);
	/**
	 * 查询用户（通过邮箱）
	 * @param email
	 * @return UserBase
	 */
	public UserInfo selectUserByEmail(String email);
	
	/**
	 * 查询用户（通过uCode）
	 * @param email
	 * @return UserBase
	 */
	public UserInfo selectUserByuCode(String uCode);
	/**
	 * 查询用户列表（）
	 * @param userEx
	 * @return List<UserBase>
	 */
	public List<UserInfo> selectUserByExample(UserInfoExample userEx);
	
	/**
	 * 学校教务管理员查询用户
	 * @return
	 */
	public List<UserInfo> selectUserList(int role);
	
	/**
	 * 学院查询用户
	 * @return
	 */
	public List<UserInfo> selectUserList(String college,int role);
//----------------------更新用户信息-------------------------
	/**
	 * 更新用户状态（通过id）
	 * @param id,status(0未激活，1已激活)
	 * @return 1为成功，0为失败
	 */
	public int updateUserStatusById(Integer id,Integer status);
	/**
	 * 更新用户（通过id）
	 * @param user
	 * @return 1为成功，0为失败
	 */
	public int updateUserById(UserInfo user);
//----------------------删除用户信息-------------------------
	/**
	 * 删除用户（通过id）
	 * @param id
	 * @return 1为成功，0为失败
	 */
	public int deleteUserById(int id);
}
