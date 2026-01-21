package com.dudu.model;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

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
    
    public List<User> selectAllMember() { 
        SqlSession session = SqlSessionManager.getSqlSession();
        List<User> list = null; 
        
        try {
            // 형변환 없이 바로 대입 (MyBatis가 알아서 리스트를 만들어줍니다)
            list = session.selectList("com.dudu.database.AdminMapper.selectAllMember");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
    
    public User selectOneMember(String userId) {
    	SqlSession session = SqlSessionManager.getSqlSession();
    	User user = null;
    	try {
    		user = session.selectOne("com.dudu.database.UserMapper.selectById", userId);
    	}catch(Exception e){
    		e.printStackTrace();
    	}finally {
    		session.close();
    	}
    	return user;
    }
    
    public int updateBlacklist(String userId, String blackYn) {
        SqlSession session = SqlSessionManager.getSqlSession(true); 
        int result = 0;
        try {
            Map<String, String> map = new HashMap<>();
            map.put("userId", userId);
            map.put("blackYn", blackYn);
            
            // 매퍼 호출 (네임스페이스와 ID를 다시 한번 확인하세요)
            result = session.update("com.dudu.database.UserMapper.updateBlacklist", map);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }
    
 // 문의글 상세 조회 메서드 (JSP에서 호출하는 부분)
    public Inquiry selectInquiryDetail(int idx) {
        SqlSession session = SqlSessionManager.getSqlSession();
        Inquiry inq = null;
        try {
            // AdminMapper.xml에 작성한 ID("selectInquiryDetail")와 정확히 일치해야 합니다.
            inq = session.selectOne("com.dudu.database.AdminMapper.selectInquiryDetail", idx);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return inq;
    }
    
    
 // 문의 답변 등록 메서드
    public int updateInquiryAnswer(int id, String answer) {
        // 자동 커밋(true) 모드로 엽니다.
        SqlSession session = SqlSessionManager.getSqlSession(true);
        int result = 0;
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("id", id);
            map.put("answer", answer);
            
            result = session.update("com.dudu.database.AdminMapper.updateInquiryAnswer", map);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }
    
    
    
}