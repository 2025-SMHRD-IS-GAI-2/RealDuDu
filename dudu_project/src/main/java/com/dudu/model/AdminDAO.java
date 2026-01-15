package com.dudu.model;

import org.apache.ibatis.session.SqlSession;
import com.dudu.database.SqlSessionManager;

public class AdminDAO {

    // 관리자 회원가입
    public int join(Admin admin) {
        SqlSession session = SqlSessionManager.getSqlSession();
        int cnt = session.insert(
            "com.dudu.database.AdminMapper.join",
            admin
        );
        session.close();
        return cnt;
    }

    // 관리자 로그인
    public Admin login(Admin admin) {
        SqlSession session = SqlSessionManager.getSqlSession();
        Admin result = session.selectOne(
            "com.dudu.database.AdminMapper.login",
            admin
        );
        session.close();
        return result;
    }
}