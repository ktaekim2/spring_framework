package com.its.member.repository;

import com.its.member.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public int save(MemberDTO memberDTO) {
        return sql.insert("Member.save", memberDTO);
    }

    public boolean login(MemberDTO memberDTO) {
        boolean selectResult = false;
        if (sql.selectOne("Member.login", memberDTO) != null) {
            selectResult = true;
        } return selectResult;
    }

    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }
}
