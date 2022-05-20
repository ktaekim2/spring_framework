package com.its.member.controller;

import com.its.member.dto.MemberDTO;
import com.its.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            session.setAttribute("loginId", loginMember.getId());
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

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "detail";
    }

    @GetMapping("/delete")
    public String deleteById(@RequestParam("id") Long id) {
        boolean deleteResult = memberService.deleteById(id);
        if (deleteResult) {
            // redirect: 컨트롤러의 메서드에서 다른 메서드의 주소를 호출
            // redirect를 이용하여 findAll 주소 요청
            // controller내부에서 다른 메소드 실행을 위해 사용
            return "redirect:/findAll"; // jsp가 오면 안되고 주소값
        } else {
            return "delete-fail";
        }
    }

    @GetMapping("/update-form")
    public String updateForm(HttpSession session, Model model) {
        // 로그인을 한 상태기 때문에 세션에 id, memberId가 들어있고
        // 여기서 세션에 있는 id를 가져온다.
        Long updateId = (Long) session.getAttribute("loginId");
        System.out.println("updateId = " + updateId); // soutv
        // DB에서 해당 회원의 정보를 가져와서 그 정보를 가지고 update.jsp로 이동
        MemberDTO memberDTO = memberService.findById(updateId);
        model.addAttribute("updateMember", memberDTO);
        return "update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        boolean updateResult = memberService.update(memberDTO);
        if(updateResult) {
            // 해당 회원의 상세정보
            return "redirect:/detail?id=" + memberDTO.getId();
        } else {
            return "update-fail";
        }
    }
}
