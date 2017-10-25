package com.sod;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * Created by LYJ on 2017/10/17.
 */
@SpringBootApplication
@ServletComponentScan           //扫描监听器
@MapperScan("com.sod.mapper")   //扫描接口 为接口创建代理对象
@EnableTransactionManagement    // 启注解事务管理
public class SpringBoot {

    public static void main(String[] args){
        SpringApplication.run(SpringBoot.class,args);
    }
}
