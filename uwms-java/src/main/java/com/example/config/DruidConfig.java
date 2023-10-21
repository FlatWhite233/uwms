package com.example.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.util.HashMap;

@Configuration
public class DruidConfig {

    @ConfigurationProperties(prefix = "spring.datasource")
    @Bean
    public DataSource druidDataSource(){
        return new DruidDataSource();
    }

//    后台监控
//    SpringBoot内置了servlet容器 所以没有web.xml 替代方法 ServletRegistrationBean
    @Bean
    public ServletRegistrationBean statViewServlet(){
        ServletRegistrationBean<StatViewServlet> bean = new ServletRegistrationBean<>(new StatViewServlet(), "/druid/*");
//        后台需要有人登录 账号密码配置

//        设置初始化参数
        HashMap<String, String> initParameters = new HashMap<>();

//        增加配置
//        登录key固定 loginUsername loginPassword
//        initParameters.put("loginUsername","admin");
//        initParameters.put("loginPassword","admin");

//        允许谁可以访问
//        initParameters.put("allow","localhost");
        initParameters.put("allow","");

//        禁止谁能访问
//        initParameters.put("被禁止的人","被禁止的ip");

        bean.setInitParameters(initParameters);

        return bean;
    }

//    filter
    @Bean
    public FilterRegistrationBean webStatFilter(){
        FilterRegistrationBean bean = new FilterRegistrationBean();
        bean.setFilter(new WebStatFilter());
        HashMap<String, String> initParameters = new HashMap<>();

//        不进行统计
        initParameters.put("exclusions", "*.js, *.css, /druid/*");

//        可以过滤哪些请求
        bean.setInitParameters(initParameters);
        return bean;
    }
}
