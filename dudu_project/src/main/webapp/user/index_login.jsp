<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>두두 - 공공 킥보드 서비스</title>
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
            padding: 30px 0;
        }
        .logo {
            max-width: 120px;
            height: auto;
        }
        .main-content {
            padding: 40px 0;
        }
        .welcome-section {
            background: #243447;
            border-radius: 12px;
            padding: 30px 20px;
            margin-bottom: 30px;
            text-align: center;
        }
        .welcome-section h2 {
            font-size: 18px;
            font-weight: 500;
            margin-bottom: 20px;
            color: #ffffff;
        }
        .welcome-section .user-name {
            font-size: 20px;
            font-weight: 600;
            color: #4a9eff;
            margin-bottom: 15px;
        }
        .logout-btn {
            background: #5d6d7e;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .logout-btn:active {
            opacity: 0.8;
        }
        .service-section {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        .service-btn {
            background: #2c3e50;
            border: 1px solid #3d5a80;
            border-radius: 10px;
            padding: 20px;
            color: #e8e8e8;
            font-size: 16px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: block;
            transition: background 0.2s;
        }
        .service-btn:active {
            background: #34495e;
        }
        footer {
            text-align: center;
            padding: 20px;
            font-size: 12px;
            color: #7f8c8d;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <img src="img/fr-removebg-preview.png" alt="두두 로고" class="logo">
        </header>
        
        <div class="main-content">
            <div class="welcome-section">
                <h2>환영합니다</h2>
                <div class="user-name" id="userName">사용자</div>
                <a href="index.jsp" class="logout-btn">로그아웃</a>
            </div>
            
            <div class="service-section">
                <a href="ride_start.jsp" class="service-btn">주행 시작</a>
                <a href="kickboard_map.jsp" class="service-btn">주변 킥보드 찾기</a>
                <a href="ride-log-list.jsp" class="service-btn">주행 기록</a>
                <a href="user-status.jsp" class="service-btn">내 정보</a>
                <a href="cs_inquiry.jsp" class="service-btn">고객센터</a>
            </div>
        </div>
        
        <footer>
            <p>두두 공공 킥보드 서비스</p>
        </footer>
    </div>
    
    <script>
        // Get user name from URL or session (for demo, using default)
        const urlParams = new URLSearchParams(window.location.search);
        const userName = urlParams.get('userName') || '사용자';
        document.getElementById('userName').textContent = userName + ' 님';
    </script>
</body>
</html>
