package cn.stone.service;

import cn.stone.domain.Department;

import java.util.List;

/**
 * @program: crud
 * @description: 部门业务逻辑接口
 * @author: Stone
 * @create: 2020-02-19 14:50
 **/
public interface DepartmentService {


    /**
     * @return 所有部门信息
     */
    List<Department> getAllDeparts();
}
