package com.chf.controller;

import com.chf.entiy.Survey;
import com.chf.entiy.Survey_Admin;
import com.chf.service.AdminService;
import com.chf.service.SurveyService;
import com.chf.utils.ResultInfo;
import com.chf.utils.ResultInfo2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * 问卷管理的响应
 */
@Controller
@RequestMapping("/survey")
public class SurveyController {

    @Autowired
    private SurveyService surveyService;

    @Autowired
    private AdminService adminService;
    /**
     * 添加问卷
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public ResultInfo addSurvey(@RequestBody Survey_Admin survey_admin){

        ResultInfo resultInfo = new ResultInfo();
        Date date = new Date();

        String account = survey_admin.getAccount();
        int id = adminService.addAdmin_id(account);

        survey_admin.setAnon(survey_admin.getAnon()==null?0:1);
        survey_admin.setCreator(id);
        survey_admin.setState("新建");
        survey_admin.setCreator_time(date);

        boolean b = surveyService.create(survey_admin);
        if(b){
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
    public ResultInfo deleteSurvey(String ids){

        ResultInfo resultInfo = new ResultInfo();
        int bl = surveyService.deletes(ids);
        if (bl <= 0){
            return resultInfo.SB();
        }else {
            return resultInfo.CG();
        }
    }

    /**
     * 修改
     * @param survey
     * @return
     */
    @PostMapping("/update")
    @ResponseBody
    public ResultInfo updateSurvey(@RequestBody Survey survey){

        ResultInfo resultInfo = new ResultInfo();

        survey.setAnon(survey.getAnon()==null?0:1);
        boolean b = surveyService.update(survey);
        if (b){
            return resultInfo.CG();
        }
        return resultInfo.SB();
    }

    /**
     * 查询
     * @param survey_admin
     * @return
     */
    @RequestMapping("/query")
    @ResponseBody
    public ResultInfo2 querySurvey(Survey_Admin survey_admin){

        ResultInfo2 resultInfo = new ResultInfo2();
        int count = surveyService.count();
        List<Survey_Admin> list = surveyService.query(survey_admin);
        resultInfo.setCode(0);
        resultInfo.setMsg("返回成功");
        resultInfo.setData(list);
        resultInfo.setCount(count);
        return resultInfo;
    }

    /**
     * 跳转到修改页面
     * @param survey
     * @return
     */
    @RequestMapping("/detail")
    public String detailSurvey(Survey survey, Model model){

        Survey detail = surveyService.detail(survey);

        model.addAttribute("survey",detail);
        return "survey/update";
    }

    /**
     * 跳转到管理员列表页面
     * @return
     */
    @GetMapping("/list")
    public String list(){

        return "survey/list";
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @GetMapping("/add")
    public String add(){

        return "survey/add";
    }

    /**
     * 跳转到设计问卷页面
     * 暂时无页面，跳转到404
     * @return
     */
    @GetMapping("/set")
    public String setSurvey(){

        return "error";
    }

    /**
     * 跳转到预览问卷页面
     * 暂时无页面，跳转到404
     * @return
     */
    @GetMapping("/Preview")
    public String PreviewSurvey(){

        return "error";
    }

    /**
     * 跳转到发布问卷页面
     * 暂时无页面，跳转到404
     * @return
     */
    @GetMapping("/get")
    public String getSurvey(){

        return "error";
    }

    /**
     * 跳转到问卷详情页面
     * 暂时无页面，跳转到404
     * @return
     */
    @GetMapping("/Details")
    public String DetailsSurvey(){

        return "error";
    }
}
