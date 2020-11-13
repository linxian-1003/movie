package com.neu.movie.utils;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringUtil {

    public static boolean isEmpty(String param){
        return param==null || "".equals(param.trim());
    }


    public static String formateDate(Date date, String pattern){
        //NumberFormat
        pattern = isEmpty(pattern)?"yyyy-MM-dd":pattern;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        return simpleDateFormat.format(date);
    }
}
