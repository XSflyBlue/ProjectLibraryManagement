package com.plm.service;

import java.util.List;
import java.util.Map;

import com.plm.model.OpinionInfo;
import com.plm.model.Pblevel;
import com.plm.model.Pbtype;
import com.plm.model.ProjectBase;
import com.plm.model.ProjectEndView;
import com.plm.model.ProjectMidView;
import com.plm.model.ProjectOtherView;
import com.plm.model.ProjectProcessInfo;
import com.plm.model.ProjectStartView;

/**
 * 项目拓展管理服务
 * @author Flyblue
 *
 */
public interface IProjectExtendService {
	/**
	 * 增
	 * @param ppinfo
	 * @return
	 */
	int addProcessInfo(ProjectProcessInfo ppinfo);
	/**
	 * 删
	 * @param ppid
	 * @return
	 */
	int deleteProcessInfo(Integer ppid);
	/**
	 * 改
	 * @param ppinfo
	 * @return
	 */
	int editProcessInfo(ProjectProcessInfo ppinfo);
	//立项
	//查
	/**
	 * 按用户查
	 * @param userid
	 * @return
	 */
	List<ProjectStartView> findProjectStartView(Integer userid);
	/**
	 * 查看所有
	 * @return
	 */
	List<ProjectStartView> findProjectStartView();
	/**
	 * 按学院
	 * @param college
	 * @return
	 */
	List<ProjectStartView> findProjectStartView(String college);
	//中期
	/**
	 * 查
	 * @param userid
	 * @return
	 */
	List<ProjectMidView> findProjectMidView(Integer userid);
	
	/**
	 * 查看所有
	 * @return
	 */
	List<ProjectMidView> findProjectMidView();
	/**
	 * 按学院
	 * @param college
	 * @return
	 */
	List<ProjectMidView> findProjectMidView(String college);
	
	ProjectMidView findProjectMidViewDetail(Integer ppiId);
	//验收
	/**
	 * 查
	 * @param userid
	 * @return
	 */
	List<ProjectEndView> findProjectEndView(Integer userid);
	
	/**
	 * 查看所有
	 * @return
	 */
	List<ProjectEndView> findProjectEndView();
	/**
	 * 按学院
	 * @param college
	 * @return
	 */
	List<ProjectEndView> findProjectEndView(String college);
	
	ProjectEndView findProjectEndViewDetail(Integer ppiId);
	//其他
	/**
	 * 查
	 * @param userid
	 * @return
	 */
	List<ProjectOtherView> findProjectOtherView(Integer userid);
	
	/**
	 * 查看所有
	 * @return
	 */
	List<ProjectOtherView> findProjectOtherView();
	/**
	 * 按学院
	 * @param college
	 * @return
	 */
	List<ProjectOtherView> findProjectOtherView(String college);
	/**
	 * 查询其他申请详情
	 * @param ppiId
	 * @return
	 */
	ProjectOtherView findProjectOtherViewDetail(Integer ppiId);
	//存储过程
	/**
	 * 增加立项
	 * @param project
	 * @return
	 */
    int addproject(ProjectBase project);
	/**
	 * 增加成员信息
	 * @param pbId
	 * @param uCode
	 * @param uType
	 * @return
	 */
    int addprojectuser(Integer pbId,String uCode,Integer uType);
	/**
	 * 增加中期信息
	 * @param pmid
	 * @return
	 */
    int addmidprocess(ProjectMidView pmid);
	/**
	 * 增加验收信息
	 * @param pend
	 * @return
	 */
    int addendprocess(ProjectEndView pend);
	/**
	 * 增加其他申请信息
	 */
    int addotherprocess(ProjectOtherView pother);
	/**
	 * 增加审核信息
	 * @param opinfo
	 * @return
	 */
    int addopinion(OpinionInfo opinfo);
	/**
	 * 修改审核信息
	 * @param opinfo
	 * @return
	 */
    int editopinion(OpinionInfo opinfo);
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
