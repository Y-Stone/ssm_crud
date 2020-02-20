package cn.stone.service;

import cn.stone.domain.User;

/**
 * @program: crud
 * @description: UserService
 * @author: Stone
 * @create: 2020-02-20 13:09
 **/
public interface UserService {

    public abstract User loginUser(User user);
}
