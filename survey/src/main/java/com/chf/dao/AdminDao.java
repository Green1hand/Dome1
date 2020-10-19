package com.chf.dao;

import com.chf.dao_sql.Dao_sql;
import com.chf.entiy.Admin;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 账户层接口
 */
@Repository
public interface AdminDao {

    /**
     * 添加
     */
    @Insert("insert into tb_admin(account,password,name,phone,remark) " +
            "values(#{account},#{password},#{name},#{phone},#{remark})")
    boolean create(Admin admin);

    /**
     * 查询 id
     * @param account
     * @return
     */
    @Select("select id from tb_admin where account=#{account}")
    int addAdmin_id(String account);

    /**
     * 删除
     * @param admin
     * @return
     */
    @Delete({"<script>" +
            "delete from tb_admin where 1=1 " +
            "<if test='admin.id !=null'>" +
            "and id=#{admin.id}</if>" +
            "<if test='admin.account !=null'>" +
            "and account=#{admin.account}</if>" +
            "<if test='admin.name !=null'>" +
            "and name=#{admin.name}</if>"+
            "</script>"})
   /* @Delete("delete from tb_admin where id=#{admin.id}")*/
    boolean delete(@Param("admin") Admin admin);

    /**
     * 修改
     * @param admin
     * @return
     */
    @Update("update tb_admin " +
            "set account=#{account}," +
            "password=#{password}," +
            "name=#{name}," +
            "phone=#{phone}," +
            "remark=#{remark} " +
            "where id=#{id}")
    boolean update(Admin admin);

    /**
     * 修改密码
     * @return
     */
    @Update("update tb_admin " +
            "set password=#{password} " +
            "where account=#{account}")
    boolean updatepassword(@Param("account") String account ,@Param("password") String password);

    /**
     * 查询
     * @param admin
     * @return
     */
    @SelectProvider(type = Dao_sql.class ,method = "queryAdmin")
    List<Admin> query(Admin admin);

    /**
     * 明细
     * @param admin
     * @return
     */
    @Select("select * from tb_admin where id=#{id}")
    Admin detail(Admin admin);

    /**
     * 分页
     * @param
     * @return
     */
    @Select("select count(*) cont from tb_admin")
    int count();

    /**
     *登入验证
     * @return
     */
    @Select("select * from tb_admin where account=#{account} and password=#{password}")
    Admin login(@Param("account") String account ,@Param("password") String password);
}
