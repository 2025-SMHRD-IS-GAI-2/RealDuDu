package com.dudu.model;

import org.apache.ibatis.session.SqlSession;
import com.dudu.database.SqlSessionManager;

public class UserDAO {

    public int join(User user) {
    
        SqlSession session = SqlSessionManager.getSqlSession();
        int cnt = session.insert(
            "com.dudu.database.UserMapper.join", user
        );
        session.close();

        return cnt;
    }
    
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
}                                                        