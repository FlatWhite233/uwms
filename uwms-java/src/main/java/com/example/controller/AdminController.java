package com.example.controller;

import com.example.common.lang.Result;
import com.example.dto.AdminInfoDTO;
import com.example.dto.LoginDTO;
import com.example.entity.Admin;
import com.example.service.impl.AdminServiceImpl;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminServiceImpl adminService;

    @RequestMapping("/list")
    @ResponseBody
    public Result listAdmin(){
        List<Admin> adminList = adminService.list();
        return Result.success(adminList);
    }

    @PostMapping("/login")
    @ResponseBody
    public Result login(@RequestBody LoginDTO loginDTO){
        Admin admin = adminService.getAdminByAdminName(loginDTO.getUsername());

        if (admin == null){
            return Result.fail("管理员不存在");
        }
        if (admin.getAdminPassword().equals(DigestUtils.md5Hex(loginDTO.getPassword()))){
            AdminInfoDTO adminInfoDTO = new AdminInfoDTO(admin.getAdminId(), admin.getAdminName(), admin.getAdminPassword());
            return Result.success("登陆成功", adminInfoDTO);
        }else {
            return Result.fail("用户名或密码错误");
        }
    }
}
