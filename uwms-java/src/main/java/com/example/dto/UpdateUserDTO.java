package com.example.dto;

import lombok.Data;

@Data
public class UpdateUserDTO {
    private String id;
    private String username;
    private String newPassword;
    private String email;
}
