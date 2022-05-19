package com.its.member.service;

import com.its.member.dto.MemberDTO;
import com.its.member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public boolean save(MemberDTO memberDTO) {
        int saveResult = memberRepository.save(memberDTO);
        // insert 결과가 숫자로 넘어오므로
        if (saveResult > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean login(MemberDTO memberDTO) {
        boolean loginResult = memberRepository.login(memberDTO);
        if (loginResult) {
            return true;
        } else {
            return false;
        }
    }

    public List<MemberDTO> findAll() {
        List<MemberDTO> memberDTOList = memberRepository.findAll();
        return memberDTOList;
    }
}
