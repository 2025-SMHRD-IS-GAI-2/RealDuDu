<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주행 기록 - 두두</title>
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
            padding: 20px;
            margin-bottom: 15px;
        }
        .ride-item {
            border-bottom: 1px solid #34495e;
            padding: 15px 0;
            cursor: pointer;
        }
        .ride-item:last-child {
            border-bottom: none;
        }
        .ride-item:active {
            opacity: 0.8;
        }
        .ride-date {
            font-size: 14px;
            color: #95a5a6;
            margin-bottom: 8px;
        }
        .ride-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }
        .ride-distance {
            font-size: 16px;
            color: #e8e8e8;
            font-weight: 500;
        }
        .ride-status {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .status-badge {
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 500;
        }
        .badge-helmet {
            background: #27ae60;
            color: #ffffff;
        }
        .badge-no-helmet {
            background: #e74c3c;
            color: #ffffff;
        }
        .badge-warning {
            background: #f39c12;
            color: #ffffff;
        }
        .safety-score {
            font-size: 14px;
            color: #7f8c8d;
        }
        .score-positive {
            color: #27ae60;
        }
        .score-negative {
            color: #e74c3c;
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
        .empty-state {
            text-align: center;
            padding: 40px 20px;
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
            <h2 class="page-title">주행 기록</h2>
            
            <div class="card">
                <div class="ride-item" onclick="location.href='ride-log-detail.jsp?rideId=1'">
                    <div class="ride-date">2026.01.15 09:30 - 10:15</div>
                    <div class="ride-info">
                        <span class="ride-distance">1.2 km</span>
                        <div class="ride-status">
                            <span class="status-badge badge-helmet">헬멧 착용</span>
                            <span class="safety-score score-positive">+15점</span>
                        </div>
                    </div>
                </div>
                
                <div class="ride-item" onclick="location.href='ride-log-detail.jsp?rideId=2'">
                    <div class="ride-date">2026.01.13 14:20 - 14:45</div>
                    <div class="ride-info">
                        <span class="ride-distance">0.8 km</span>
                        <div class="ride-status">
                            <span class="status-badge badge-no-helmet">헬멧 미착용</span>
                            <span class="safety-score score-negative">-5점</span>
                        </div>
                    </div>
                </div>
                
                <div class="ride-item" onclick="location.href='ride-log-detail.jsp?rideId=3'">
                    <div class="ride-date">2026.01.10 11:00 - 11:25</div>
                    <div class="ride-info">
                        <span class="ride-distance">1.5 km</span>
                        <div class="ride-status">
                            <span class="status-badge badge-helmet">헬멧 착용</span>
                            <span class="status-badge badge-warning">경고 1회</span>
                            <span class="safety-score score-positive">+8점</span>
                        </div>
                    </div>
                </div>
                
                <div class="ride-item" onclick="location.href='ride-log-detail.jsp?rideId=4'">
                    <div class="ride-date">2026.01.08 16:30 - 16:50</div>
                    <div class="ride-info">
                        <span class="ride-distance">0.9 km</span>
                        <div class="ride-status">
                            <span class="status-badge badge-helmet">헬멧 착용</span>
                            <span class="safety-score score-positive">+12점</span>
                        </div>
                    </div>
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
        })();
    </script>
</body>
</html>
