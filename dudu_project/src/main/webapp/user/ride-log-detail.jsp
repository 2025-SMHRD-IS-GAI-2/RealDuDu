<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주행 상세 - 두두</title>
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
        .status-badge {
            display: inline-block;
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
        .score-positive {
            color: #27ae60;
        }
        .score-negative {
            color: #e74c3c;
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
            <h2 class="page-title">주행 상세 정보</h2>
            
            <div class="card">
                <div class="info-row">
                    <span class="info-label">주행 날짜</span>
                    <span class="info-value" id="rideDate">2026.01.15</span>
                </div>
                <div class="info-row">
                    <span class="info-label">시작 시간</span>
                    <span class="info-value" id="startTime">09:30</span>
                </div>
                <div class="info-row">
                    <span class="info-label">종료 시간</span>
                    <span class="info-value" id="endTime">10:15</span>
                </div>
                <div class="info-row">
                    <span class="info-label">주행 거리</span>
                    <span class="info-value" id="distance">1.2 km</span>
                </div>
                <div class="info-row">
                    <span class="info-label">헬멧 착용</span>
                    <span class="info-value" id="helmetStatus">
                        <span class="status-badge badge-helmet">착용</span>
                    </span>
                </div>
                <div class="info-row">
                    <span class="info-label">안전 점수 변화</span>
                    <span class="info-value score-positive" id="scoreChange">+15점</span>
                </div>
                <div class="info-row">
                    <span class="info-label">경고 횟수</span>
                    <span class="info-value" id="warningCount">0회</span>
                </div>
            </div>
            
            <div class="card">
                <div class="note">
                    안전 점수는 서버에서 자동으로 계산됩니다.<br>
                    헬멧 착용, 주행 패턴, 경고 횟수 등을 종합하여 산출됩니다.
                </div>
            </div>
            
            <div class="back-link">
                <a href="ride-log-list.jsp">← 목록으로</a>
            </div>
        </div>
    </div>
    
    <script>
        (function() {
            const referrer = document.referrer;
            if (!referrer.includes('ride-log') && !referrer.includes('index_login') && !referrer.includes('login')) {
                if (confirm('로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?')) {
                    window.location.href = 'login.jsp';
                } else {
                    window.location.href = 'index.jsp';
                }
            }
            
            // Get rideId from URL and update display (demo data)
            const urlParams = new URLSearchParams(window.location.search);
            const rideId = urlParams.get('rideId');
            
            // In production, fetch from backend
            const rideData = {
                '1': {
                    date: '2026.01.15',
                    startTime: '09:30',
                    endTime: '10:15',
                    distance: '1.2 km',
                    helmet: true,
                    score: '+15점',
                    warnings: 0
                },
                '2': {
                    date: '2026.01.13',
                    startTime: '14:20',
                    endTime: '14:45',
                    distance: '0.8 km',
                    helmet: false,
                    score: '-5점',
                    warnings: 0
                },
                '3': {
                    date: '2026.01.10',
                    startTime: '11:00',
                    endTime: '11:25',
                    distance: '1.5 km',
                    helmet: true,
                    score: '+8점',
                    warnings: 1
                },
                '4': {
                    date: '2026.01.08',
                    startTime: '16:30',
                    endTime: '16:50',
                    distance: '0.9 km',
                    helmet: true,
                    score: '+12점',
                    warnings: 0
                }
            };
            
            const data = rideData[rideId] || rideData['1'];
            if (data) {
                document.getElementById('rideDate').textContent = data.date;
                document.getElementById('startTime').textContent = data.startTime;
                document.getElementById('endTime').textContent = data.endTime;
                document.getElementById('distance').textContent = data.distance;
                document.getElementById('helmetStatus').innerHTML = data.helmet 
                    ? '<span class="status-badge badge-helmet">착용</span>'
                    : '<span class="status-badge badge-no-helmet">미착용</span>';
                document.getElementById('scoreChange').textContent = data.score;
                document.getElementById('scoreChange').className = 'info-value ' + (data.score.startsWith('+') ? 'score-positive' : 'score-negative');
                document.getElementById('warningCount').textContent = data.warnings + '회';
            }
        })();
    </script>
</body>
</html>
