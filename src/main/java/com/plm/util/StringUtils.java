package com.plm.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 字符串工具（包含时间简单的处理）
 * @author Flyblue
 *
 */
public class StringUtils {

	/**
	 * html特殊字符串还原
	 * @param str
	 * @return
	 */
	public static String htmlspecialchars(String str) {
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
	}
	/**
	 * 判断字符串是否不为空
	 * @param strings
	 * @return 不为空返回true，否则false
	 */
	public static boolean isNotNullString(String ...strings) {
		for(String str: strings) {
			if(str == null || str.trim().equals("")) {
				return false;
			}
		}
		return true;
	}
	public static Date strToDate(String str,String timePattern) {
        // 将时间字符串转换成java.util.Date对象  
		Date date = null;
		try {
	        SimpleDateFormat sdf = new SimpleDateFormat(timePattern);  
	        date = sdf.parse(str);
		} catch (Exception e) {
			date = null;
		}
		return date;
	}
	
	public static String dateToStr(Date date,String timePattern) {
		// 将Date转换成指定形式的时间字符串  
		String str = "";
		try {
	        SimpleDateFormat sdf = new SimpleDateFormat(timePattern);  
	        str = sdf.format(date);
		} catch (Exception e) {
			str = "";
		}
		return str;
	}
	
	public static Date getDate() {
		Date date = new Date();
		try {  
	        date = strToDate(dateToStr(date,"yyyy-MM-dd HH:mm:ss"),"yyyy-MM-dd HH:mm:ss");
		} catch (Exception e) {
			date = new Date();
		}
		return date;
	}
	
	public static String getSysYear() {
        Calendar date = Calendar.getInstance();
        String year = String.valueOf(date.get(Calendar.YEAR));
        return year;
        }
}
