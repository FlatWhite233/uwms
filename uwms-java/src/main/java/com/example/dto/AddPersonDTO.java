package com.example.dto;

import lombok.Data;

import java.util.Date;

@Data
public class AddPersonDTO {
    private String name;
    private Integer gender;
    private Date birth;
    private Date death;
    private String deadReason;
    private String hobby;
    private String address;
}
