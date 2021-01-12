package com.plm.service.impl;

import com.plm.dao.OpinionInfoMapper;
import com.plm.model.OpinionInfo;
import com.plm.model.OpinionInfoExample;
import com.plm.service.IOpinionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("opinionService")
public class OpinionServiceImpl implements IOpinionService {
	@Resource
	private OpinionInfoMapper opinionDao;
	private OpinionInfoExample opinionEX;
	
	public int addOpinion(OpinionInfo opInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteOpinion(Integer oId) {
		return opinionDao.deleteByPrimaryKey(oId);
	}

	public int editOpinion(OpinionInfo opInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<OpinionInfo> findOpinion(int proceessId) {
		opinionEX = new OpinionInfoExample();
		opinionEX.createCriteria().andPpiIdEqualTo(proceessId);
		return opinionDao.selectByExample(opinionEX);
	}

	public OpinionInfo findOpinion(int proceessId, int outype) {
		opinionEX = new OpinionInfoExample();
		opinionEX.createCriteria().andPpiIdEqualTo(proceessId).andOUTypeEqualTo(outype);
		List<OpinionInfo> info = opinionDao.selectByExample(opinionEX);
		if(info==null||info.size()<1) {
			return null;
		}
		return info.get(0);
	}
	
}
