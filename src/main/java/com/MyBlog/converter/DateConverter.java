package com.MyBlog.converter;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
    日期格式转换
 */
public class DateConverter implements Converter<String,Date> {


    public Date convert(String s) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
        Date date = null;
        try {
            date = format.parse(s);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

}
