package com.example;

import com.example.entity.Admin;
import com.example.mapper.AdminMapper;
import com.example.service.impl.AdminServiceImpl;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class AdminTest {

    @Autowired
    AdminMapper adminMapper;

    @Autowired
    AdminServiceImpl adminService;

    @Test
    void list(){
        System.out.println(adminMapper.toString());
        List<Admin> adminList = adminMapper.selectList(null);
        adminList.forEach(System.out::println);
    }

    @Test
    void insert(){
        Admin admin = new Admin();
        admin.setAdminName("root");
        admin.setAdminPassword(DigestUtils.md5Hex("root"));
        System.out.println(admin);
        int insert = adminMapper.insert(admin);
    }

}
