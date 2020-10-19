package com.chf.utils;

import java.io.Serializable;

/**
 * 分页实体类
 */
public class Entity implements Serializable {

    private Integer page;
    private Integer limit;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    @Override
    public String toString() {
        return "Entity{" +
                "page=" + page +
                ", limit=" + limit +
                '}';
    }
}
