package com.chf.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.*;

/**
 * 主页相应类
 */
@Controller
public class IndexController {

    @Value("classpath:init.json")
    private Resource resource;

    @Value("classpath:init2.json")
    private Resource resource2;

    /**
     * 解析json数据，返回给主页1
     * @return
     */
    @RequestMapping(value = "/menu",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String menu(){

        try {
            File file = resource.getFile();
            FileReader fileReader = new FileReader(file);
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String str;
            StringBuffer stringBuffer = new StringBuffer();
            while ((str = bufferedReader.readLine()) != null){

                stringBuffer.append(str);
            }
            bufferedReader.close();
            fileReader.close();
            return stringBuffer.toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 解析json数据，返回给主页2
     * @return
     */
    @RequestMapping(value = "/menu2",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String menu2(){

        try {
            File file = resource2.getFile();
            FileReader fileReader = new FileReader(file);
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String str;
            StringBuffer stringBuffer = new StringBuffer();
            while ((str = bufferedReader.readLine()) != null){

                stringBuffer.append(str);
            }
            bufferedReader.close();
            fileReader.close();
            return stringBuffer.toString();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 主页跳转
     * @return
     */
    @GetMapping("/index")
    public String index(){

        return "index";
    }

    /**
     * 主页2跳转
     * @return
     */
    @GetMapping("/index2")
    public String index2(){

        return "index2";
    }

    /**
     * 首页跳转
     * @return
     */
    @GetMapping("/mian")
    public String mian(){

        return "mian";
    }

}
