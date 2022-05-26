package com.its.memberBoard.repository;

import com.its.memberBoard.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public int save(MemberDTO memberDTO) {
        System.out.println("MemberRepository.save");
        System.out.println("memberDTO = " + memberDTO);

        return sql.insert("Member.save", memberDTO);
    }

    public String duplicateCheck(String memberId) {
    return sql.selectOne("Member.duplicateCheck", memberId);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }
}
