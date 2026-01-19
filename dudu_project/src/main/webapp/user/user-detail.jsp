<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 상세 - 두두</title>
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
        .card-title {
            font-size: 16px;
            font-weight: 600;
            color: #ffffff;
            margin-bottom: 15px;
        }
        .info-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
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
            font-size: 14px;
            color: #e8e8e8;
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
            margin-top: 15px;
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
            <h2 class="page-title">내 정보 상세</h2>
            
            <div class="card">
                <div class="card-title">기본 정보</div>
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
                    <span class="info-value" id="userTel">010-1234-5678</span>
                </div>
                <div class="info-row">
                    <span class="info-label">가입일</span>
                    <span class="info-value" id="joinDate">2026.01.01</span>
                </div>
            </div>
            
            <div class="card">
                <div class="card-title">안전 정보</div>
                <div class="info-row">
                    <span class="info-label">안전 등급</span>
                    <span class="info-value">
                        <span class="safety-grade" id="safetyGrade">2등급</span>
                    </span>
                </div>
                <div class="info-row">
                    <span class="info-label">현재 안전 점수</span>
                    <span class="info-value" id="safetyScore">85점</span>
                </div>
                <div class="info-row">
                    <span class="info-label">총 주행 횟수</span>
                    <span class="info-value" id="totalRides">12회</span>
                </div>
                <div class="info-row">
                    <span class="info-label">헬멧 착용률</span>
                    <span class="info-value" id="helmetRate">83%</span>
                </div>
                <div class="info-row">
                    <span class="info-label">경고 누적 횟수</span>
                    <span class="info-value" id="totalWarnings">2회</span>
                </div>
                <div class="info-row">
                    <span class="info-label">최근 주행일</span>
                    <span class="info-value" id="lastRide">2026.01.15</span>
                </div>
            </div>
            
            <div class="card">
                <div class="note">
                    모든 정보는 서버에서 관리됩니다.<br>
                    안전 등급과 점수는 주행 기록을 기반으로 자동 계산됩니다.<br>
                    정보 수정이 필요한 경우 고객센터로 문의해주세요.
                </div>
            </div>
            
            <div class="back-link">
                <a href="user-status.jsp">← 목록으로</a>
            </div>
        </div>
    </div>
    
    <script>
        (function() {
            const referrer = document.referrer;
            if (!referrer.includes('user-status') && !referrer.includes('index_login') && !referrer.includes('login')) {
                if (confirm('로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?')) {
                    window.location.href = 'login.jsp';
                } else {
                    window.location.href = 'index.jsp';
                }
            }
            
            // In production, fetch user detail from backend
            // This is read-only display
        })();
    </script>
</body>
</html>
