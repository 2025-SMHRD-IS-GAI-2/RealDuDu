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
        .auth-section {
            background: #243447;
            border-radius: 12px;
            padding: 30px 20px;
            margin-bottom: 30px;
            text-align: center;
        }
        .auth-section h2 {
            font-size: 18px;
            font-weight: 500;
            margin-bottom: 20px;
            color: #ffffff;
        }
        .auth-buttons {
            display: flex;
            gap: 10px;
        }
        .btn {
            flex: 1;
            padding: 14px 20px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            transition: opacity 0.2s;
        }
        .btn:active {
            opacity: 0.8;
        }
        .btn-primary {
            background: #3d5a80;
            color: #ffffff;
        }
        .btn-secondary {
            background: #4a6fa5;
            color: #ffffff;
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
            transition: background 0.2s;
        }
        .service-btn:active {
            background: #34495e;
        }
        .service-btn.disabled {
            opacity: 0.6;
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
            <div class="auth-section">
                <h2>로그인이 필요합니다</h2>
                <div class="auth-buttons">
                    <a href="login.jsp" class="btn btn-primary">로그인</a>
                    <a href="join.jsp" class="btn btn-secondary">회원가입</a>
                </div>
            </div>
            
            <div class="service-section">
                <button class="service-btn disabled" id="startRide">주행 시작</button>
                <button class="service-btn disabled" id="findKickboard">주변 킥보드 찾기</button>
                <button class="service-btn disabled" id="customerService">고객센터</button>
            </div>
        </div>
        
        <footer>
            <p>두두 공공 킥보드 서비스</p>
        </footer>
    </div>
    
    <script>
        document.querySelectorAll('.service-btn.disabled').forEach(btn => {
            btn.addEventListener('click', function(e) {
                e.preventDefault();
                alert('로그인이 필요합니다');
            });
        });
    </script>
</body>
</html>
