package com.chf.entiy;

import com.chf.utils.Entity;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Survey_Admin extends Entity {

    /*private Integer id;         //管理员id*/
    private String account;     //账号
    /*private String password;    //密码*/
    private String name;        //姓名
    private String phone;       //手机号
    /*private String remark;      //备注*/
    private Integer id;         //问卷id
    private String title;       //问卷标题
    private String remark;      //问卷说明
    private Integer bounds;     //限制（0:不限制 1:限制）
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date start_time;    //开始时间
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date end_time;      //结束时间
    private Integer rules;      //访问规则（0：公开 1：密码）
    private String password;    //问卷密码
    private String url;         //问卷url
    private String state;       //状态
    private String logo;        //logo
    private String bgimg;       //背景图片
    private Integer anon;       //是匿名
    private Integer creator;    //创建人
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date creator_time;  //创建时间

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getBounds() {
        return bounds;
    }

    public void setBounds(Integer bounds) {
        this.bounds = bounds;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    public Integer getRules() {
        return rules;
    }

    public void setRules(Integer rules) {
        this.rules = rules;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getBgimg() {
        return bgimg;
    }

    public void setBgimg(String bgimg) {
        this.bgimg = bgimg;
    }

    public Integer getAnon() {
        return anon;
    }

    public void setAnon(Integer anon) {
        this.anon = anon;
    }

    public Integer getCreator() {
        return creator;
    }

    public void setCreator(Integer creator) {
        this.creator = creator;
    }

    public Date getCreator_time() {
        return creator_time;
    }

    public void setCreator_time(Date creator_time) {
        this.creator_time = creator_time;
    }

    @Override
    public String toString() {
        return "Survey_Admin{" +
                "account='" + account + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", id=" + id +
                ", title='" + title + '\'' +
                ", remark='" + remark + '\'' +
                ", bounds=" + bounds +
                ", start_time=" + start_time +
                ", end_time=" + end_time +
                ", rules=" + rules +
                ", password='" + password + '\'' +
                ", url='" + url + '\'' +
                ", state='" + state + '\'' +
                ", logo='" + logo + '\'' +
                ", bgimg='" + bgimg + '\'' +
                ", anon=" + anon +
                ", creator=" + creator +
                ", creator_time=" + creator_time +
                '}';
    }
}
