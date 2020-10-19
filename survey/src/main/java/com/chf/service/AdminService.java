package com.chf.service;

import com.chf.entiy.Admin;

import java.util.List;
import java.util.Map;

/**
 * 账户业务层接口
 */
public interface AdminService {

    /**
     * 添加
     * @param admin
     * @return
     */
    boolean create(Admin admin);

    /**
     * 查询 id
     * @param account
     * @return
     */
    int addAdmin_id(String account);
    /**
     * 删除
     * @param admin
     * @return
     */
    boolean delete(Admin admin);

    /**
     * 批量删除
     * @param ids
     * @return
     */
    int deletes(String ids);

    /**
     * 修改
     * @param admin
     * @return
     */
    boolean update(Admin admin);

    /**
     * 修改密码
     * @param admin
     * @param password
     * @return
     */
    boolean updatepassword(String admin,String password);

    /**
     * 查询
     * @param admin
     * @return
     */
    List<Admin> query(Admin admin);

    /**
     * 所有
     * @param admin
     * @return
     */
    Admin detail(Admin admin);

    /**
     * 分页
     * @param
     * @return
     */
    int count();

    /**
     * 登入查询
     * @param account
     * @param password
     * @return
     */
    Admin login(String account ,String password);
}
