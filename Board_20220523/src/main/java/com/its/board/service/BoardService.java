package com.its.board.service;

import com.its.board.dto.BoardDTO;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;
    public boolean save(BoardDTO boardDTO) {
        int saveResult = boardRepository.save(boardDTO);
        System.out.println(saveResult);
        if (saveResult > 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    public BoardDTO findById(Long id) {
        return boardRepository.findById(id);
    }

//    public boolean delete(Long id) {
//        int deleteResult = boardRepository.delete(id);
//        if (deleteResult > 0) {
//            return true;
//        } else {
//            return false;
//        }
//    }

//    public boolean passwordCheck(String boardPassword) {
//        return boardRepository.passwordCheck(boardPassword);
//    }
}
