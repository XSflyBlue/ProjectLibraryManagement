package com.plm.service;

import java.util.List;

import com.plm.model.HelpInfo;
import com.plm.model.HelpInfoExample;
import com.plm.model.LinksInfo;
import com.plm.model.LinksInfoExample;
import com.plm.model.SiteFileInfo;
import com.plm.model.SiteFileInfoExample;

/**
 * 网站信息管理服务
 * @author Flyblue
 *
 */
public interface ISiteInfoService {
//----------------------站点文件信息-------------------------
	/**
	 * 删除一条文件信息（通过id）
	 * @param sfId
	 * @return
	 */
    int deleteFileById(Integer sfId);
    /**
     * 插入一条文件信息
     * @param record
     * @return
     */
    int insertFile(SiteFileInfo record);
    /**
     * 查询文件信息（选择性）
     * @param example
     * @return
     */
    List<SiteFileInfo> selectFileByExample(SiteFileInfoExample example);
    /**
     * 查询全部文件信息
     * @return
     */
    List<SiteFileInfo> selectFileAll();
    /**
     * 查询一条文件信息（通过id）
     * @param sfId
     * @return
     */
    SiteFileInfo selectFileById(Integer sfId);
    /**
     * 更新一条文件信息（选择性）
     * @param record
     * @return
     */
    int updateFileByIdSelective(SiteFileInfo record);
    /**
     * 更新一条文件信息（全）
     * @param record
     * @return
     */
    int updateFileById(SiteFileInfo record);
//----------------------友情链接信息-------------------------
    /**
     * 删除一条链接（通过id）
     * @param liId
     * @return
     */
    int deleteLinkById(Integer liId);
    /**
     * 插入一条链接
     * @param record
     * @return
     */
    int insertLink(LinksInfo record);
    /**
     * 查询链接（选择性）
     * @param example
     * @return
     */
    List<LinksInfo> selectLinkByExample(LinksInfoExample example);
    /**
     * 查询全部链接
     * @return
     */
    List<LinksInfo> selectLinkAll();
    /**
     * 查询一条链接（通过id）
     * @param liId
     * @return
     */
    LinksInfo selectLinkById(Integer liId);
    /**
     * 查询一条链接（通过linkname）
     * @param liId
     * @return
     */
    LinksInfo selectLinkByname(String linkname);
    /**
     * 更新一条链接（选择性）
     * @param record
     * @return
     */
    int updateLinkByIdSelective(LinksInfo record);
    /**
     * 更新一条链接（全）
     * @param record
     * @return
     */
    int updateLinkById(LinksInfo record);
//----------------------网站帮助信息-------------------------
    /**
     * 删除一条帮助（通过id）
     * @param hId
     * @return
     */
    int deleteHelpById(Integer hId);
    /**
     * 插入一条帮助（全）
     * @param record
     * @return
     */
    int insertHelp(HelpInfo record);
    /**
     * 插入一条帮助（选择性）
     * @param record
     * @return
     */
    int insertHelpSelective(HelpInfo record);
    /**
     * 查询帮助（选择性）
     * @param example
     * @return
     */
    List<HelpInfo> selectHelpByExample(HelpInfoExample example);
    /**
     * 查询全部帮助
     * @param example
     * @return
     */
    List<HelpInfo> selectHelpAll();
    /**
     * 查询一条帮助（通过id）
     * @param hId
     * @return
     */
    HelpInfo selectHelpById(Integer hId);
    /**
     * 更新一条帮助（选择性）
     * @param record
     * @return
     */
    int updateHelpByIdSelective(HelpInfo record);
    /**
     * 更新一条帮助（全）
     * @param record
     * @return
     */
    int updateHelpById(HelpInfo record);
}
