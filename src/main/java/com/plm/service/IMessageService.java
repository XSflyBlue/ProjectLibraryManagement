package com.plm.service;

import java.util.List;

import com.plm.model.MessageInfo;
import com.plm.model.MessageView;

/**
 * 站内信管理服务
 * @author Flyblue
 *
 */
public interface IMessageService {
	// 增
	/**
	 * 创建一条站内信
	 * @param message
	 * @return 成功：站内信id
	 *         失败：0
	 */
	int createMessage(MessageInfo message);
	/**
	 * 发送一条站内信
	 * @return 成功：1
	 *         失败：0
	 */
	int sendMessage(int messageId,int sendUserId,int reviceUserId);
	
	/**
	 * 发送多条站内信
	 * @return 成功：1
	 *         失败：0
	 */
	int sendMessage(int messageId,int sendUserId,List<Integer> reviceUserIdList);
	// 删
	/**
	 * 删除一条站内信
	 * @param messageId
	 * @param userId
	 * @return 成功：1
	 *         失败：0
	 */
	int deleteMessage(int messageId,int userId);
	/**
	 * 删除多条站内信
	 * @param messageId
	 * @param userIdList
	 * @return 成功：1
	 *         失败：0
	 */
	int deleteMessage(int messageId,List<Integer> userIdList);
	// 改
	/**
	 * 编辑一条站内信
	 * @param message,userId
	 * @return 成功：1
	 *         失败：0
	 */
	int editMessage(int messageId,int userId);
	
	/**
	 * 编辑一条站内信状态
	 * @param message,userId
	 * @return 成功：1
	 *         失败：0
	 */
	int editMessageStatus(int messageId);
	
	/**
	 * 编辑多条站内信状态
	 * @param message,userId
	 * @return 成功：1
	 *         失败：0
	 */
	int editMessageStatus(List<Integer> messageId);
	
	// 查
	/**
	 * 查询所有消息
	 * @param userId
	 * @return
	 */
	List<MessageView> findMessage(int userId);
	
	/**
	 * 查询所有消息（按类型）
	 * @param userId
	 * @param userId,type(0.发信人 1.收信人)
	 * @return
	 */
	List<MessageView> findMessage(int userId,int type);
}
