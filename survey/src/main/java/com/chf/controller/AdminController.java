package com.chf.controller;

import com.chf.entiy.Admin;
import com.chf.service.AdminService;
import com.chf.utils.Md5Util;
import com.chf.utils.ResultInfo;
import com.chf.utils.ResultInfo2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 账户web层
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    /**
     * 添加账户
     * @param
     */
    @PostMapping("/add")
    @ResponseBody
    public ResultInfo addAdmin(@RequestBody Admin admin){

        ResultInfo resultInfo = new ResultInfo();
        /*Md5Util.gerMD5(password)*/
        String password = admin.getPassword();
        admin.setPassword(Md5Util.gerMD5(password));
        //System.out.println(admin);
        boolean bl = adminService.create(admin);
        if (bl){
            return resultInfo.CG();
        }else {
            return resultInfo.SB();
        }
    }

    /**
     * 删除
     * @return
     */
    @PostMapping("/delete")
    @ResponseBody
    public ResultInfo deleteAdmin(String ids){

        ResultInfo resultInfo = new ResultInfo();
        //System.out.println("表现层：删除数据");
        int bl = adminService.deletes(ids);
        if (bl <= 0){
            return resultInfo.SB();
        }else {
            return resultInfo.CG();
        }
    }

    /**
     * 查询
     * @param admin
     * @return
     */
    @RequestMapping("/query")
    @ResponseBody
    public ResultInfo2 queryAdmin(Admin admin){

        //System.out.println("表现层：查询账户数据");
        ResultInfo2 resultInfo = new ResultInfo2();
        int count = adminService.count();
        List<Admin> list = adminService.query(admin);
        //System.out.println(admin.getAccount());
        resultInfo.setCode(0);
        resultInfo.setMsg("返回成功");
        resultInfo.setData(list);
        resultInfo.setCount(count);
        return resultInfo;
    }

    /**
     * 修改基本信息
     * @param admin
     * @return
     */
    @PostMapping("/update")
    @ResponseBody
    public ResultInfo update(@RequestBody Admin admin){

        ResultInfo resultInfo = new ResultInfo();
        //System.out.println("表现层：修改账户数据");
        boolean bl = adminService.update(admin);
        if (bl){
            return resultInfo.CG();
        }else {
            return resultInfo.SB();
        }
    }

    /**
     * 修改密码
     * @param map
     * @return
     */
    @PostMapping("/updatepassword")
    @ResponseBody
    public ResultInfo updatepassword(@RequestBody Map<String, Object> map){

        ResultInfo resultInfo = new ResultInfo();
        String account = map.get("account")+"";
        String old_password = map.get("old_password")+"";
        String new_password = map.get("new_password")+"";
        String again_password = map.get("again_password")+"";

        Admin login = adminService.login(account, Md5Util.gerMD5(old_password));

        if((login != null) && (new_password.equals(again_password))){

            boolean bl = adminService.updatepassword(account, Md5Util.gerMD5(new_password));
            if(bl){
                return resultInfo.CG();
            }else {
                return resultInfo.SB();
            }
        }else if(login == null){

            resultInfo.setCode(500);
            resultInfo.setMsg("原密码错误");
            return resultInfo;
        }else if (!(new_password.equals(again_password))){
            resultInfo.setCode(300);
            resultInfo.setMsg("新密码与确认密码不一致！");
            return resultInfo;
        }
        return resultInfo.YC();
    }

    /**
     * 跳转到修改页面
     * @param admin
     * @return
     */
    @RequestMapping("/detail")
    public String detail(Admin admin, Model model){

        Admin detail = adminService.detail(admin);
        model.addAttribute("admin",detail);
        return "admin/update";
    }

    /**
     * 分页
     * @return
     */
    @RequestMapping("/count")
    @ResponseBody
    public int count(){

        //System.out.println("表现层：分页");
        int count = adminService.count();
        return count;
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @GetMapping("/add")
    public String add(){

        return "admin/add";
    }

    /**
     * 跳转到管理员列表页面
     * @return
     */
    @GetMapping("/list")
    public String list(){

        return "admin/list";
    }

/*    *//**
     * 跳转到管理员列表页面
     * @return
     *//*
    @GetMapping("/usersetting")
    public String usersetting(){

        return "admin/usersetting";
    }*/

    /**
     * 跳转到修改密码页面
     * @return
     */
    @GetMapping("/userpassword")
    public String userpassword(){

        return "admin/userpassword";
    }

}
