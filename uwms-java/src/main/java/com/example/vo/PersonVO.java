package com.example.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PersonVO {
    private Long personId;
    private String personName;
//    personGender: 1 -> male, 0 -> female
    private Integer personGender;
    private Date personBirth;
    private Date personDeath;
    private Integer personRemainLife;

//    personIsDead: 1 -> dead, 0 -> live
    private Integer personIsDead;
    private String personDeadReason;
    private String personHobby;
    private String personAddress;
}
