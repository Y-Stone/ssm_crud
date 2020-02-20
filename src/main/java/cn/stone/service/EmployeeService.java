package cn.stone.service;

import cn.stone.domain.Employee;

import java.util.List;

/**
 * @program: crud
 * @description: 员工逻辑接口
 * @author: Stone
 * @create: 2020-02-19 14:50
 **/
public interface EmployeeService {

    /**
     * @return 查询所有员工
     */
    public abstract List<Employee> getEmps();

    /**
     * 保存员工
     * @param employee 员工信息
     */
    void saveEmp(Employee employee);

    /**
     * @param name 用户名
     * @return 当前用户名是否可用
     */
    Boolean checkUser(String name);

    /**
     * @param id 主键id
     * @return 对应的员工
     */
    Employee getEmpById(Integer id);

    /**修改信息
     * @param employee
     */
    void updateEmp(Employee employee);

    /**
     * @param id 主键id
     *           根据主键id删除对象
     */
    void deleteEmpById(Integer id);

    /**
     * @param ids_int 多个对象的id
     *                批量删除对象
     */
    void deleteEmpBatch(List<Integer> ids_int);
}
