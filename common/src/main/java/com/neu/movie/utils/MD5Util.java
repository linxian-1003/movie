package com.neu.movie.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Util {

    static char chars [] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};

    public static String degist(String data){
        MessageDigest messageDigest = null;
        try {
            messageDigest = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        byte [] results = messageDigest.digest(data.getBytes());
        StringBuffer SB = new StringBuffer();
        for(int result:results){

            if(result<0){
                result = result + 256;
            }
            int height = result/16;
            int low = result%16;
            SB.append(chars[height]).append(chars[low]);
        }
        return SB.toString();
    }


    //含义:消息摘要,将一段明文加密变成密文,并且不可逆

/*
    public static void main(String ... xx) throws NoSuchAlgorithmException {

        char chars [] = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
        String content="中国";
        MessageDigest messageDigest = MessageDigest.getInstance("MD5");
        byte [] results = messageDigest.digest(content.getBytes());



        StringBuffer SB = new StringBuffer();
        for(int result:results){

            if(result<0){//负数(有符号)--->整数(无符号)  //-128   128
                result = result + 256;
            }

           // result -->hex
            int height = result/16;  //[0 15]
            int low = result%16;     //[0 15]

            SB.append(chars[height]).append(chars[low]);

        }
        System.out.println(SB.toString());

        //byte--->hex [0F]
            //思路
               //将有符号的byte--->无符号-->hex





    }*/
}
