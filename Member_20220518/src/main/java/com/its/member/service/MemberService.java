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

    public MemberDTO login(MemberDTO memberDTO) {
        MemberDTO loginMember = memberRepository.login(memberDTO);
        // select * 은 DTO전체
        return loginMember;
    }

    public List<MemberDTO> findAll() {
//        List<MemberDTO> memberDTOList = memberRepository.findAll();
//        return memberDTOList;
        return memberRepository.findAll();
    }

    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    public boolean deleteById(Long id) {
        int deleteResult = memberRepository.deleteById(id);
        if (deleteResult > 0) {
            return true;
        } else {
            return false;
        }
    }
}
