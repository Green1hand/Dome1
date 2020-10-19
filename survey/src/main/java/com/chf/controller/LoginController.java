package com.chf.controller;

import com.chf.entiy.Admin;
import com.chf.service.AdminService;
import com.chf.utils.Md5Util;
import com.chf.utils.ResultInfo;
import com.google.common.base.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 登入验证于跳转
 */
@Controller
public class LoginController {

    @Autowired
    private AdminService adminService;

    /**
     * 启动跳转
     * @return
     */
    @GetMapping("/login")
    public String c_longin(){

        return "login";
    }

    /**
     * 注册页面跳转
     * @return
     */
    @GetMapping("/register")
    public String register(){

        return "register";
    }

    /**
     * 注册页面响应
     * @return
     */
    @PostMapping("/register")
    @ResponseBody
    public ResultInfo register(@RequestBody Admin admin){

        ResultInfo resultInfo = new ResultInfo();

        String password = admin.getPassword();
        admin.setPassword(Md5Util.gerMD5(password));
        boolean bl = adminService.create(admin);
        if (bl){
            return resultInfo.CG();
        }else {
            return resultInfo.SB();
        }
    }

    /**
     * 登入验证
     * @return
     */
    @PostMapping("/login")
    @ResponseBody
    public ResultInfo longin(@RequestBody Map<String, Object> map , HttpServletRequest request, Model model){

        ResultInfo resultInfo = new ResultInfo();
        String account = map.get("account")+"";
        String password = map.get("password")+"";

        if(Strings.isNullOrEmpty(account) || Strings.isNullOrEmpty(password)){

            return resultInfo.YC();
        }
        Admin admin = adminService.login(account,Md5Util.gerMD5(password));
        //判断登入是否成功
        if (admin != null){

            HttpSession session = request.getSession();
            session.setAttribute("admin",admin.getAccount());
            model.addAttribute("admin",admin);
            if (account.equals("admin")){

                return resultInfo.CG();
            }else {
                resultInfo.setCode(300);
                resultInfo.setMsg("登入成功");
                return resultInfo;
            }
        }else {

            return resultInfo.SB();
        }

    }
}
