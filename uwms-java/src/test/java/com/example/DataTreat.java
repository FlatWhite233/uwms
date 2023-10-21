package com.example;

import com.example.entity.Admin;
import com.example.entity.Person;
import com.example.entity.User;
import com.example.mapper.AdminMapper;
import com.example.mapper.PersonMapper;
import com.example.mapper.UserMapper;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

@SpringBootTest
public class DataTreat {

    @Autowired
    private PersonMapper personMapper;
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private UserMapper userMapper;

    @Test
    void insertAdmin(){
        Admin admin = new Admin();
        admin.setAdminName("root");
        admin.setAdminPassword(DigestUtils.md5Hex("root"));
        System.out.println(admin);
        int insert = adminMapper.insert(admin);
    }

    @Test
    void insertUser(){
        User user = new User();
        user.setUserName("root");
        user.setUserPassword(DigestUtils.md5Hex("root"));
        user.setUserEmail("root@underworld.com");
        System.out.println(user);
        int insert = userMapper.insert(user);
    }

    @Test
    void insertPerson(){

        Calendar calendar = Calendar.getInstance();
        Date birth = calendar.getTime();
        ArrayList<Person> people = new ArrayList<>();

        for (int i = 0; i < 20; i++) {
            calendar.add(Calendar.YEAR, +i);
            Date death = calendar.getTime();
            Person person = new Person();
            person.setPersonName("勺子乙");
            person.setPersonGender(1);
            person.setPersonBirth(birth);
            person.setPersonDeath(death);
            person.setPersonDeadReason("还没死");
            person.setPersonHobby("Chess");
            person.setPersonAddress("地狱一层1号街");
            people.add(person);
        }
        for (int i = 0; i < 20; i++) {
            calendar.add(Calendar.YEAR, -i);
            Date death = calendar.getTime();
            Person person = new Person();
            person.setPersonName("勺子丙");
            person.setPersonGender(0);
            person.setPersonBirth(birth);
            person.setPersonDeath(death);
            person.setPersonDeadReason("吃饭噎死");
            person.setPersonHobby("Music");
            person.setPersonAddress("地狱二层1号街");
            people.add(person);
        }

        for (Person person : people) {
            personMapper.insert(person);
        }
    }
}
