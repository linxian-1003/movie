package com.neu.movie.base;

public class BaseQuery {

    private Integer page=1;    //当前第几页
    private Integer pageSize=10; //每页显示多少条

    private boolean paging=true;  //是否分页

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public boolean isPaging() {
        return paging;
    }

    public void setPaging(boolean paging) {
        this.paging = paging;
    }
}
