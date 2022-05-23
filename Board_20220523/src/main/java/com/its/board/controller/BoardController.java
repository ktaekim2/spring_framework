package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/board") // '/board/save'에서 앞부분 생략
public class BoardController {
    @Autowired
    private BoardService boardService;

    @GetMapping("/save")
    public String saveForm() {
        return "boardPages/save"; // board폴더 안의 save.jsp
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) {
        boolean saveResult = boardService.save(boardDTO);
        if (saveResult) {
            System.out.println("글작성성공");
            return "redirect:/board/findAll"; // 주소
        } else {
            System.out.println("글작성실패");
            return "/boardPages/save-fail"; // jsp
        }
    }

    @GetMapping("/findAll")
    public String findAll(Model model, HttpSession session) {
        List<BoardDTO> boardDTOList = boardService.findAll();
//        session.setAttribute("boardList", boardDTOList);
        model.addAttribute("boardList", boardDTOList);
        return "boardPages/list";
        //모델을 쓴 메서드의 리턴페이지까지만 데이터가 넘어감 계속 못씀씀    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "/detail";
    }

//    @GetMapping("/passwordCheck")
//    public String passwordCheck() {
//        return "passwordCheck";
//    }
//
//    @PostMapping("/passwordCheck")
//    public String passwordCheck(String boardPassword) {
//        boolean checkResult = boardService.passwordCheck(boardPassword);
//        if (checkResult) {
//            System.out.println("비밀번호 일치");
//            return "main";
//        } else {
//            System.out.println("비밀번호가 불일치");
//            return "login-form";
//        }
//    }

    @GetMapping("/delete")
    public String delete(Long id, Model model) {
//        Long updateId = (Long) session.getAttribute("loginId");
//        MemberDTO memberDTO = memberService.findById(updateId);
//        model.addAttribute("updateMember", memberDTO);
        return "delete";
    }

    @PostMapping("/delete")
    public String delete(Long id) {
        boolean deleteResult = boardService.delete(id);
        if(deleteResult) {
            return "/boardPages/list";
        } else {
            return "update-fail";
        }
    }
}
