package com.plm.service;

import java.util.List;

import com.plm.model.PostInfo;
import com.plm.model.PostView;

/**
 * 公告管理服务
 * @author Flyblue
 *
 */
public interface IPostService {
	//增
	/**
	 * 
	 * @param post
	 * @return
	 */
	int addPost(PostInfo post);
	//删
	/**
	 * 
	 * @param postId
	 * @return
	 */
	int deletePost(int postId);
	/**
	 * 
	 * @param postId
	 * @return
	 */
	int deletePost(List<Integer> postId);
	//改
	/**
	 * 
	 * @param post
	 * @return
	 */
	int editPost(PostInfo post);
	//查
	/**
	 * 查询公告
	 * @return
	 */
	List<PostView> findPost();
	/**
	 * 查询公告(用户id)
	 * @param userId
	 * @return
	 */
	List<PostView> findPost(int userId);
	/**
	 * 查询公告(postid)
	 * @param userId
	 * @return
	 */
	PostView findbyPostid(int postId);
	/**
	 * 查询公告(公告名模糊查询)
	 * @param userId
	 * @return
	 */
	List<PostView> findPost(String posttitle);
	
	PostInfo findPostBytitle(String posttitle);
}
