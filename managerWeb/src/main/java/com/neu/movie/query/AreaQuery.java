package com.neu.movie.query;

import com.neu.movie.base.BaseQuery;

public class AreaQuery extends BaseQuery {
    private String name;
    private String parentCode;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getParentCode() {
        return parentCode;
    }

    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }
}
