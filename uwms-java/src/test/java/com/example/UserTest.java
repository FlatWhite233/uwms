package com.example;

import com.example.entity.User;
import com.example.mapper.UserMapper;
import com.example.service.impl.UserServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
public class UserTest {

    @Autowired
    UserMapper userMapper;

    @Autowired
    UserServiceImpl userService;

    @Test
    void getUserByUserName(){
        String username = "11";
        User user = userService.getUserByUserName(username);
        System.out.println(user);
    }
}
