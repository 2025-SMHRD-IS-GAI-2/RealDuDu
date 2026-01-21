package com.dudu.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dudu.database.SqlSessionManager;

public class CSInquiryDAO {

    // 1️⃣ 사용자 문의 등록
    public int insert(CSInquiry inquiry) {
        SqlSession session = SqlSessionManager.getSqlSession();
        int result = session.insert(
                "com.dudu.database.CSInquiryMapper.insert",
                inquiry
        );
        session.close();
        return result;
    }

    // 2️⃣ 관리자 전체 문의 목록 조회
    public List<CSInquiry> selectAll() {
        SqlSession session = SqlSessionManager.getSqlSession();
        List<CSInquiry> list = session.selectList(
                "com.dudu.database.CSInquiryMapper.selectAll"
        );
        session.close();
        return list;
    }

    // 3️⃣ 관리자 답변 등록 + 상태 변경
    public int updateAnswer(CSInquiry inquiry) {
        SqlSession session = SqlSessionManager.getSqlSession();
        int result = session.update(
                "com.dudu.database.CSInquiryMapper.updateAnswer",
                inquiry
        );
        session.close();
        return result;
    }
}
