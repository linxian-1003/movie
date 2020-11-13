package com.neu.movie.domain;

import com.neu.movie.base.BaseDomain;

import java.util.ArrayList;
import java.util.List;
public class Menu extends BaseDomain {
    private String name;
    private String url;
    private String icon;
    private String auth;
    private int level;

    //上级菜单
    private Menu parent;

    //子级菜单
    private List<Menu> children = new ArrayList<Menu>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public Menu getParent() {
        return parent;
    }

    public void setParent(Menu parent) {
        this.parent = parent;
    }

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }
}
