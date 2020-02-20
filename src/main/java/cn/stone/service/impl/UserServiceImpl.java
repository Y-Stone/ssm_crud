package cn.stone.service.impl;

import cn.stone.dao.UserMapper;
import cn.stone.domain.User;
import cn.stone.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: crud
 * @description:
 * @author: Stone
 * @create: 2020-02-20 13:10
 **/
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public User loginUser(User user) {
        /*校验用户名和密码是否存在*/
        String username = user.getUsername();
        String password = user.getPassword();
        if(username == null || "".equals(username)){
            return null;
        }else if(password == null || "".equals(password)){
            return null;
        }else{
            return userMapper.getUser(user);
        }
    }
}
