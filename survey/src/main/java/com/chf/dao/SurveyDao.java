package com.chf.dao;

import com.chf.dao_sql.Dao_sql;
import com.chf.entiy.Survey;
import com.chf.entiy.Survey_Admin;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 问卷类接口
 */
@Repository
public interface SurveyDao {
    /**
     * 添加
     * @param survey_admin
     * @return
     */
    @Insert("insert into tb_Survey(" +
            "id," +
            "title," +
            "remark," +
            "bounds," +
            "start_time," +
            "end_time," +
            "rules," +
            "password," +
            "url," +
            "state," +
            "logo," +
            "bgimg," +
            "anon," +
            "creator," +
            "creator_time) " +
            "values(" +
            "#{id}," +
            "#{title}," +
            "#{remark}," +
            "#{bounds}," +
            "#{start_time}," +
            "#{end_time}," +
            "#{rules}," +
            "#{password}," +
            "#{url}," +
            "#{state}," +
            "#{logo}," +
            "#{bgimg}," +
            "#{anon}," +
            "#{creator}," +
            "#{creator_time})")
    boolean create(Survey_Admin survey_admin);

    /**
     * 删除
     * @param survey
     * @return
     */
    @Delete("delete from tb_survey where id=#{id}")
    boolean delete(Survey survey);

    /**
     * 修改
     * @param survey
     * @return
     */
    @Update("update tb_survey " +
            "set title=#{title}," +
            "remark=#{remark}," +
            "bounds=#{bounds}," +
            "start_time=#{start_time}," +
            "end_time=#{end_time}," +
            "rules=#{rules}," +
            "password=#{password}," +
            "state=#{state}," +
            "anon=#{anon} " +
            "where id=#{id}")
    boolean update(Survey survey);

    /**
     * 查询
     * @param survey_admin
     * @return
     */
    /*@Select("select * from tb_survey")*/
    @SelectProvider(type = Dao_sql.class ,method = "querySurvey")
    List<Survey_Admin> query(Survey_Admin survey_admin);

    /**
     * 明细
     * @param survey
     * @return
     */
    @Select("select * from tb_survey where id=#{id}")
    Survey detail(Survey survey);

    /**
     * 分页
     * @param
     * @return
     */
    @Select("select count(*) cont from tb_survey")
    int count();
}
