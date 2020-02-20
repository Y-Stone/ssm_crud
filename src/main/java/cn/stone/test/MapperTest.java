package cn.stone.test;


import cn.stone.dao.DepartmentMapper;
import cn.stone.dao.EmployeeMapper;
import cn.stone.domain.Employee;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@ContextConfiguration(value = {"classpath:applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class MapperTest {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private EmployeeMapper employeeMapper;

    @Test
    public void test1() {
        //插入部门记录
//        Department department = new Department(null, "开发部");
//        departmentMapper.insertSelective(department);
        for (int i = 0; i < 100; i++) {
            String uuid = UUID.randomUUID().toString().substring(0, 5);
            Employee employee = new Employee(null, uuid, "M", uuid + "@qq.com", 1);
            employeeMapper.insertSelective(employee);

        }
    }
}
