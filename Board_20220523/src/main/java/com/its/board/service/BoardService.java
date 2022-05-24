package com.its.board.service;

import com.its.board.dto.BoardDTO;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
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
        // 1.조회수 증가, 2.상세정보 가져오기
        boardRepository.updateHits(id);
        return boardRepository.findById(id);
    }

    public boolean deleteById(Long id) {
        int deleteResult = boardRepository.deleteById(id);
        if (deleteResult > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean update(BoardDTO boardDTO) {
        int updateResult = boardRepository.update(boardDTO);
        if (updateResult > 0) {
            return true;
        } else {
            return false;
        }
    }

    public void saveFile(BoardDTO boardDTO) throws IOException { // 아몰랑 니가 알아서해
        /**
         * 1. DTO 객체에 담긴 파일을 꺼냄.
         * 2. 파일의 이름을 가져옴.
         * 2.1. 파일 이름 중복을 피하기 위한 조치
         * 3. 파일 이름을 DTO 객체의 boardFileName에 저장
         * 4. 파일의 저장 위치 지정.
         * 5. 파일 저장처리
         * 6. DTO 객체 repository로 전달
         */
        MultipartFile boardFile = boardDTO.getBoardFile(); // 1.
        String boardFileName = boardFile.getOriginalFilename(); // 2.
        boardFileName = System.currentTimeMillis() + "-" + boardFileName; // 2.1.
        boardDTO.setBoardFileName(boardFileName); // 3.
        String savePath = "D:\\spring_img\\" + boardFileName; // 4.
        if (!boardFile.isEmpty()) {
            boardFile.transferTo(new File(savePath));
        } // 5.
        boardRepository.saveFile(boardDTO); //6.
    }
}
