package com.plm.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * md5编码字符串
 * @author Flyblue
 *
 */
public class MD5Utils {
	/**
	 * md5编码字符串
	 * @param plainText
	 * @return
	 */
	public static String stringEncoder(String plainText) {      
        try {  
            MessageDigest md = MessageDigest.getInstance("MD5");  
            md.update(plainText.getBytes());  
            byte b[] = md.digest();  
  
            int i;  
  
            StringBuffer buf = new StringBuffer("");  
            for (int offset = 0; offset < b.length; offset++) {  
                i = b[offset];  
                if (i < 0)  
                    i += 256;  
                if (i < 16)  
                    buf.append("0");  
                buf.append(Integer.toHexString(i));  
            }  
            //32位加密
            return buf.toString();  
            // 16位加密  
            //return buf.toString().substring(8, 24);  
        } catch (NoSuchAlgorithmException e) {  
            e.printStackTrace();  
            return null;  
        }  
    }
}
