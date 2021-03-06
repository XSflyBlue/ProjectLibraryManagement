package com.plm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.plm.dao.HelpInfoMapper;
import com.plm.dao.LinksInfoMapper;
import com.plm.dao.SiteFileInfoMapper;
import com.plm.model.HelpInfo;
import com.plm.model.HelpInfoExample;
import com.plm.model.LinksInfo;
import com.plm.model.LinksInfoExample;
import com.plm.model.SiteFileInfo;
import com.plm.model.SiteFileInfoExample;
import com.plm.service.ISiteInfoService;

@Service("siteInfoService")
public class SiteInfoServiceImpl implements ISiteInfoService {
	@Resource 
	private SiteFileInfoMapper siteFileDao;
	private SiteFileInfoExample siteFileEX;
	@Resource
	private LinksInfoMapper linksDao;
	private LinksInfoExample linksEx;
	@Resource
	private HelpInfoMapper helpDao;
	private HelpInfoExample helpEx;
	
	public int deleteFileById(Integer sfId) {
		return siteFileDao.deleteByPrimaryKey(sfId);
	}
	public int insertFile(SiteFileInfo record) {
		return siteFileDao.insertSelective(record);
	}
	public List<SiteFileInfo> selectFileByExample(SiteFileInfoExample example) {
		// TODO Auto-generated method stub
		return null;
	}
	public List<SiteFileInfo> selectFileAll() {
		siteFileEX = new SiteFileInfoExample();
		siteFileEX.createCriteria().andSfIdIsNotNull();
		List<SiteFileInfo> list = siteFileDao.selectByExample(siteFileEX);
		return list;
	}
	public SiteFileInfo selectFileById(Integer sfId) {
		return siteFileDao.selectByPrimaryKey(sfId);
	}
	public int updateFileByIdSelective(SiteFileInfo record) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int updateFileById(SiteFileInfo record) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int deleteLinkById(Integer liId) {
		return linksDao.deleteByPrimaryKey(liId);
	}
	public int insertLink(LinksInfo record) {
		return linksDao.insertSelective(record);
	}
	public List<LinksInfo> selectLinkByExample(LinksInfoExample example) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<LinksInfo> selectLinkAll() {
		linksEx = new LinksInfoExample();
		linksEx.createCriteria().andLiIdIsNotNull();
		List<LinksInfo> LinkdList = linksDao.selectByExample(linksEx);
		if (!LinkdList.isEmpty() && LinkdList.size() > 0) {
			return LinkdList;
		}
		return null;
	}
	public LinksInfo selectLinkById(Integer liId) {
		return linksDao.selectByPrimaryKey(liId);
	}
	public int updateLinkByIdSelective(LinksInfo record) {
		return linksDao.updateByPrimaryKeySelective(record);
	}
	public int updateLinkById(LinksInfo record) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int deleteHelpById(Integer hId) {
		return helpDao.deleteByPrimaryKey(hId);
	}
	public int insertHelp(HelpInfo record) {
		return 0;
	}
	public int insertHelpSelective(HelpInfo record) {
		return helpDao.insertSelective(record);
	}
	public List<HelpInfo> selectHelpByExample(HelpInfoExample example) {
		// TODO Auto-generated method stub
		return null;
	}
	public List<HelpInfo> selectHelpAll() {
		helpEx = new HelpInfoExample();
		helpEx.createCriteria().andHIdIsNotNull();
		List<HelpInfo> list = helpDao.selectByExample(helpEx);
		return list;
	}
	public HelpInfo selectHelpById(Integer hId) {
		return helpDao.selectByPrimaryKey(hId);
	}
	public int updateHelpByIdSelective(HelpInfo record) {
		return helpDao.updateByPrimaryKeySelective(record);
	}
	public int updateHelpById(HelpInfo record) {
		// TODO Auto-generated method stub
		return 0;
	}
	public LinksInfo selectLinkByname(String linkname) {
		linksEx = new LinksInfoExample();
		linksEx.createCriteria().andLiNameEqualTo(linkname);
		List<LinksInfo> LinkdList = linksDao.selectByExample(linksEx);
		if (!LinkdList.isEmpty() && LinkdList.size() > 0) {
			return LinkdList.get(0);
		}
		return null;
	}
	
}
