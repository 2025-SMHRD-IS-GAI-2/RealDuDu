<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주변 킥보드 찾기 - 두두</title>
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
        .card {
            background: #243447;
            border-radius: 12px;
            padding: 30px 20px;
            margin-bottom: 20px;
        }
        h2 {
            font-size: 22px;
            font-weight: 600;
            color: #ffffff;
            margin-bottom: 15px;
            text-align: center;
        }
        .description {
            font-size: 14px;
            color: #95a5a6;
            text-align: center;
            margin-bottom: 20px;
        }
        .map-container {
            width: 100%;
            height: 400px;
            background: #2c3e50;
            border: 1px solid #3d5a80;
            border-radius: 8px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #7f8c8d;
            font-size: 14px;
            position: relative;
            overflow: hidden;
        }
        .map-placeholder {
            text-align: center;
            z-index: 1;
        }
        .map-marker {
            position: absolute;
            width: 30px;
            height: 30px;
            background: #4a9eff;
            border-radius: 50% 50% 50% 0;
            transform: rotate(-45deg);
            border: 2px solid #ffffff;
            top: 45%;
            left: 48%;
        }
        .map-marker::after {
            content: '';
            position: absolute;
            width: 10px;
            height: 10px;
            background: #ffffff;
            border-radius: 50%;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(45deg);
        }
        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }
        .action-btn {
            padding: 14px;
            background: #3d5a80;
            border: none;
            border-radius: 8px;
            color: #ffffff;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            display: block;
        }
        .action-btn:active {
            opacity: 0.8;
        }
        .action-btn.secondary {
            background: #5d6d7e;
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
            <div class="card">
                <h2>주변 킥보드 찾기</h2>
                <p class="description">현재 위치 기준으로 주변 킥보드를 표시합니다</p>
                
                <div class="map-container">
                    <div class="map-placeholder">
                        지도 영역<br>
                        <small>(추후 지도 API 연동 예정)</small>
                    </div>
                    <div class="map-marker"></div>
                </div>
                
                <div class="action-buttons">
                    <a href="ride_start.jsp" class="action-btn">선택한 킥보드로 주행 시작</a>
                    <button class="action-btn secondary" onclick="refreshLocation()">위치 새로고침</button>
                </div>
            </div>
            
            <div class="back-link">
                <a href="ride_start.jsp">← 주행 시작</a>
                <span style="color: #7f8c8d; margin: 0 10px;">|</span>
                <a href="index_login.jsp">메인으로</a>
            </div>
        </div>
    </div>
    
    <script>
        // Login check
        (function() {
            const referrer = document.referrer;
            if (!referrer.includes('index_login') && !referrer.includes('login')) {
                if (confirm('로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?')) {
                    window.location.href = 'login.jsp';
                } else {
                    window.location.href = 'index.jsp';
                }
            }
        })();
        
        function refreshLocation() {
            alert('위치를 새로고침했습니다.\n\n(데모 모드: 실제 위치 서비스는 구현되지 않았습니다.)');
        }
    </script>
</body>
</html>
