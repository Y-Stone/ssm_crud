package cn.stone.controller;

import cn.stone.domain.Department;
import cn.stone.domain.Msg;
import cn.stone.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @program: crud
 * @description: 部门信息控制器
 * @author: Stone
 * @create: 2020-02-19 14:49
 **/
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;


    /**
     * 处理/getDeparts请求
     * @return 所有部门信息
     */
    @ResponseBody
    @RequestMapping("/getDeparts")
    public Msg getDepartments(){
        //获取所有部门信息
        List<Department> list = departmentService.getAllDeparts();
        return Msg.success().add("departments", list);
    }

}
