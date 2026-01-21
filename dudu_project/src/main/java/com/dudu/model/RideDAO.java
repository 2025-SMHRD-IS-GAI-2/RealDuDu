package com.dudu.model;

import org.apache.ibatis.session.SqlSession;
import com.dudu.database.SqlSessionManager;

public class RideDAO {

    // 이용 시작
    public int startRide(Ride ride) {
        SqlSession session = SqlSessionManager.getSqlSession();
        int result = session.insert("com.dudu.database.RideMapper.startRide", ride);
        session.commit();
        session.close();
        return result;
    }

    // 이용 종료 (Python 결과 반영)
    public int endRide(Ride ride) {
        SqlSession session = SqlSessionManager.getSqlSession();
        int result = session.update("com.dudu.database.RideMapper.endRide", ride);
        session.commit();
        session.close();
        return result;
    }
}
