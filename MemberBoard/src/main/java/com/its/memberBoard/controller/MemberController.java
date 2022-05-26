package com.its.memberBoard.controller;

import com.its.memberBoard.dto.MemberDTO;
import com.its.memberBoard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm() {
        return "/memberPages/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        System.out.println("MemberController.save");
        System.out.println("memberDTO = " + memberDTO);

        boolean saveResult = memberService.save(memberDTO);
        return "/memberPages/login";
    }

    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId) {
        System.out.println("MemberController.duplicateCheck");
        System.out.println("memberId = " + memberId);
        String checkResult = memberService.duplicateCheck(memberId);
        System.out.println("checkResult = " + checkResult);
        return checkResult;
    }

    @GetMapping("/login")
    public String loginForm() {
        return "/memberPages/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        MemberDTO loginMember = memberService.login(memberDTO);
        if (loginMember != null)
        return "/boardPages/list";
        else
            return "/memberPages/login";
    }
}
