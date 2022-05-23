package com.its.board.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardDTO {
    private Long id;
    private String boardTitle;
    private String boardWriter;
    private String boardPassword;
    private String boardContents;
    private int boardHits;
    private Timestamp boardCreatedDate;
}
