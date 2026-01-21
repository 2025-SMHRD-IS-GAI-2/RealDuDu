package com.dudu.database;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {

    // 1. 공용으로 사용할 Factory 객체 선언
    public static SqlSessionFactory sqlSessionFactory;

    // 2. 초기화 블록 (서버 켜질 때 딱 한 번 실행됨)
    static {
        String resource = "com/dudu/database/mybatis-config.xml";
        try {
            System.out.println("▶ MyBatis config try load: " + resource);
            InputStream is = Resources.getResourceAsStream(resource);

            if (is == null) {
                System.out.println("❌ mybatis-config.xml NOT FOUND");
            } else {
                System.out.println("✅ mybatis-config.xml FOUND");
            }

            // Factory 생성
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);

            System.out.println("🎉 SqlSessionFactory CREATED");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 3. [메서드 1] 기본 세션 열기 (수동 커밋) - 일반 조회용
    public static SqlSession getSqlSession() {
        return sqlSessionFactory.openSession();
    }

    // 4. [메서드 2] 자동 커밋 설정 가능 (boolean 인자) - 블랙리스트 업데이트용
    // 이 메서드가 있어야 AdminDAO의 getSqlSession(true) 오류가 사라집니다.
    public static SqlSession getSqlSession(boolean autoCommit) {
        return sqlSessionFactory.openSession(autoCommit);
    }
}