package cn.stone.service.impl;

import cn.stone.dao.EmployeeMapper;
import cn.stone.domain.Employee;
import cn.stone.domain.EmployeeExample;
import cn.stone.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: crud
 * @description: EmployeeService的实现类
 * @author: Stone
 * @create: 2020-02-19 14:50
 **/
@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    /**
     * @return 所有员工对象
     */
    @Override
    public List<Employee> getEmps() {
        return employeeMapper.selectByExampleWithDept(null);
    }
    /**
     * 保存员工
     * @param employee 员工信息
     */
    @Override
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }
    /**
     * @param name 用户名
     * @return 当前用户名是否可用
     */
    @Override
    public Boolean checkUser(String name) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(name);
        return employeeMapper.countByExample(example) == 0;
    }

    @Override
    public Employee getEmpById(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }
    /**
     * @param id 主键id
     * @return 对应的员工
     */
    @Override
    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }
    /**修改信息
     * @param employee
     */
    @Override
    public void deleteEmpById(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }
    /**
     * @param ids_int 多个对象的id
     *                批量删除对象
     */
    @Override
    public void deleteEmpBatch(List<Integer> ids_int) {
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andEmpIdIn(ids_int);
        employeeMapper.deleteByExample(example);
    }
}
