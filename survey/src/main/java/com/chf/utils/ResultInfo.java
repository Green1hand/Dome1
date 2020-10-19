package com.chf.utils;

import java.io.Serializable;
import java.util.List;


/**
 *  用来前端来返回数据的类
 *  作用：用来Ajax来进行传送数据
 */
public class ResultInfo implements Serializable {
    private Integer code;           //返回的状态码
    private String msg;             //返回的提示文字
    private List<?> data;      //返回的数据，数据放在list中


    /**
     *  空构造方法
     */
    public ResultInfo(){

    }

    /**
     *  返回状态码和list数据
     * @param code
     * @param data
     */
    public ResultInfo (String code, String data){

    }

    /**
     *  返回状态码、提示语句、list数据
     * @param code
     * @param msg
     * @param data
     */
    public ResultInfo(Integer code, String msg, List<Object> data){

    }

    /**
     * 成功
     * @return
     */
    public ResultInfo CG(){

        ResultInfo resultInfo = new ResultInfo();
        resultInfo.setCode(200);
        resultInfo.setMsg("成功");
        return resultInfo;
    }

    /**
     * 成功
     * @return
     */
    public ResultInfo SB(){

        ResultInfo resultInfo = new ResultInfo();
        resultInfo.setCode(400);
        resultInfo.setMsg("失败");
        return resultInfo;
    }

    /**
     * 异常
     * @return
     */
    public ResultInfo YC(){

        ResultInfo resultInfo = new ResultInfo();
        resultInfo.setCode(300);
        resultInfo.setMsg("异常数据");
        return resultInfo;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "ResultInfo{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
}
