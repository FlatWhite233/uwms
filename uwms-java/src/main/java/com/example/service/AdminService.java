package com.example.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.entity.Admin;

public interface AdminService extends IService<Admin> {
    Admin getAdminByAdminName(String adminName);
}
