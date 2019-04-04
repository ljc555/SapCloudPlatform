package com.core.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.core.dao.UserDao;
import com.core.entity.User;
import com.core.mappers.MyRowMapper;
import com.core.service.UserService;

/**
 * @author 1034683568@qq.com
 *         project_name ssm-demo
 * @date 2015-7-28
 * @time 下午1:52:50
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;
    @Resource
    private JdbcTemplate jdbcTemplate;
    
    @Override
    public List<User> getAllUser() {
    	 String sql = "select * from ssm_user ";
    	 List<User> list = jdbcTemplate.query(sql, new MyRowMapper());
    	 System.out.println(list);
    	 return list;
    }

    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    @Override
    public List<User> findUser(Map<String, Object> map) {
        return userDao.findUsers(map);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public Long getTotalUser(Map<String, Object> map) {
        return userDao.getTotalUser(map);
    }

    @Override
    public int addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public int deleteUser(Integer id) {
        return userDao.deleteUser(id);
    }

}
