package cn.stone.dao;

import cn.stone.domain.User;

/**
 * @program: crud
 * @description: 用户dao接口
 * @author: Stone
 * @create: 2020-02-20 12:43
 **/
public interface UserMapper {
    public abstract User getUser(User user);
}
