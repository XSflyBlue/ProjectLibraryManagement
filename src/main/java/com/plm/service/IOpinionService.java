package com.plm.service;

import java.util.List;

import com.plm.model.OpinionInfo;

/**
 * 审核信息管理服务
 * @author Flyblue
 *
 */
public interface IOpinionService {
	
	//其他过程（除预算和周报）
	//增
	/**
	 * 新增审核信息
	 * @param opInfo
	 * @param processId ,int processId,int opType
	 * @return
	 */
	int addOpinion(OpinionInfo opInfo);
	//删
	/**
	 * 删除审核信息
	 * @param opInfo
	 * @param opType
	 * @return
	 */
	int deleteOpinion(Integer oId);
	//改
	/**
	 * 修改审核信息
	 * @param opInfo
	 * @return
	 */
	int editOpinion(OpinionInfo opInfo);
	//查
	/**
	 * 查询审核信息
	 * @param proceessId
	 * @return
	 */
	List<OpinionInfo> findOpinion(int proceessId);
	
	/**
	 * 查询审核信息(通过项目过程id，用户类型)
	 * @param outype
	 * @param proceessId
	 * @return
	 */
	OpinionInfo findOpinion(int proceessId,int outype);
}
