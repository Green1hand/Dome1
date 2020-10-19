package com.chf.service;

import com.chf.entiy.Admin;
import com.chf.entiy.Survey;
import com.chf.entiy.Survey_Admin;

import java.util.List;

/**
 * 问卷业务层接口
 */
public interface SurveyService {

    /**
     * 添加
     * @param survey
     * @return
     */
    boolean create(Survey_Admin survey_admin);

    /**
     * 删除
     * @param survey
     * @return
     */
    boolean delete(Survey survey);

    /**
     * 批量删除
     * @param ids
     * @return
     */
    int deletes(String ids);

    /**
     * 修改
     * @param survey
     * @return
     */
    boolean update(Survey survey);

    /**
     * 查询
     * @param survey_admin
     * @return
     */
    List<Survey_Admin> query(Survey_Admin survey_admin);

    /**
     * 查询一条数据
     * @param survey
     * @return
     */
    Survey detail(Survey survey);

    /**
     * 分页
     * @return
     */
    int count();
}
