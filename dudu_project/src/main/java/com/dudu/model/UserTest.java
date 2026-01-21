package com.dudu.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserTest {
	private String user_pw;
	private String user_nm;
	private String user_tel;
	private String last_dt;
	private String join_dt;
	private String safety_score;
	private String safety_gr;
	private String black_yn;
}
