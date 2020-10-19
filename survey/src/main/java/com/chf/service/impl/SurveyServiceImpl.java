package com.chf.service.impl;

import com.chf.dao.SurveyDao;
import com.chf.entiy.Admin;
import com.chf.entiy.Survey;
import com.chf.entiy.Survey_Admin;
import com.chf.service.SurveyService;
import com.github.pagehelper.PageHelper;
import com.google.common.base.Splitter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("surveyService")
public class SurveyServiceImpl implements SurveyService {

    @Autowired
    private SurveyDao surveyDao;

    /**
     * 添加
     * @param survey_admin
     * @return
     */
    @Override
    public boolean create(Survey_Admin survey_admin) {

        return surveyDao.create(survey_admin);
    }

    /**
     * 删除
     * @param survey
     * @return
     */
    @Override
    public boolean delete(Survey survey) {

        return surveyDao.delete(survey);
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @Override
    public int deletes(String ids) {

        int x = 0;
        List<String> list = Splitter.on(",").splitToList(ids);
        for (String s : list){

            Survey survey = new Survey();
            survey.setId(Integer.parseInt(s));
            surveyDao.delete(survey);
            x++;
        }
        return x;
    }

    /**
     * 修改
     * @param survey
     * @return
     */
    @Override
    public boolean update(Survey survey) {

        return surveyDao.update(survey);
    }

    /**
     * 查询数据
     * @param survey_admin
     * @return
     */
    @Override
    public List<Survey_Admin> query(Survey_Admin survey_admin) {
        /*设置分页*/
        PageHelper.startPage(survey_admin.getPage(),survey_admin.getLimit());

        return surveyDao.query(survey_admin);
    }

    /**
     * 查询一条数据
     * @param survey
     * @return
     */
    @Override
    public Survey detail(Survey survey) {

        return surveyDao.detail(survey);
    }

    /**
     * 分页
     * @return
     */
    @Override
    public int count() {
        return surveyDao.count();
    }
}
