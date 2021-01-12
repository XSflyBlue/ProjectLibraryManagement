package com.plm.interceptor;

import com.plm.model.UserInfo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 权限验证
 *
 * @author Flyblue
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        request.setCharacterEncoding("UTF-8");
        String url = request.getServletPath();
        System.out.println("post URL：" + url);
        if (!"".equals(url)) {
            //判断是否已登录
            UserInfo loginUser = (UserInfo) request.getSession().getAttribute("user");
            if (loginUser == null) {
                System.out.println("未登录，请重新登录");
                response.sendRedirect(request.getContextPath() + "/user/login");
                return false;
            }
            if (loginUser.getStatus() == 0) {//未激活
                System.out.println("账号未激活，请联系管理员进行激活");
                request.getSession().setAttribute("info", "未激活，请联系管理员进行激活");
                response.sendRedirect(request.getContextPath() + "/user/login");
                return false;
            }
        }
        return true;
    }
}

