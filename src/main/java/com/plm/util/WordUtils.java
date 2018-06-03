package com.plm.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.TextAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTbl;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTc;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTcPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth;

import com.plm.model.ProjectBase;
import com.plm.model.ProjectBaseView;

/**
 * ms-word文件导出工具类
 * @author Flyblue
 *
 */
public class WordUtils {
	public static void exportWord(HttpServletRequest request, HttpServletResponse response, Map<String,Object> map)
			throws IOException {
		//创建空白文档
		XWPFDocument document = new XWPFDocument();

		String filename = (String) map.get("filename");
		//生成文件
		FileOutputStream out = new FileOutputStream(new File(request.getServletContext().getRealPath("/temp/")+filename));

		//标题  
        XWPFParagraph titleMes = document.createParagraph();  
        titleMes.setAlignment(ParagraphAlignment.CENTER);  
        XWPFRun r1 = titleMes.createRun();  
        r1.setBold(true);  
        r1.setFontFamily("微软雅黑");
        r1.setText((String) map.get("title"));//活动名称  
        r1.setFontSize(20);  
        r1.setColor("333333");
        r1.setBold(true);
        
        //表格 
        createStartTable(document, map,r1);

        //写入服务器
		document.write(out);
		out.close();
		
		System.out.println("create_table.docx written successully");
		
		//获取文件
		File file = readWord(request.getServletContext().getRealPath("/temp/")+filename);
		//响应
		writeWord(response, file, filename); 
	}

	private static File readWord(String filePath) {
		// 得到要下载的文件
		File file = new File(filePath);
		// 如果文件不存在
		if (!file.exists()) {
			return null;
		}
		return file;
	}

	private static void writeWord(HttpServletResponse response, File file, String fileName) throws IOException {
		OutputStream out = null;
		FileInputStream in = null;
		try {
			out = response.getOutputStream();
			response.setContentType("application/ms-word;charset=UTF-8");
			response.setHeader("Content-Disposition",
					"attachment;filename=".concat(String.valueOf(URLEncoder.encode(fileName + ".docx", "UTF-8"))));
			// 读取要下载的文件，保存到文件输入流
			in = new FileInputStream(file);

			// 创建缓冲区
			byte buffer[] = new byte[1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
			}

		} catch (IOException e) {
			System.out.println("输出流错误");
			e.printStackTrace();
		} finally {
			// 关闭文件输入流
			in.close();
			// 关闭输出流
			out.close();
			//删除临时文件
			file.delete();
		}
	}
      
    //设置表格高度  
    private static XWPFTableCell getCellHight(XWPFTable xTable,int rowNomber,int cellNumber){  
        XWPFTableRow row = null;  
        row = xTable.getRow(rowNomber);  
        row.setHeight(100);  
        XWPFTableCell cell = null;  
        cell = row.getCell(cellNumber);  
        return cell;  
    }  
      
    /** 
     * 设置表格文字格式
     * @param xDocument 
     * @param cell 
     * @param text 
     * @param bgcolor 
     * @param width 
     */  
    private static void setCellText(XWPFDocument xDocument, XWPFTableCell cell,  
            String text, String bgcolor, int width,boolean bold) {  
        CTTc cttc = cell.getCTTc();  
        CTTcPr cellPr = cttc.addNewTcPr();  
        cellPr.addNewTcW().setW(BigInteger.valueOf(width));  
        XWPFParagraph pIO =cell.addParagraph();  
        cell.removeParagraph(0);  
        XWPFRun rIO = pIO.createRun();  
        rIO.setFontFamily("微软雅黑");  
        rIO.setColor("000000");  
        rIO.setFontSize(12);  
        rIO.setText(text);
        rIO.setBold(bold);
    }  
      
    //设置表格间的空行  
    public static void setEmptyRow(XWPFDocument xdoc,XWPFRun r1){  
        XWPFParagraph p1 = xdoc.createParagraph();  
        p1.setAlignment(ParagraphAlignment.CENTER);  
        p1.setVerticalAlignment(TextAlignment.CENTER);  
        r1 = p1.createRun();
    }  
      
    /** 
     * 创建表 
     * @param task 
     * @param xTable 
     * @param xdoc 
     * @throws IOException 
     */  
    @SuppressWarnings("unchecked")
	public static void createStartTable(XWPFDocument xdoc,Map<String,Object> map,XWPFRun r1) 
            throws IOException {
    	ProjectBase info = (ProjectBase) map.get("info");
    	
		List<ProjectBaseView> list = (List<ProjectBaseView>) map.get("memberinfo");
    	
    	//第一行
    	XWPFTable xTable1 = xdoc.createTable(); 
        String bgColor="FFFFFF";  
        CTTbl ttbl = xTable1.getCTTbl();
        CTTblPr tblPr = ttbl.getTblPr() == null ? ttbl.addNewTblPr() : ttbl.getTblPr();  
        CTTblWidth tblWidth = tblPr.isSetTblW() ? tblPr.getTblW() : tblPr.addNewTblW();  
        tblWidth.setW(new BigInteger("8600"));
        tblWidth.setType(STTblWidth.DXA);
        
        XWPFTableRow tableRowOne = xTable1.getRow(0);
        tableRowOne.getCell(0).setText("项目名称");
        setCellText(xdoc, getCellHight(xTable1, 0, 0),"项目名称",bgColor,3300,true);
        tableRowOne.addNewTableCell().setText("col two, row one");
        setCellText(xdoc,getCellHight(xTable1, 0, 1), info.getPbName(),bgColor,3300,false);
        
        setEmptyRow(xdoc, r1);
        
    	//第二行
    	XWPFTable xTable2 = xdoc.createTable(2,3); 
        String bgColor2="FFFFFF";  
        CTTbl ttbl2 = xTable2.getCTTbl();
        CTTblPr tblPr2 = ttbl2.getTblPr() == null ? ttbl2.addNewTblPr() : ttbl2.getTblPr();  
        CTTblWidth tblWidth2 = tblPr2.isSetTblW() ? tblPr2.getTblW() : tblPr2.addNewTblW();  
        tblWidth2.setW(new BigInteger("8600"));
        tblWidth2.setType(STTblWidth.DXA);
        
        //项目类型（标题）
        XWPFTableRow tableRowTwo = xTable2.getRow(0);
        tableRowTwo.getCell(0).setText("项目级别");
        setCellText(xdoc, getCellHight(xTable2, 0, 0),"项目级别",bgColor2,2600,true);
        tableRowTwo.getCell(1).setText("项目类型");
        setCellText(xdoc, getCellHight(xTable2, 0, 1),"项目类型",bgColor2,3000,true);
        tableRowTwo.getCell(2).setText("项目学科类别");
        setCellText(xdoc, getCellHight(xTable2, 0, 2),"项目学科类别",bgColor2,3000,true);
        //项目类型（内容）
        String level = "";
        String type = "";
        String subject = "";
        if(info.getPbLevel()==0) {
        	level="国家级";
        }else if(info.getPbLevel()==1) {
        	level="省部级";
        }if(info.getPbLevel()==2) {
        	level="校级";
        }
        if(info.getPbType()==0) {
        	type="大学生创新创业训练";
        }if(info.getPbType()==1) {
        	type="国家级";
        }
        if(info.getSubjectType()==0) {
        	subject="工学硬件";
        }else if(info.getSubjectType()==1) {
        	subject="软件及其他";
        }

        setCellText(xdoc, getCellHight(xTable2, 1, 0),level,bgColor2,3300,false);
        setCellText(xdoc, getCellHight(xTable2, 1, 1),type,bgColor2,3300,false);
        setCellText(xdoc, getCellHight(xTable2, 1, 2),subject,bgColor2,3300,false);
        
        setEmptyRow(xdoc, r1);
        
    	//第三行
    	XWPFTable xTable3 = xdoc.createTable(); 
        String bgColor3="FFFFFF";  
        CTTbl ttbl3 = xTable3.getCTTbl();
        CTTblPr tblPr3 = ttbl3.getTblPr() == null ? ttbl3.addNewTblPr() : ttbl3.getTblPr();  
        CTTblWidth tblWidth3 = tblPr3.isSetTblW() ? tblPr3.getTblW() : tblPr3.addNewTblW();  
        tblWidth3.setW(new BigInteger("8600"));
        tblWidth3.setType(STTblWidth.DXA);
        
        //学生信息
        XWPFTableRow tableRowThree = xTable3.getRow(0);
		tableRowThree.getCell(0).setText("one");
        setCellText(xdoc, getCellHight(xTable3, 0, 0),"学生姓名",bgColor3,2600,true);
        tableRowThree.addNewTableCell().setText("one");
        setCellText(xdoc, getCellHight(xTable3, 0, 1),"学院",bgColor3,3000,true);
        tableRowThree.addNewTableCell().setText("one");
        setCellText(xdoc, getCellHight(xTable3, 0, 2),"学号",bgColor3,2600,true);
        tableRowThree.addNewTableCell().setText("one");
        setCellText(xdoc, getCellHight(xTable3, 0, 3),"联系电话",bgColor3,3000,true);
        tableRowThree.addNewTableCell().setText("one");
        setCellText(xdoc, getCellHight(xTable3, 0, 4),"E-mail",bgColor3,3000,true);
        
        ProjectBaseView tuinfo = null;
        if(list!=null&&list.size()>0) {
        	int i = 1;
        	for(ProjectBaseView pbview:list) {
        		if(pbview.getuType()==0) {//负责人
        			xTable3.createRow();
        			
        			setCellText(xdoc, getCellHight(xTable3, i, 0),pbview.getuRealname()+"（负责人）",bgColor3,2600,false);
        	        setCellText(xdoc, getCellHight(xTable3, i, 1),pbview.getCollege(),bgColor3,3000,false);
        	        setCellText(xdoc, getCellHight(xTable3, i, 2),pbview.getuCode(),bgColor3,2600,false);
        	        setCellText(xdoc, getCellHight(xTable3, i, 3),pbview.getTel(),bgColor3,3000,false);
        	        setCellText(xdoc, getCellHight(xTable3, i, 4),pbview.getEmail(),bgColor3,3000,false);
        	        i++;
        		}else if(pbview.getuType()==1){//普通人
        			xTable3.createRow();

        			setCellText(xdoc, getCellHight(xTable3, i, 0),pbview.getuRealname(),bgColor3,2600,false);
        	        setCellText(xdoc, getCellHight(xTable3, i, 1),pbview.getCollege(),bgColor3,3000,false);
        	        setCellText(xdoc, getCellHight(xTable3, i, 2),pbview.getuCode(),bgColor3,2600,false);
        	        setCellText(xdoc, getCellHight(xTable3, i, 3),pbview.getTel(),bgColor3,3000,false);
        	        setCellText(xdoc, getCellHight(xTable3, i, 4),pbview.getEmail(),bgColor3,3000,false);
        	        i++;
        		}else if(pbview.getuType()==2) {
        			tuinfo = pbview;
        		}
        	}
        }
        
        setEmptyRow(xdoc, r1);
        
    	//第四行
    	XWPFTable xTable4 = xdoc.createTable(2,5); 
        String bgColor4="FFFFFF";  
        CTTbl ttbl4 = xTable4.getCTTbl();
        CTTblPr tblPr4 = ttbl4.getTblPr() == null ? ttbl4.addNewTblPr() : ttbl4.getTblPr();  
        CTTblWidth tblWidth4 = tblPr4.isSetTblW() ? tblPr4.getTblW() : tblPr4.addNewTblW();  
        tblWidth4.setW(new BigInteger("8600"));
        tblWidth4.setType(STTblWidth.DXA);
        
        //导师信息
        setCellText(xdoc, getCellHight(xTable4, 0, 0),"导师姓名",bgColor4,2600,true);
        setCellText(xdoc, getCellHight(xTable4, 0, 1),"学院",bgColor4,3000,true);
        setCellText(xdoc, getCellHight(xTable4, 0, 2),"职称/职务",bgColor4,2600,true);
        setCellText(xdoc, getCellHight(xTable4, 0, 3),"联系电话",bgColor4,3000,true);
        setCellText(xdoc, getCellHight(xTable4, 0, 4),"E-mail",bgColor4,3000,true);
        
        setCellText(xdoc, getCellHight(xTable4, 1, 0),tuinfo.getuRealname(),bgColor3,2600,false);
        setCellText(xdoc, getCellHight(xTable4, 1, 1),tuinfo.getCollege(),bgColor3,3000,false);
        setCellText(xdoc, getCellHight(xTable4, 1, 2),tuinfo.getJobTitle(),bgColor3,2600,false);
        setCellText(xdoc, getCellHight(xTable4, 1, 3),tuinfo.getTel(),bgColor3,3000,false);
        setCellText(xdoc, getCellHight(xTable4, 1, 4),tuinfo.getEmail(),bgColor3,3000,false);
        
        setEmptyRow(xdoc, r1);
        
    	//第五行
    	XWPFTable xTable5 = xdoc.createTable(12,1);
        String bgColor5="FFFFFF";  
        CTTbl ttbl5 = xTable5.getCTTbl();
        CTTblPr tblPr5 = ttbl5.getTblPr() == null ? ttbl5.addNewTblPr() : ttbl5.getTblPr();  
        CTTblWidth tblWidth5 = tblPr5.isSetTblW() ? tblPr5.getTblW() : tblPr5.addNewTblW();  
        tblWidth5.setW(new BigInteger("8600"));
        tblWidth5.setType(STTblWidth.DXA);
        
        setCellText(xdoc, getCellHight(xTable5, 0, 0),"项目简介",bgColor5,3000,true);
        setCellText(xdoc, getCellHight(xTable5, 1, 0),info.getPsiBrief(),bgColor5,2600,false);
        
        setCellText(xdoc, getCellHight(xTable5, 2, 0),"申请理由",bgColor5,3000,true);
        setCellText(xdoc, getCellHight(xTable5, 3, 0),info.getPsiReason(),bgColor5,2600,false);
        
        setCellText(xdoc, getCellHight(xTable5, 4, 0),"项目方案",bgColor5,3000,true);
        setCellText(xdoc, getCellHight(xTable5, 5, 0),info.getPsiContent(),bgColor5,2600,false);
        
        setCellText(xdoc, getCellHight(xTable5, 6, 0),"项目特色与创新点",bgColor5,3000,true);
        setCellText(xdoc, getCellHight(xTable5, 7, 0),info.getPsiFeature(),bgColor5,2600,false);
        
        setCellText(xdoc, getCellHight(xTable5, 8, 0),"项目进度安排",bgColor5,3000,true);
        setCellText(xdoc, getCellHight(xTable5, 9, 0),info.getPsiPlan(),bgColor5,2600,false);
        
        setCellText(xdoc, getCellHight(xTable5, 10, 0),"项目完成预期成果",bgColor5,3000,true);
        setCellText(xdoc, getCellHight(xTable5, 11, 0),info.getPsiResult(),bgColor5,2600,false);
    }
}
