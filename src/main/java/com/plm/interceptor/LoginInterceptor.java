package com.plm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.plm.model.UserInfo;

/**
 * 权限验证
 * @author Flyblue
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
        String url = request.getServletPath();    
        System.out.println("post URL："+url);
        if(!url.equals("")){
            //判断是否已登录
            UserInfo loginUser = (UserInfo)request.getSession().getAttribute("user");
            if(loginUser == null){
                System.out.println("未登录，请重新登录");
                response.sendRedirect(request.getContextPath()+"/user/login");
                return false;
            }
            if(loginUser.getStatus()==0) {//未激活
                System.out.println("账号未激活，请联系管理员进行激活");
                request.getSession().setAttribute("info", "未激活，请联系管理员进行激活");
                response.sendRedirect(request.getContextPath()+"/user/login");
                return false;
            }
        }
        return true;
	}
}

