package com.example.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Person {
//    主键：默认使用雪花算法+UUID(不含中划线)
    @TableId(type = IdType.ASSIGN_ID)
    private Long personId;
    private String personName;
//    personGender: 1 -> male, 0 -> female
    private Integer personGender;
    private Date personBirth;
    private Date personDeath;
    private Integer personRemainLife;

//    personIsDead: 1 -> dead, 0 -> live
//    Default FieldFill -> 0
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Integer personIsDead;
    private String personDeadReason;
    private String personHobby;
    private String personAddress;
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    @TableField(fill = FieldFill.UPDATE)
    private Date updateTime;
}
