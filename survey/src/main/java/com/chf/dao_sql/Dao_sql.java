package com.chf.dao_sql;

import com.chf.entiy.Admin;
import com.chf.entiy.Survey;
import com.chf.entiy.Survey_Admin;
import org.apache.ibatis.jdbc.SQL;

public class Dao_sql {

    /**
     *admin查询
     * @return
     */
    public String queryAdmin(Admin admin){

        return new SQL(){{
            SELECT("*");
            FROM("tb_admin ta");

            if(!(admin.getId() == null || admin.getId().equals(""))){
                WHERE("ta.id = #{id}");
            }
            if(!(admin.getAccount() == null || admin.getAccount().equals(""))){
                WHERE("ta.account = #{account}");
            }
            if(!(admin.getName() == null || admin.getName().equals(""))){
                WHERE("ta.name = #{name}");
            }
            if(!(admin.getPassword() == null || admin.getPhone().equals(""))){
                WHERE("ta.password = #{password}");
            }
            if(!(admin.getPhone() == null || admin.getPhone().equals(""))){
                WHERE("ta.phone = #{phone}");
            }
        }}.toString();
    }
    /**
     *survey查询
     * @return
     */
    public String querySurvey(Survey_Admin survey_admin){

        return new SQL(){{
            SELECT("*");
            FROM("tb_survey ts");
            LEFT_OUTER_JOIN("tb_admin ta ON ts.creator = ta.id");

            if(!(survey_admin.getTitle() == null || survey_admin.getTitle().equals(""))){
                WHERE("ts.title = #{title}");
            }
            if(!(survey_admin.getState() == null || survey_admin.getState().equals(""))){
                WHERE("ts.state = #{state}");
            }
            if(!(survey_admin.getName() == null || survey_admin.getName().equals(""))){
                WHERE("ta.name = #{name}");
            }
        }}.toString();
    }
}
