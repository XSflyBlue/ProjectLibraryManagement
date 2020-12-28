package com.plm.configuration;

import com.plm.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.ArrayList;
import java.util.List;

/**
 * 拦截器配置
 *
 * @author Tony
 * @date 2020/12/25
 */
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    /**
     * 自定义拦截器
     *
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        LoginInterceptor loginInterceptor = new LoginInterceptor();
        InterceptorRegistration registration = registry.addInterceptor(loginInterceptor);
        // 需要排除的路径列表
        List<String> excludeList = new ArrayList<>();
        excludeList.add("/user/**");
        excludeList.add("/");
        excludeList.add("/index");
        excludeList.add("/verifyCode");
        excludeList.add("/postlist");
        excludeList.add("/postinfo");
        excludeList.add("/postdetail");
        excludeList.add("/listPost");
        // 静态资源文件，webapp路径有问题，
        excludeList.add("/assets/**");
        excludeList.add("/css/**");
        excludeList.add("/bootstrap/**");
        excludeList.add("/js/**");
        excludeList.add("/fonts/**");
        excludeList.add("/images/**");
        excludeList.add("/download/**");
        excludeList.add("/upload/**");
        excludeList.add("/listFile/**");
        excludeList.add("/linklist/**");
        excludeList.add("/listLinks/**");
        excludeList.add("/helplist/**");
        excludeList.add("/listhelp/**");
        excludeList.add("/helpinfo/**");
        excludeList.add("/filelist/**");
        excludeList.add("/listfile/**");
        excludeList.add("/fileinfo/**");
        excludeList.add("/excellentProjectlist/**");
        excludeList.add("/listexcellentProject/**");
        excludeList.add("/projectinfo/projectinfo");
        excludeList.add("/projectinfo/listprojectuserno");
        excludeList.add("/projectinfo/projectplandetail");
        // 拦截所有路径
        registration.addPathPatterns("/**");
        // 排除指定路径
        registration.excludePathPatterns(excludeList);
    }
}
