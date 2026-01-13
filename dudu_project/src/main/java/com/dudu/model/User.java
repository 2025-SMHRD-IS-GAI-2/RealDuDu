package com.dudu.model;

import java.util.Date;

public class User {

    // ===== 기본 회원 정보 =====
    private String USER_ID;
    private String USER_PW;
    private String USER_NM;
    private String USER_TEL;

    // ===== 날짜 정보 =====
    private Date JOIN_DT;   // 가입일
    private Date LAST_DT;   // 마지막 로그인 일시

    // ===== 안전 관련 =====
    private int SAFETY_SCORE; // 안전 점수
    private int SAFETY_GR;    // 안전 등급
    private String BLACK_YN;  // 블랙 여부

    /* =========================
       생성자
       ========================= */

    // 기본 생성자 (MyBatis 필수)
    public User() {}

    // 회원가입용 생성자
    public User(String USER_ID, String USER_PW, String USER_NM, String USER_TEL) {
        this.USER_ID = USER_ID;
        this.USER_PW = USER_PW;
        this.USER_NM = USER_NM;
        this.USER_TEL = USER_TEL;
    }

    // 로그인용 생성자
    public User(String USER_ID, String USER_PW) {
        this.USER_ID = USER_ID;
        this.USER_PW = USER_PW;
    }

    /* =========================
       Getter / Setter
       ========================= */

    public String getUSER_ID() {
        return USER_ID;
    }

    public void setUSER_ID(String USER_ID) {
        this.USER_ID = USER_ID;
    }

    public String getUSER_PW() {
        return USER_PW;
    }

    public void setUSER_PW(String USER_PW) {
        this.USER_PW = USER_PW;
    }

    public String getUSER_NM() {
        return USER_NM;
    }

    public void setUSER_NM(String USER_NM) {
        this.USER_NM = USER_NM;
    }

    public String getUSER_TEL() {
        return USER_TEL;
    }

    public void setUSER_TEL(String USER_TEL) {
        this.USER_TEL = USER_TEL;
    }

    public Date getJOIN_DT() {
        return JOIN_DT;
    }

    public void setJOIN_DT(Date JOIN_DT) {
        this.JOIN_DT = JOIN_DT;
    }

    public Date getLAST_DT() {
        return LAST_DT;
    }

    public void setLAST_DT(Date LAST_DT) {
        this.LAST_DT = LAST_DT;
    }

    public int getSAFETY_SCORE() {
        return SAFETY_SCORE;
    }

    public void setSAFETY_SCORE(int SAFETY_SCORE) {
        this.SAFETY_SCORE = SAFETY_SCORE;
    }

    public int getSAFETY_GR() {
        return SAFETY_GR;
    }

    public void setSAFETY_GR(int SAFETY_GR) {
        this.SAFETY_GR = SAFETY_GR;
    }

    public String getBLACK_YN() {
        return BLACK_YN;
    }

    public void setBLACK_YN(String BLACK_YN) {
        this.BLACK_YN = BLACK_YN;
    }
}

