package com.example;

import com.example.entity.Person;
import com.example.entity.User;
import com.example.mapper.AdminMapper;
import com.example.mapper.PersonMapper;
import com.example.mapper.UserMapper;
import com.example.service.impl.UserServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Calendar;
import java.util.Date;

@SpringBootTest
public class Temp {

    @Autowired
    PersonMapper personMapper;
    @Autowired
    AdminMapper adminMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    UserServiceImpl userService;

    @Test
    void updateTime(){
        User user = new User();
        user.setUserId(Long.parseLong("1450419542273683458"));
        user.setUserName("updateTimeTest");
        userService.saveOrUpdate(user);
    }

    @Test
    void DateTest(){
        Calendar calendar = Calendar.getInstance();
        Date date1 = calendar.getTime();
        calendar.add(Calendar.YEAR, +20);
        Date date2 = calendar.getTime();
        System.out.println(date1);
        System.out.println(date2);
    }

    @Test
    void calPersonRemainLife(){
        Calendar calendar = Calendar.getInstance();
        Date birth = calendar.getTime();
        calendar.add(Calendar.YEAR, +20);
        Date death = calendar.getTime();
        for (int i = 0; i < 3; i++) {
            Person person = new Person();
            person.setPersonName("测试计算阳寿");
            person.setPersonGender(1);
            person.setPersonBirth(birth);
            person.setPersonDeath(death);
            person.setPersonHobby("Chess");
            person.setPersonAddress("地狱一层1号街");
            personMapper.insert(person);
        }
    }

    @Test
    void checkPersonIsDead(){
        Calendar calendar = Calendar.getInstance();
        Date birth = calendar.getTime();
        calendar.add(Calendar.YEAR, -1);
        Date death = calendar.getTime();
        for (int i = 0; i < 3; i++) {
            Person person = new Person();
            person.setPersonName("测试判断是否死亡");
            person.setPersonGender(1);
            person.setPersonBirth(birth);
            person.setPersonDeath(death);
            person.setPersonDeadReason("吃饭噎死的");
            person.setPersonHobby("Chess");
            person.setPersonAddress("地狱一层1号街");
            personMapper.insert(person);
        }
    }

    @Test
    void checkPersonIsDead2(){
        Calendar calendar = Calendar.getInstance();
        Date birth = calendar.getTime();
        for (int i = 0; i < 3; i++) {
            Person person = new Person();
            person.setPersonName("测试夭折");
            person.setPersonGender(1);
            person.setPersonBirth(birth);
            person.setPersonDeath(birth);
            person.setPersonDeadReason("出生夭折");
            person.setPersonHobby("Chess");
            person.setPersonAddress("地狱一层1号街");
            personMapper.insert(person);
        }
    }
    @Test
    void checkPersonIsDead3(){
        Calendar calendar = Calendar.getInstance();
        Date birth = calendar.getTime();
        Person person = new Person();
        person.setPersonName("AAA");
        person.setPersonGender(1);
        person.setPersonBirth(birth);
        person.setPersonDeath(birth);
        person.setPersonDeadReason("出生夭折");
        person.setPersonHobby("Chess");
        person.setPersonAddress("地狱一层1号街");
        personMapper.insert(person);
    }

}
