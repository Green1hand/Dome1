package com.chf.utils;

import org.springframework.util.DigestUtils;

import java.util.Date;

/**
 * 写一个MD5算法,运行结果与MySQL的md5()函数相同
 * 将明文密码转成MD5密码
 * 123456->e10adc3949ba59abbe56e057f20f883e
 */
public final class Md5Util {

	//盐
	public static final String salt = "Survey@@##$$";

	//加密
	public static String gerMD5(String string){

		String var = string+salt;
		return DigestUtils.md5DigestAsHex(var.getBytes());
	}

	public static void main(String[] args) {

		System.out.println(gerMD5("123456"));
		Date date = new Date();

		System.out.println(date);
	}

}
