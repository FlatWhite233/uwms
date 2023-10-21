package com.example;

import com.example.entity.Person;
import com.example.mapper.PersonMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
@SpringBootTest
public class PersonTest {

    @Autowired
    PersonMapper personMapper;

    @Test
    void list(){
        List<Person> personList = personMapper.selectList(null);
        personList.forEach(System.out::println);
    }
}
