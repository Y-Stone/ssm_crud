package cn.stone.service.impl;

import cn.stone.dao.DepartmentMapper;
import cn.stone.domain.Department;
import cn.stone.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: crud
 * @description: DepartmentService的实现类
 * @author: Stone
 * @create: 2020-02-19 14:52
 **/
@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    /**
     * @return 获取所有部门信息
     */
    @Override
    public List<Department> getAllDeparts() {
        return departmentMapper.selectByExample(null);
    }
}
