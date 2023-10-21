package com.example.controller;

import com.example.common.lang.Result;
import com.example.dto.LoginDTO;
import com.example.dto.RegisterDTO;
import com.example.dto.UpdateUserDTO;
import com.example.dto.UserInfoDTO;
import com.example.entity.User;
import com.example.service.impl.UserServiceImpl;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserServiceImpl userService;

    @RequestMapping("/register")
    public String register(){
        return "/user/register";
    }

    @PostMapping("/login")
    @ResponseBody
    public Result login(@RequestBody LoginDTO loginDTO){
        User user = userService.getUserByUserName(loginDTO.getUsername());

        if (user == null){
            return Result.fail("用户不存在");
        }
        if (user.getUserPassword().equals(DigestUtils.md5Hex(loginDTO.getPassword()))){
            UserInfoDTO userInfoDTO = new UserInfoDTO(user.getUserId(), user.getUserName(), user.getUserPassword(), user.getUserEmail());
            return Result.success("登陆成功", userInfoDTO);
        }else {
            return Result.fail("用户名或密码错误");
        }
    }

    @PostMapping("/register")
    @ResponseBody
    public Result register(@RequestBody RegisterDTO registerDTO){
        User query = userService.getUserByUserName(registerDTO.getUsername());

        if (query != null){
            return Result.fail("用户名已存在");
        }else {
            User user = new User();
            user.setUserName(registerDTO.getUsername());
//            密码md5加密后存入数据库
            user.setUserPassword(DigestUtils.md5Hex(registerDTO.getPassword()));
            user.setUserEmail(registerDTO.getEmail());
            userService.save(user);
            return Result.success("注册成功", user);
        }
    }

    @GetMapping("/logout")
    @ResponseBody
    public Result logout(){
        return Result.success("注销成功");
    }

    @PostMapping("/update")
    @ResponseBody
    public Result update(@RequestBody UpdateUserDTO updateUserDTO){
        User user = new User();
        user.setUserId(Long.parseLong(updateUserDTO.getId()));
        user.setUserName(updateUserDTO.getUsername());
        user.setUserPassword(DigestUtils.md5Hex(updateUserDTO.getNewPassword()));
        user.setUserEmail(updateUserDTO.getEmail());
        if (userService.saveOrUpdate(user)){
            UserInfoDTO userInfoDTO = new UserInfoDTO(user.getUserId(), user.getUserName(), user.getUserPassword(), user.getUserEmail());
            return Result.success("修改成功", userInfoDTO);
        }else {
            return Result.fail("修改失败");
        }
    }
}
