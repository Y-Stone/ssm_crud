package cn.stone.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @program: crud
 * @description: 登录拦截器
 * @author: Stone
 * @create: 2020-02-20 14:44
 **/
public class LoginInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        /*获取Uri，去除http:localhost:8080这部分剩下的*/
        String uri = httpServletRequest.getRequestURI();
        System.out.println(uri);
        //UTL:除了login.jsp、Login、logout”退出登录“是可以公开访问的，其他的URL都进行拦截控制
        if (uri.contains("login") || uri.contains("Login") || uri.contains("logout")) {
            return true;
        }
        //获取session
        HttpSession session = httpServletRequest.getSession();
        //获取LOGIN_USER
        Object login_user = session.getAttribute("LOGIN_USER");
        if (login_user != null) {
            //登录
            return true;
        } else {
//            未登录
            httpServletRequest.setAttribute("msg", "您还没有登录，请先登录！");
            httpServletRequest.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(httpServletRequest, httpServletResponse);
            return false;
        }

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
