package com.dudu.model;

import java.util.Date;

public class Inquiry {
	// DB 컬럼명과 똑같이 필드명을 지어야 MyBatis가 자동으로 값을 넣어줍니다.
	private int CS_NO; // 글 번호
	private String USER_ID; // 작성자 ID
	private String CS_TITLE; // 제목
	private String CS_TYPE; // 카테고리 (제보, 에러 등)
	private String CS_CONT; // 문의 내용
	private String ANSWER_CONT; // 답변 내용 (null일 수 있음)
	private String PROC_ST; // 처리 상태 ('P':대기, 'R':완료 로 보임)
	private Date REG_DT; // 작성일

	// Getter & Setter (단축키 Alt+Shift+S -> R 로 자동생성 가능)
	public int getCS_NO() {
		return CS_NO;
	}

	public void setCS_NO(int cS_NO) {
		CS_NO = cS_NO;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getCS_TITLE() {
		return CS_TITLE;
	}

	public void setCS_TITLE(String cS_TITLE) {
		CS_TITLE = cS_TITLE;
	}

	public String getCS_TYPE() {
		return CS_TYPE;
	}

	public void setCS_TYPE(String cS_TYPE) {
		CS_TYPE = cS_TYPE;
	}

	public String getCS_CONT() {
		return CS_CONT;
	}

	public void setCS_CONT(String cS_CONT) {
		CS_CONT = cS_CONT;
	}

	public String getANSWER_CONT() {
		return ANSWER_CONT;
	}

	public void setANSWER_CONT(String aNSWER_CONT) {
		ANSWER_CONT = aNSWER_CONT;
	}

	public String getPROC_ST() {
		return PROC_ST;
	}

	public void setPROC_ST(String pROC_ST) {
		PROC_ST = pROC_ST;
	}

	public Date getREG_DT() {
		return REG_DT;
	}

	public void setREG_DT(Date rEG_DT) {
		REG_DT = rEG_DT;
	}
}