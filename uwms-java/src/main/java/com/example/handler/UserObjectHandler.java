package com.example.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

@Slf4j
@Component
public class UserObjectHandler implements MetaObjectHandler {
    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("start insert fill ....");
//        this.setFieldValByName("personIsDead", 0, metaObject);
//        this.strictInsertFill(metaObject, "personIsDead", Integer.class, Integer.parseInt("0")); // 起始版本 3.3.0(推荐使用)
        this.strictInsertFill(metaObject, "createTime", Date.class,new Date());
        this.strictInsertFill(metaObject, "updateTime", Date.class,new Date());
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("start update fill ....");
//        this.setFieldValByName("personIsDead", 0, metaObject);
        this.strictUpdateFill(metaObject, "createTime", Date.class,new Date());
        this.strictUpdateFill(metaObject, "updateTime", Date.class,new Date());
    }
}
