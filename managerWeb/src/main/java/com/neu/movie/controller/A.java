package com.neu.movie.controller;

import java.lang.reflect.ParameterizedType;

public class A<T> {

    public A(){
       // getClass()

        //com.neu.movie.controller.A<com.neu.movie.domain.Role>
        ParameterizedType parameterized = (ParameterizedType) getClass().getGenericSuperclass();

                                                               //B
       Class<T> clazz = (Class<T>) parameterized.getActualTypeArguments()[0];
       //class com.neu.movie.domain.Role
        System.out.println(clazz);
    }
}
