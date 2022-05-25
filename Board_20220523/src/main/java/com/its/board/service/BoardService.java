package com.its.board.service;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.PageDTO;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    private static final int PAGE_LIMIT = 3; // 한 페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 3;

    /**
     * 요청한 페이지에 해당하는 글 목록을 db에서 가져오는 역할
     */
    public List<BoardDTO> pagingList(int page) {
        // 1페이지 요청 =>
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>(); // key: String, value: Int
        pagingParam.put("start", pagingStart); // mapper에서 쓰임
        pagingParam.put("limit", PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParam);
        return pagingList;
    }

    public PageDTO paging(int page) {
        int boardCount = boardRepository.boardCount(); // 글 갯수 조회
        // maxPage: 필요한 전체 페이지 갯수
        // 글갯수: 10, 페이지당 글갯수: 3 10/3 = 3.3333 =>올림 4
        // Math.ceil: 올림처리
        // 나눗셈 결과가 실수여야 하므로 double로 형변환해서 계산 후 다시 int로 형변환
        int maxPage = (int)(Math.ceil((double)boardCount / PAGE_LIMIT));
        // 시작페이지 1 4 7 10
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        // 끝 페이지 3 6 9 12
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage) // if문 실행 블록이 한 줄이면 중괄호 생략 가능
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }
}
