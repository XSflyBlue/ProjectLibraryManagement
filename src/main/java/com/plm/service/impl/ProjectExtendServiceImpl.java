package com.plm.service.impl;

import com.plm.dao.*;
import com.plm.model.*;
import com.plm.service.IProjectExtendService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("projectExtendService")
public class ProjectExtendServiceImpl implements IProjectExtendService {

	@Resource
	private ProjectStartViewMapper psViewDao;
	private ProjectStartViewExample psViewEx;
	@Resource
	private ProjectMidViewMapper pmViewDao;
	private ProjectMidViewExample pmViewEx;
	@Resource
	private ProjectEndViewMapper peViewDao;
	private ProjectEndViewExample peViewEx;
	@Resource
	private ProjectOtherViewMapper poViewDao;
	private ProjectOtherViewExample poViewEx;
	@Resource
	private ProcessMapper processDao;
	@Resource
	private ProjectBaseMapper pbDao;
	private ProjectBaseExample pbEx;
	@Resource
	private ProjectProcessInfoMapper ppiDao;
	
	public int addProcessInfo(ProjectProcessInfo ppinfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteProcessInfo(Integer ppid) {
		return ppiDao.deleteByPrimaryKey(ppid);
	}

	public int editProcessInfo(ProjectProcessInfo ppinfo) {
		return ppiDao.updateByPrimaryKeySelective(ppinfo);
	}

	public List<ProjectStartView> findProjectStartView(Integer userid) {
		psViewEx = new ProjectStartViewExample();
		psViewEx.createCriteria().andUIdEqualTo(userid);
		List<ProjectStartView> psviewList = psViewDao.selectByExample(psViewEx);
		if (!psviewList.isEmpty()) {
			return psviewList;
		}
		return null;
	}

	public List<ProjectMidView> findProjectMidView(Integer userid) {
		pmViewEx = new ProjectMidViewExample();
		pmViewEx.createCriteria().andUIdEqualTo(userid);
		List<ProjectMidView> pmviewList = pmViewDao.selectByExample(pmViewEx);
		if (!pmviewList.isEmpty()) {
			return pmviewList;
		}
		return null;
	}

	public List<ProjectEndView> findProjectEndView(Integer userid) {
		peViewEx = new ProjectEndViewExample();
		peViewEx.createCriteria().andUIdEqualTo(userid);
		List<ProjectEndView> peviewList = peViewDao.selectByExample(peViewEx);
		if (!peviewList.isEmpty()) {
			return peviewList;
		}
		return null;
	}

	public List<ProjectOtherView> findProjectOtherView(Integer userid) {
		poViewEx = new ProjectOtherViewExample();
		poViewEx.createCriteria().andUIdEqualTo(userid);
		List<ProjectOtherView> poviewList = poViewDao.selectByExample(poViewEx);
		if (!poviewList.isEmpty()) {
			return poviewList;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public int addproject(ProjectBase project) {
		pbEx = new ProjectBaseExample();
		pbEx.createCriteria().andPbNameEqualTo(project.getPbName());
		List<ProjectBase> pblist = pbDao.selectByExample(pbEx);
		if(pblist != null&&pblist.size()>0) {//存在相同名字的项目
			return -1;
		}

		@SuppressWarnings("rawtypes")
		Map map=new HashMap();
		map.put("ppId", project.getPpId());
        map.put("pbName", project.getPbName());
        map.put("pbLevel", project.getPbLevel());
        map.put("pbType", project.getPbType());
        map.put("subjectType",project.getSubjectType());
        map.put("psiBrief", project.getPsiBrief());
        map.put("psiReason", project.getPsiReason());
        map.put("psiContent", project.getPsiContent());
        map.put("psiFeature",project.getPsiFeature());
        map.put("psiPlan", project.getPsiPlan());
        map.put("psiResult", project.getPsiResult());
        processDao.addproject(map);
        
        //返回项目id
        if(map.get("pbId")!=null) {
			return (int) (Integer) map.get("pbId");
        }
        return 0;
	}

	@SuppressWarnings("unchecked")
	public int addprojectuser(Integer pbId,String uCode,Integer uType) {
		@SuppressWarnings("rawtypes")
		Map map=new HashMap();
		map.put("pbId", pbId);
		map.put("uCode", uCode);
		map.put("uType", uType);
		
        processDao.addprojectuser(map);
        //返回项目id
        if(map.get("flag")!=null) {
			return (int) (Integer) map.get("flag");
        }
        return 0;
	}

	@SuppressWarnings("unchecked")
	public int addmidprocess(ProjectMidView pmid) {
		@SuppressWarnings("rawtypes")
		Map map=new HashMap();
		map.put("pbId", pmid.getPbId());
		map.put("pmiContent", pmid.getPmiContent());
		map.put("pmiIssue", pmid.getPmiIssue());
		
        processDao.addmidprocess(map);
        //返回项目id
        if(map.get("flag")!=null) {
			return (int) (Integer) map.get("flag");
        }
        return 0;
	}

	@SuppressWarnings("unchecked")
	public int addendprocess(ProjectEndView pend) {
		@SuppressWarnings("rawtypes")
		Map map=new HashMap();
		map.put("pbId", pend.getPbId());
		map.put("pmiContent", pend.getPmiContent());
		map.put("peiLevel", pend.getPeiLevel());
		map.put("peiMission", pend.getPeiMission());
		map.put("peiOpoinion", pend.getPeiOpoinion());
		
        processDao.addendprocess(map);
        //返回项目id
        if(map.get("flag")!=null) {
			return (int) (Integer) map.get("flag");
        }
        return 0;
	}

	@SuppressWarnings("unchecked")
	public int addotherprocess(ProjectOtherView pother) {
		@SuppressWarnings("rawtypes")
		Map map=new HashMap();
		map.put("pbId", pother.getPbId());
		map.put("poiType", pother.getPoiType());
		map.put("poiContent",pother.getPoiContent());
		
        processDao.addotherprocess(map);
        //返回项目id
        if(map.get("flag")!=null) {
			return (int) (Integer) map.get("flag");
        }
        return 0;
	}

	@SuppressWarnings("unchecked")
	public int addopinion(OpinionInfo opinfo) {
		@SuppressWarnings("rawtypes")
		Map map=new HashMap();
		map.put("ppiId", opinfo.getPpiId());
		map.put("oUType", opinfo.getoUType());
		map.put("oContent", opinfo.getoContent());
		map.put("oStatus", opinfo.getoStatus());
		
        processDao.addopinion(map);
        //返回项目id
        if(map.get("flag")!=null) {
			return (int) (Integer) map.get("flag");
        }
        return 0;
	}

	@SuppressWarnings("unchecked")
	public int editopinion(OpinionInfo opinfo) {
		@SuppressWarnings("rawtypes")
		Map map=new HashMap();
		map.put("oId", opinfo.getoId());
		map.put("ppiId", opinfo.getPpiId());
		map.put("oUType", opinfo.getoUType());
		map.put("oContent", opinfo.getoContent());
		map.put("oStatus", opinfo.getoStatus());
		
        processDao.editopinion(map);
        //返回项目id
        if(map.get("flag")!=null) {
			return (int) (Integer) map.get("flag");
        }
        return 0;
	}

	public ProjectMidView findProjectMidViewDetail(Integer ppiId) {
		pmViewEx = new ProjectMidViewExample();
		pmViewEx.createCriteria().andPpiIdEqualTo(ppiId);
		List<ProjectMidView> pmviewList = pmViewDao.selectByExample(pmViewEx);
		if (!pmviewList.isEmpty()) {
			return pmviewList.get(0);
		}
		return null;
	}

	public ProjectEndView findProjectEndViewDetail(Integer ppiId) {
		peViewEx = new ProjectEndViewExample();
		peViewEx.createCriteria().andPpiIdEqualTo(ppiId);
		List<ProjectEndView> peviewList = peViewDao.selectByExample(peViewEx);
		if (!peviewList.isEmpty()) {
			return peviewList.get(0);
		}
		return null;
	}

	public ProjectOtherView findProjectOtherViewDetail(Integer ppiId) {
		poViewEx = new ProjectOtherViewExample();
		poViewEx.createCriteria().andPpiIdEqualTo(ppiId);
		List<ProjectOtherView> poviewList = poViewDao.selectByExample(poViewEx);
		if (!poviewList.isEmpty()) {
			return poviewList.get(0);
		}
		return null;
	}

	public List<ProjectStartView> findProjectStartView() {
		psViewEx = new ProjectStartViewExample();
		psViewEx.createCriteria().andPbIdIsNotNull();
		List<ProjectStartView> psviewList = psViewDao.selectHasGroup(psViewEx);
		if (!psviewList.isEmpty()) {
			return psviewList;
		}
		return null;
	}

	public List<ProjectStartView> findProjectStartView(String college) {
		List<ProjectStartView> psviewList = psViewDao.selectByCollege(college);
		if (!psviewList.isEmpty()) {
			return psviewList;
		}
		return null;
	}

	public List<ProjectMidView> findProjectMidView() {
		pmViewEx = new ProjectMidViewExample();
		pmViewEx.createCriteria().andPbIdIsNotNull();
		List<ProjectMidView> pmviewList = pmViewDao.selectHasGroup(pmViewEx);
		if (!pmviewList.isEmpty()) {
			return pmviewList;
		}
		return null;
	}

	public List<ProjectMidView> findProjectMidView(String college) {
		List<ProjectMidView> pmviewList = pmViewDao.selectByCollege(college);
		if (!pmviewList.isEmpty()) {
			return pmviewList;
		}
		return null;
	}

	public List<ProjectEndView> findProjectEndView() {
		peViewEx = new ProjectEndViewExample();
		peViewEx.createCriteria().andPbIdIsNotNull();
		List<ProjectEndView> peviewList = peViewDao.selectHasGroup(peViewEx);
		if (!peviewList.isEmpty()) {
			return peviewList;
		}
		return null;
	}

	public List<ProjectEndView> findProjectEndView(String college) {
		peViewEx = new ProjectEndViewExample();
		peViewEx.createCriteria().andPbIdIsNotNull();
		List<ProjectEndView> peviewList = peViewDao.selectByCollege(college);
		if (!peviewList.isEmpty()) {
			return peviewList;
		}
		return null;
	}

	public List<ProjectOtherView> findProjectOtherView() {
		poViewEx = new ProjectOtherViewExample();
		poViewEx.createCriteria().andPbIdIsNotNull();
		List<ProjectOtherView> poviewList = poViewDao.selectHasGroup(poViewEx);
		if (!poviewList.isEmpty()) {
			return poviewList;
		}
		return null;
	}

	public List<ProjectOtherView> findProjectOtherView(String college) {
		List<ProjectOtherView> poviewList = poViewDao.selectByCollege(college);
		if (!poviewList.isEmpty()) {
			return poviewList;
		}
		return null;
	}

	public Pblevel findpblevel() {
		return processDao.findpblevel();
	}

	public Pbtype findpbtype() {
		return processDao.findpbtype();
	}

	public Pbtype findpbstatus() {
		return processDao.findpbstatus();
	}

	public List<Map<String, Object>> findpbplan() {
		return processDao.findpbplan();
	}

	public List<Map<String, Object>> findpbstudent() {
		return processDao.findpbstudent();
	}

	public List<Map<String, Object>> findpbcolstudent(String college) {
		return processDao.findpbcolstudent(college);
	}

	public Pbtype findpbsubject() {
		return processDao.findpbsubject();
	}

}
