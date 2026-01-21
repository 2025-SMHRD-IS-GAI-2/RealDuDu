package com.dudu.controller;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class TestConnection {
    public static void main(String[] args) {
        try {
            // 1. 파이썬 서버 주소 (로컬호스트:8000)
            // 쿼리스트링(?kickboard_id=KICK_01)으로 데이터를 같이 보냅니다.
        	String urlStr = "http://192.168.219.176:8001/helmet-check?kickboard_id=DD010&user_id=USER001";
            URL url = new URL(urlStr);

            // 2. 연결 설정
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET"); // GET 방식으로 요청
            conn.setRequestProperty("Content-Type", "application/json");

            // 3. 응답 코드 확인 (200이면 성공)
            int responseCode = conn.getResponseCode();
            System.out.println("응답 코드: " + responseCode);

            // 4. 파이썬이 보낸 메시지 읽기
            if (responseCode == 200) {
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
                String inputLine;
                StringBuffer response = new StringBuffer();

                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();

                // 결과 출력
                System.out.println("파이썬의 응답: " + response.toString());
            } else {
                System.out.println("연결 실패 ㅠㅠ");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}