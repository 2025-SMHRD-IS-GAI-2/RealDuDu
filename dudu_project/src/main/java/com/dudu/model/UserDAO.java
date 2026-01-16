package com.dudu.model;

import org.apache.ibatis.session.SqlSession;
import com.dudu.database.SqlSessionManager;

public class UserDAO {

    // 회원가입
    public int join(User user) {

        SqlSession session = SqlSessionManager.getSqlSession();
        int cnt = session.insert(
            "com.dudu.database.UserMapper.join", user
        );
        session.close();

        return cnt;
    }

    // 로그인
    public User login(String userId, String userPw) {

        SqlSession session = SqlSessionManager.getSqlSession();

        User param = new User();
        param.setUSER_ID(userId);
        param.setUSER_PW(userPw);

        User user = session.selectOne(
            "com.dudu.database.UserMapper.login",
            param
        );

        session.close();
        return user;
    }

    // ✅ 회원정보 조회 (추가)
    public User selectById(String userId) {

        SqlSession session = SqlSessionManager.getSqlSession();
        User user = session.selectOne(
            "com.dudu.database.UserMapper.selectById",
            userId
        );
        session.close();

        return user;
    }
    
    public int updateUser(User user) {

        SqlSession session = SqlSessionManager.getSqlSession();

        int cnt = session.update(
            "com.dudu.database.UserMapper.updateUser", user
        );

        session.close();
        return cnt;
    }
}
                                                      