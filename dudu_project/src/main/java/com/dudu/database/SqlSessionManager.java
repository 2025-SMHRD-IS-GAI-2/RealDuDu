package com.dudu.database;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {

    private static SqlSessionFactory sqlSessionFactory;

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

            sqlSessionFactory =
                new SqlSessionFactoryBuilder().build(is);

            System.out.println("🎉 SqlSessionFactory CREATED");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static SqlSession getSqlSession() {
        return sqlSessionFactory.openSession(true); // auto commit
    }

	public static SqlSessionFactory getSqlSessionFactory() {
		// TODO Auto-generated method stub
		return null;
	}
}