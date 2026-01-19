<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 - 두두</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background: #1a2332;
            color: #e8e8e8;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .container {
            max-width: 480px;
            margin: 0 auto;
            padding: 20px;
            width: 100%;
            flex: 1;
        }
        header {
            text-align: center;
            padding: 20px 0;
        }
        .logo {
            max-width: 100px;
            height: auto;
        }
        .main-content {
            padding: 30px 0;
        }
        .page-title {
            font-size: 22px;
            font-weight: 600;
            color: #ffffff;
            margin-bottom: 20px;
            text-align: center;
        }
        .card {
            background: #243447;
            border-radius: 12px;
            padding: 25px 20px;
            margin-bottom: 15px;
        }
        .info-row {
            display: flex;
            justify-content: space-between;
            padding: 12px 0;
            border-bottom: 1px solid #34495e;
        }
        .info-row:last-child {
            border-bottom: none;
        }
        .info-label {
            font-size: 14px;
            color: #95a5a6;
        }
        .info-value {
            font-size: 16px;
            color: #e8e8e8;
            font-weight: 500;
            text-align: right;
        }
        .safety-grade {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 500;
            background: #3d5a80;
            color: #ffffff;
        }
        .note {
            margin-top: 20px;
            padding: 15px;
            background: #2c3e50;
            border-radius: 8px;
            font-size: 12px;
            color: #7f8c8d;
            line-height: 1.6;
        }
        .back-link {
            text-align: center;
            margin-top: 20px;
        }
        .back-link a {
            color: #4a9eff;
            text-decoration: none;
            font-size: 14px;
        }
        .back-link a:active {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <img src="img/fr-removebg-preview.png" alt="두두 로고" class="logo">
        </header>
        
        <div class="main-content">
            <h2 class="page-title">내 정보</h2>
            
            <div class="card" style="cursor: pointer;" onclick="location.href='user-detail.jsp'">
                <div class="info-row">
                    <span class="info-label">이름</span>
                    <span class="info-value" id="userName">사용자</span>
                </div>
                <div class="info-row">
                    <span class="info-label">아이디</span>
                    <span class="info-value" id="userId">user001</span>
                </div>
                <div class="info-row">
                    <span class="info-label">전화번호</span>
                    <span class="info-value" id="userTel">010-****-****</span>
                </div>
                <div class="info-row">
                    <span class="info-label">가입일</span>
                    <span class="info-value" id="joinDate">2026.01.01</span>
                </div>
                <div style="text-align: center; margin-top: 15px; font-size: 12px; color: #4a9eff;">
                    상세 정보 보기 →
                </div>
            </div>
            
            <div class="card">
                <div class="info-row">
                    <span class="info-label">안전 등급</span>
                    <span class="info-value">
                        <span class="safety-grade" id="safetyGrade">2등급</span>
                    </span>
                </div>
                <div class="info-row">
                    <span class="info-label">안전 점수</span>
                    <span class="info-value" id="safetyScore">85점</span>
                </div>
                <div class="info-row">
                    <span class="info-label">총 주행 횟수</span>
                    <span class="info-value" id="totalRides">12회</span>
                </div>
                <div class="info-row">
                    <span class="info-label">최근 주행</span>
                    <span class="info-value" id="lastRide">2026.01.15</span>
                </div>
            </div>
            
            <div class="card">
                <div class="note">
                    안전 등급과 점수는 서버에서 자동으로 계산됩니다.<br>
                    주행 기록, 헬멧 착용률, 경고 횟수 등을 종합하여 산출됩니다.
                </div>
            </div>
            
            <div class="back-link">
                <a href="index_login.jsp">← 메인으로</a>
            </div>
        </div>
    </div>
    
    <script>
        (function() {
            const referrer = document.referrer;
            if (!referrer.includes('index_login') && !referrer.includes('login')) {
                if (confirm('로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?')) {
                    window.location.href = 'login.jsp';
                } else {
                    window.location.href = 'index.jsp';
                }
            }
            
            // In production, fetch user data from backend
            // This is read-only display
        })();
    </script>
</body>
</html>
