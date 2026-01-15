package com.dudu.model;

import java.util.Date;

public class Admin {

    private String adminId;
    private String adminPw;
    private String adminNm;
    private Date regDt;

    public Admin() {}

    // 회원가입용
    public Admin(String adminId, String adminPw, String adminNm) {
        this.adminId = adminId;
        this.adminPw = adminPw;
        this.adminNm = adminNm;
    }

    // 로그인용 (권장)
    public Admin(String adminId, String adminPw) {
        this.adminId = adminId;
        this.adminPw = adminPw;
    }

    public String getAdminId() {
        return adminId;
    }
    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getAdminPw() {
        return adminPw;
    }
    public void setAdminPw(String adminPw) {
        this.adminPw = adminPw;
    }

    public String getAdminNm() {
        return adminNm;
    }
    public void setAdminNm(String adminNm) {
        this.adminNm = adminNm;
    }

    public Date getRegDt() {
        return regDt;
    }
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
}