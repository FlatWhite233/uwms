package com.example.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.common.lang.Result;
import com.example.dto.AddPersonDTO;
import com.example.dto.EditPersonDTO;
import com.example.dto.SearchDTO;
import com.example.entity.Person;
import com.example.service.impl.PersonServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(("/person"))
public class PersonController {

    @Autowired
    PersonServiceImpl personService;

    @RequestMapping("/list")
    @ResponseBody
    public Result listPerson(@RequestParam(defaultValue = "1") Integer currentPage){
        Page<Person> page = new Page<>(currentPage, 7);
        Page<Person> pageData = personService.page(page, new QueryWrapper<>());
        String msg = "当前记录如下，共" + pageData.getTotal() + "条";
//        List<Person> people = personService.list();
//        ArrayList<PersonVO> personVOList = new ArrayList<>();
//        for (Person person : people) {
//            personVOList.add(new PersonVO(
//                    person.getPersonId(),
//                    person.getPersonName(),
//                    person.getPersonGender(),
//                    person.getPersonBirth(),
//                    person.getPersonDeath(),
//                    person.getPersonRemainLife(),
//                    person.getPersonIsDead(),
//                    person.getPersonDeadReason(),
//                    person.getPersonHobby(),
//                    person.getPersonAddress()));
//        }
        return Result.success(msg, pageData);
    }

    @PostMapping("/add")
    @ResponseBody
    public Result addPerson(@RequestBody AddPersonDTO addPersonDTO){
        Person person = new Person();
        person.setPersonName(addPersonDTO.getName());
        person.setPersonGender(addPersonDTO.getGender());
        person.setPersonBirth(addPersonDTO.getBirth());
        person.setPersonDeath(addPersonDTO.getDeath());
        person.setPersonDeadReason(addPersonDTO.getDeadReason());
        person.setPersonHobby(addPersonDTO.getHobby());
        person.setPersonAddress(addPersonDTO.getAddress());
        if (personService.save(person)){
            return Result.success("新增成功");
        }else {
            return Result.fail("新增失败");
        }
    }

    @PostMapping("/edit")
    @ResponseBody
    public Result getPersonById(@RequestBody EditPersonDTO editPersonDTO){
        Person person = new Person();
        person.setPersonId(Long.parseLong(editPersonDTO.getPersonId()));
        person.setPersonName(editPersonDTO.getPersonName());
        person.setPersonGender(editPersonDTO.getPersonGender());
        person.setPersonBirth(editPersonDTO.getPersonBirth());
        person.setPersonDeath(editPersonDTO.getPersonDeath());
        person.setPersonDeadReason(editPersonDTO.getPersonDeadReason());
        person.setPersonAddress(editPersonDTO.getPersonAddress());
        if (personService.saveOrUpdate(person)){
            return Result.success("修改成功");
        }else {
            return Result.fail("修改失败");
        }
    }

    @GetMapping("/delete/{id}")
    @ResponseBody
    public Result deletePerson(@PathVariable String id){
        if (personService.removeById(id)){
            return Result.success("删除成功",null);
        }else {
            return Result.fail("删除失败");
        }
    }

    @PostMapping("/search/")
    @ResponseBody
    public Result searchPerson(@RequestBody SearchDTO searchDTO){
        QueryWrapper<Person> wrapper = new QueryWrapper<>();
        wrapper.like("person_name", searchDTO.getSearchContent());
        Page<Person> page = new Page<>(searchDTO.getCurrentPage(), 7);
        Page<Person> pageData = personService.page(page, wrapper);

        if (pageData.getTotal() == 0){
            return Result.fail("没有搜索到相关信息");
        }else {
            String msg = "搜索结果如下，共" + pageData.getTotal() + "条";
            return Result.success(msg, pageData);
        }
    }
}
