package com.dudu.model;

import java.util.Date;

public class CSInquiry {

    // ===== 컬럼 =====
    private int csNo;              // 문의번호 (PK)
    private String userId;          // 사용자 ID (FK)
    private String csTitle;         // 문의 제목
    private String csType;          // 문의 유형
    private String csCont;          // 문의 내용
    private String answerCont;      // 답변 내용
    private String procSt;           // 처리 상태
    private Date regDt;              // 등록일

    // ===== 기본 생성자 (MyBatis 필수) =====
    public CSInquiry() {}

    // ===== 사용자 문의 등록용 생성자 =====
    public CSInquiry(String userId, String csTitle, String csType, String csCont) {
        this.userId = userId;
        this.csTitle = csTitle;
        this.csType = csType;
        this.csCont = csCont;
    }

    // ===== 관리자 답변 등록용 생성자 =====
    public CSInquiry(int csNo, String answerCont, String procSt) {
        this.csNo = csNo;
        this.answerCont = answerCont;
        this.procSt = procSt;
    }

    // ===== Getter / Setter =====
    public int getCsNo() {
        return csNo;
    }

    public void setCsNo(int csNo) {
        this.csNo = csNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCsTitle() {
        return csTitle;
    }

    public void setCsTitle(String csTitle) {
        this.csTitle = csTitle;
    }

    public String getCsType() {
        return csType;
    }

    public void setCsType(String csType) {
        this.csType = csType;
    }

    public String getCsCont() {
        return csCont;
    }

    public void setCsCont(String csCont) {
        this.csCont = csCont;
    }

    public String getAnswerCont() {
        return answerCont;
    }

    public void setAnswerCont(String answerCont) {
        this.answerCont = answerCont;
    }

    public String getProcSt() {
        return procSt;
    }

    public void setProcSt(String procSt) {
        this.procSt = procSt;
    }

    public Date getRegDt() {
        return regDt;
    }

    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
}
