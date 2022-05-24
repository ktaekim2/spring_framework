package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
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
        System.out.println("BoardController.save");
        System.out.println("boardDTO = " + boardDTO);
        boolean saveResult = boardService.save(boardDTO);
        if (saveResult) {
            System.out.println("글작성성공");
            return "redirect:/board/findAll"; // 주소
        } else {
            System.out.println("글작성실패");
            return "/index"; // jsp
        }
    }

    @GetMapping("/findAll")
    public String findAll(Model model, HttpSession session) {
        List<BoardDTO> boardDTOList = boardService.findAll();
//        session.setAttribute("boardList", boardDTOList);
        model.addAttribute("boardList", boardDTOList);
        return "boardPages/list";
        //모델을 쓴 메서드의 리턴페이지까지만 데이터가 넘어감 계속 못씀씀
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "boardPages/detail";
    }

    @GetMapping("/passwordCheck")
    public String passwordCheck(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        // 이전에 담은 board는 model이였어서 사라짐. 다시 담아야 함. return페이지 까지만 효력 있음.
        return "boardPages/passwordCheck";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id, Model model) {
        System.out.println("BoardController.delete");
        boolean deleteResult = boardService.deleteById(id);
        if (deleteResult) {
            System.out.println("삭제성공");
            return "redirect:/board/findAll"; // 주소
        } else {
            System.out.println("삭제실패");
            return "/boardPages/?id=${board.id}"; // jsp
        }
    }

    @GetMapping("/update")
    public String update(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "/boardPages/update";
    }

    @PostMapping("/update")
    public String update (@ModelAttribute BoardDTO boardDTO) {
        boolean updateResult = boardService.update(boardDTO);
        if (updateResult) {
            System.out.println("글수정성공");
            return "redirect:/board/detail?id=" + boardDTO.getId(); // 주소
        } else {
            System.out.println("글작성실패");
            return "/index"; // jsp
        }
    }

    @GetMapping("/saveFile")
    public String saveFileForm() {
    return "boardPages/saveFile";
    }

    // 파일첨부 글작성 처리
    @PostMapping("/saveFile")
    public String saveFile(@ModelAttribute BoardDTO boardDTO) throws IOException { // 아몰랑 니가 알아서해
        boardService.saveFile(boardDTO);
        return "redirect:/board/findAll";
    }
}
