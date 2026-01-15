package com.dudu.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.dudu.database.SqlSessionManager;

public class KickboardDAO {

    // 킥보드 등록
    public int insert(Kickboard kickboard) {

        SqlSession session = SqlSessionManager.getSqlSession();
        int cnt = session.insert(
            "com.dudu.database.KickboardMapper.insert",
            kickboard
        );
        session.close();
        return cnt;
    }

    // 킥보드 전체 조회
    public List<Kickboard> selectAll() {

        SqlSession session = SqlSessionManager.getSqlSession();
        List<Kickboard> list = session.selectList(
            "com.dudu.database.KickboardMapper.selectAll"
        );
        session.close();
        return list;
    }

    // 킥보드 상태 변경
    public int updateStatus(String kickboardId, String kickboardSt) {

        SqlSession session = SqlSessionManager.getSqlSession();

        Kickboard param = new Kickboard();
        param.setKickboardId(kickboardId);
        param.setKickboardSt(kickboardSt);

        int cnt = session.update(
            "com.dudu.database.KickboardMapper.updateStatus",
            param
        );
        session.close();
        return cnt;
    }
}
