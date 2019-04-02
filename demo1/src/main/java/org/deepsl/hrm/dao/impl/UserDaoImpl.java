package org.deepsl.hrm.dao.impl;

import org.apache.ibatis.annotations.Param;
import org.deepsl.hrm.dao.UserDao;
import org.deepsl.hrm.domain.User;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Flying Elephant
 * Date 2019/3/31 0031 Time 22:34
 */
@Repository
public class UserDaoImpl implements UserDao {
    @Override
    public User selectByLoginnameAndPassword(HashMap map) {
        return null;
    }

    @Override
    public User selectById(User user) {
        return null;
    }

    @Override
    public void deleteById(Integer id) {

    }

    @Override
    public int update(User user) {
        return 1;
    }

    @Override
    public List<User> selectByPage(Map<String, Object> params) {
        return null;
    }

    @Override
    public List<User> selectAllUser() {
        return null;
    }

    @Override
    public Integer count(Map<String, Object> params) {
        return null;
    }

    @Override
    public void save(User user) {

    }
}
