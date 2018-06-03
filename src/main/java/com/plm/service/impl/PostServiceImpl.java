package com.plm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.plm.dao.PostInfoMapper;
import com.plm.dao.PostViewMapper;
import com.plm.model.PostInfo;
import com.plm.model.PostInfoExample;
import com.plm.model.PostView;
import com.plm.model.PostViewExample;
import com.plm.service.IPostService;

@Service("postService")
public class PostServiceImpl implements IPostService {
	@Resource
	private PostViewMapper postViewDao;
	private PostViewExample postViewEx;
	@Resource
	private PostInfoMapper postDao;
	private PostInfoExample postEx;

	public int addPost(PostInfo post) {
		return postDao.insertSelective(post);
	}

	public int deletePost(int postId) {
		return postDao.deleteByPrimaryKey(postId);
	}

	public int deletePost(List<Integer> postId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int editPost(PostInfo post) {
		return postDao.updateByPrimaryKeySelective(post);
	}

	public List<PostView> findPost() {
		postViewEx = new PostViewExample();
		postViewEx.createCriteria().andPiIdIsNotNull();
		List<PostView> listPost = postViewDao.selectByExample(postViewEx);
		if (!listPost.isEmpty() && listPost.size() > 0) {
			return listPost;
		}
		return null;
	}

	public List<PostView> findPost(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<PostView> findPost(String posttitle) {
		// TODO Auto-generated method stub
		return null;
	}

	public PostView findbyPostid(int postId) {
		postViewEx = new PostViewExample();
		postViewEx.createCriteria().andPiIdEqualTo(postId);
		List<PostView> listPost = postViewDao.selectByExample(postViewEx);
		if (!listPost.isEmpty() && listPost.size() > 0) {
			return listPost.get(0);
		}
		return null;
	}

	public PostInfo findPostBytitle(String posttitle) {
		postEx = new PostInfoExample();
		postEx.createCriteria().andPiTitleEqualTo(posttitle);
		List<PostInfo> listPost = postDao.selectByExample(postEx);
		if (!listPost.isEmpty() && listPost.size() > 0) {
			return listPost.get(0);
		}
		return null;
	}

}
