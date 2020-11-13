package com.neu.movie.query;

import com.neu.movie.base.BaseQuery;

public class UserQuery extends BaseQuery {
    private String loginName;
    private String name;

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
