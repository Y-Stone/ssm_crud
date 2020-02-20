package cn.stone.test;

import cn.stone.domain.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.Arrays;
import java.util.List;

/**
 * @program: crud
 * @description: 测试类
 * @author: Stone
 * @create: 2020-02-18 21:05
 **/
@WebAppConfiguration
@ContextConfiguration(value = {"classpath:applicationContext.xml", "classpath:applicationContext-mvc.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class ControllerTest {

    /**
     * 注入mvc容器
     */
    @Autowired
    private WebApplicationContext context;
    /*测试contoller用*/
    private MockMvc mockMvc;
    @Before
    public void before(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void test1() throws Exception {
        //模拟请求
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "2")).andReturn();

        /*获取请求域中的pageInfo*/
        MockHttpServletRequest request = mvcResult.getRequest();
        PageInfo<Employee> pageInfo = (PageInfo<Employee>) request.getAttribute("pageInfo");
        System.out.println("当前页数:" + pageInfo.getPageNum());
        System.out.println("总页数:" + pageInfo.getPages());
        System.out.println("总记录:" + pageInfo.getTotal());
        System.out.println("连续页面:" + Arrays.toString(pageInfo.getNavigatepageNums()));
        List<Employee> list = pageInfo.getList();
        for (Employee employee : list) {
            System.out.println(employee);
        }
    }
}
