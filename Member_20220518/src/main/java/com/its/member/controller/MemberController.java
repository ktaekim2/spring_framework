package com.its.member.controller;

import com.its.member.dto.MemberDTO;
import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save-form")
    public String saveForm() {
        return "save-form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        boolean saveResult = memberService.save(memberDTO);
        if (saveResult) {
            System.out.println("회원가입성공");
            return "login-form";
        } else {
            System.out.println("회원가입실패");
            return "save-fail";
        }
    }

    @GetMapping("/login-form")
    public String loginForm() {
        return "login-form";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
        MemberDTO loginMember = memberService.login(memberDTO);
        // 세션(session): model과 다르게
        // 직접 지우거나 브라우저를 끄지 않으면 세션에 담긴 정보는 유지됨
        if (loginMember != null) {
            System.out.println("로그인성공");
            model.addAttribute("loginMember", loginMember);
            session.setAttribute("loginId", loginMember.getMemberId());
            session.setAttribute("id", loginMember.getId());
            return "main";
        } else {
            System.out.println("로그인실패");
            return "login-form";
        }
    }

    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "list";
    }
}
