package com.plm.service.impl;

import java.util.List;

import com.plm.model.MessageInfo;
import com.plm.model.MessageView;
import com.plm.service.IMessageService;

public class MessageServiceImpl implements IMessageService {

	public int createMessage(MessageInfo message) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int sendMessage(int messageId, int sendUserId, int reviceUserId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int sendMessage(int messageId, int sendUserId, List<Integer> reviceUserIdList) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteMessage(int messageId, int userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteMessage(int messageId, List<Integer> userIdList) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int editMessage(int messageId, int userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int editMessageStatus(int messageId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int editMessageStatus(List<Integer> messageId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<MessageView> findMessage(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<MessageView> findMessage(int userId, int type) {
		// TODO Auto-generated method stub
		return null;
	}

}
