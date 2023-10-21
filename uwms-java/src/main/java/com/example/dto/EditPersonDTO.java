package com.example.dto;

import lombok.Data;

import java.util.Date;

@Data
public class EditPersonDTO {
    private String personId;
    private String personName;
    private Integer personGender;
    private Date personBirth;
    private Date personDeath;
    private String personDeadReason;
    private String personHobby;
    private String personAddress;
}
