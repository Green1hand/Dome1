package com.chf.utils;

import org.springframework.core.convert.converter.Converter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 将字符串转款成日期
 */
public class StringToDateConverter implements Converter<String, Date> {

    /**
     * @param s
     * @return
     */
    @Override
    public Date convert(String s) {

        if(s == null){

            throw new RuntimeException("请传入数据！");
        }
        DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
        //把字符串转换日期
        try {
            return df.parse(s);
        } catch (Exception e) {
            throw new RuntimeException("类型转换上失败！");
        }
    }
}
