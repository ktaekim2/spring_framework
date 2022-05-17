package com.its.dbex.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DataRepository {
    @Autowired
    private SqlSessionTemplate sql; // java와 mapper를 호출해주는 class
    public void save(String val1, String val2) {
        System.out.println("DataRepository.save");
        System.out.println("val1 = " + val1 + ", val2 = " + val2);
        sql.insert("Data.save", val1); // data는 하나만 보낼 수 있음
    }
}
