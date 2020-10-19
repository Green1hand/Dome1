package com.chf.service.impl;

import com.chf.entiy.Admin;
import com.chf.dao.AdminDao;
import com.chf.service.AdminService;
import com.github.pagehelper.PageHelper;
import com.google.common.base.Splitter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务层的实现类
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    /**
     * 添加
     * @param admin
     * @return
     */
    @Override
    public boolean create(Admin admin) {

        //System.out.println("业务层：添加账户");
        return adminDao.create(admin);
    }

    /**
     * 查询 id
     * @param account
     * @return
     */
    @Override
    public int addAdmin_id(String account) {
        return adminDao.addAdmin_id(account);
    }

    /**
     * 删除
     * @param admin
     * @return
     */
    @Override
    public boolean delete(Admin admin) {

        //System.out.println("业务层：删除账户");
        return adminDao.delete(admin);
    }

    /**
     * 批量删除
     * @param ids
     * @return
     */
    @Override
    public int deletes(String ids) {

        //System.out.println("业务层：删除账户");
        int x = 0;
        List<String> list = Splitter.on(",").splitToList(ids);
        for (String s : list){

            Admin admin = new Admin();
            admin.setId(Integer.parseInt(s));
            adminDao.delete(admin);
            x++;
        }
        return x;
    }

    /**
     * 更新
     * @param admin
     * @return
     */
    @Override
    public boolean update(Admin admin) {

        //System.out.println("业务层：修改账户");
        return adminDao.update(admin);
    }

    /**
     * 修改密码
     * @param admin
     * @param password
     * @return
     */
    @Override
    public boolean updatepassword(String admin, String password) {

        return adminDao.updatepassword(admin,password);
    }

    /**
     * 查询
     * @param admin
     * @return
     */
    @Override
    public List<Admin> query(Admin admin) {

        //System.out.println("业务层：查询数据");
        /*设置分页*/
        PageHelper.startPage(admin.getPage(),admin.getLimit());
        return adminDao.query(admin);
    }

    /**
     * 明细
     * @param admin
     * @return
     */
    @Override
    public Admin detail(Admin admin) {

        //System.out.println("业务层：查询数据");
        return adminDao.detail(admin);
    }

    /**
     * 分页
     * @return
     */
    @Override
    public int count() {

        return adminDao.count();
    }

    /**
     * 登入验证
     * @param account
     * @param password
     * @return
     */
    @Override
    public Admin login(String account, String password) {

        return adminDao.login(account,password);
    }
}
