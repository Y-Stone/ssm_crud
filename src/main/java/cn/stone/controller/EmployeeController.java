package cn.stone.controller;

import cn.stone.domain.Employee;
import cn.stone.domain.Msg;
import cn.stone.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: crud
 * @description: 员工信息控制器
 * @author: Stone
 * @create: 2020-02-19 14:49
 **/
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    /**
     * 获取员工信息的分页查询结果，返回json字符串
     * @param pn
     * @param model
     * @return 结果封装信息
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn", required = false, defaultValue = "1") Integer pn) {
        //分页查询
        PageHelper.startPage(pn, 5);
        List<Employee> emps = employeeService.getEmps();
        //分页条最多显示5页
        PageInfo<Employee> pageInfo = new PageInfo<>(emps, 5);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * @param pn    当前页数
     * @param model 存储模型
     * @return 跳转页面
     */
//    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn", required = false, defaultValue = "1") Integer pn, Model model) {
        //分页查询
        PageHelper.startPage(pn, 5);
        List<Employee> emps = employeeService.getEmps();
        PageInfo<Employee> pageInfo = new PageInfo<>(emps, 5);
        model.addAttribute("pageInfo", pageInfo);
        return "list";
    }


    /**
     * @Valid 对封装的信息进行校验的注解
     * @param employee 员工信息
     * @param bindingResult 校验结果
     * @return 保存结果
     */
    @ResponseBody
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    public Msg saveEmp(@Valid Employee employee, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            /*检验错误*/
            Map<String, Object> map = new HashMap<>();
            //获取所有字段错误，包含key/value
            List<FieldError> allErrors = bindingResult.getFieldErrors();
            for (FieldError error : allErrors) {
                System.out.println("错误字段:" + error.getField());
                System.out.println("错误信息:" + error.getDefaultMessage());
                map.put(error.getField(), error.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        } else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }

    /**
     * @param name 员工名
     * @return 封装当前员工名是否可用的结果信息
     */
    @ResponseBody
    @PostMapping(value = "/checkUser")
    public Msg checkUser(@RequestParam(value = "userName", required = false) String name) {

        /*校验用户名是否符合前端的正则表达式*/
        String regex = "^[a-zA-Z0-9_-]{6,16}$|(^[\\u2E80-\\u9FFF]{2,5})";
        if (!name.matches(regex)) {
            //不符合规则
            return Msg.fail().add("msg", "用户名不是2-5位中文或者6-16位英文和数字的组合");
        }
        Boolean check = false;
        //判断name字段是否null或空字符串
        if (name != null && !"".equals(name)) {
            //判断数据库中是否存在当前员工名
            check = employeeService.checkUser(name);
        } else {
            check = false;
        }
        if (check) {
            return Msg.success().add("msg", "用户名可以用");
        } else {
            return Msg.fail().add("msg", "用户名已存在");
        }
    }

    /**
     * @param id 主键id
     * @return 对应员工信息
     */
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpById(@PathVariable(value = "id", required = false) Integer id) {
        if (id != null) {
            Employee employee = employeeService.getEmpById(id);
            return Msg.success().add("emp", employee);
        } else {
            return Msg.fail();
        }
    }

    /**
     * {empId}而不是{id}，员工对象的主键为empId
     * @param employee 员工信息
     * @return
     */
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Employee employee) {
        employeeService.updateEmp(employee);
        return Msg.success();
    }


    /**
     * 批量删除
     * 单个删除/emp/id
     * 多个删除/emp/id1-id2-id3
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{empId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("empId") String ids) {
        if (ids != null && !"".equals(ids)){
            if(ids.contains("-")){
                /*多个删除*/
                List<Integer> ids_int = new ArrayList<Integer>();
                String[] ids_str = ids.split("-");
                for (String id : ids_str) {
                    ids_int.add(Integer.parseInt(id));
                }
                employeeService.deleteEmpBatch(ids_int);
            }else{
                //单个删除getDeparts
                Integer id = Integer.parseInt(ids);
                employeeService.deleteEmpById(id);
            }
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    @RequestMapping("/toList")
    public String toList(){
        return "list";
    }
}
