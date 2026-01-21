package com.dudu.model;

import java.util.Date;

public class Ride {

    private String rideId;
    private String userId;
    private String kickboardId;
    private Date startDt;
    private Date endDt;
    private Date helmetTm;
    private int scoreCg;
    private String rideSt;

    // 기본 생성자 (MyBatis 필수)
    public Ride() {}

    // 이용 시작용 생성자
    public Ride(String rideId, String userId, String kickboardId, String rideSt) {
        this.rideId = rideId;
        this.userId = userId;
        this.kickboardId = kickboardId;
        this.rideSt = rideSt;
    }

    // getter / setter
    public String getRideId() { return rideId; }
    public void setRideId(String rideId) { this.rideId = rideId; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getKickboardId() { return kickboardId; }
    public void setKickboardId(String kickboardId) { this.kickboardId = kickboardId; }

    public Date getStartDt() { return startDt; }
    public void setStartDt(Date startDt) { this.startDt = startDt; }

    public Date getEndDt() { return endDt; }
    public void setEndDt(Date endDt) { this.endDt = endDt; }

    public Date getHelmetTm() { return helmetTm; }
    public void setHelmetTm(Date helmetTm) { this.helmetTm = helmetTm; }

    public int getScoreCg() { return scoreCg; }
    public void setScoreCg(int scoreCg) { this.scoreCg = scoreCg; }

    public String getRideSt() { return rideSt; }
    public void setRideSt(String rideSt) { this.rideSt = rideSt; }
}
