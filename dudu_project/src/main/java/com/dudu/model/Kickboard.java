package com.dudu.model;

import java.util.Date;

public class Kickboard {

    private String kickboardId;   // KICKBOARD_ID
    private String modelNm;       // MODEL_NM
    private String kickboardSt;   // KICKBOARD_ST
    private Date regDt;           // REG_DT

    public Kickboard() {}

    // 등록용 생성자
    public Kickboard(String kickboardId, String modelNm, String kickboardSt) {
        this.kickboardId = kickboardId;
        this.modelNm = modelNm;
        this.kickboardSt = kickboardSt;
    }

    public String getKickboardId() {
        return kickboardId;
    }
    public void setKickboardId(String kickboardId) {
        this.kickboardId = kickboardId;
    }

    public String getModelNm() {
        return modelNm;
    }
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }

    public String getKickboardSt() {
        return kickboardSt;
    }
    public void setKickboardSt(String kickboardSt) {
        this.kickboardSt = kickboardSt;
    }

    public Date getRegDt() {
        return regDt;
    }
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }
}