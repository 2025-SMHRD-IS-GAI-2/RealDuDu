<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주행 시작 - 두두</title>
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
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-size: 14px;
            color: #bdc3c7;
            margin-bottom: 8px;
            font-weight: 500;
        }
        input[type="text"] {
            width: 100%;
            padding: 14px;
            background: #2c3e50;
            border: 1px solid #3d5a80;
            border-radius: 8px;
            color: #e8e8e8;
            font-size: 16px;
        }
        input[type="text"]:focus {
            outline: none;
            border-color: #4a9eff;
        }
        input::placeholder {
            color: #7f8c8d;
        }
        .qr-section {
            text-align: center;
            margin: 30px 0;
        }
        .qr-placeholder {
            width: 200px;
            height: 200px;
            background: #2c3e50;
            border: 2px dashed #3d5a80;
            border-radius: 8px;
            margin: 0 auto 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #7f8c8d;
            font-size: 14px;
        }
        .submit-btn {
            width: 100%;
            padding: 16px;
            background: #3d5a80;
            border: none;
            border-radius: 8px;
            color: #ffffff;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            margin-top: 10px;
        }
        .submit-btn:active {
            opacity: 0.8;
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
                <h2>주행 시작</h2>
                <p class="description">킥보드 코드를 입력하거나 QR 코드를 스캔하세요</p>
                
                <form action="#" method="post" id="rideStartForm">
                    <div class="form-group">
                        <label for="kickboardCode">킥보드 코드</label>
                        <input type="text" id="kickboardCode" name="kickboardCode" placeholder="킥보드 코드를 입력하세요" required>
                    </div>
                    
                    <div class="qr-section">
                        <div class="qr-placeholder">QR 코드 스캔 영역</div>
                        <p style="font-size: 12px; color: #7f8c8d;">QR 코드를 카메라에 비춰주세요</p>
                    </div>
                    
                    <button type="submit" class="submit-btn">주행 시작</button>
                </form>
            </div>
            
            <div class="back-link">
                <a href="kickboard_map.jsp">← 지도로</a>
                <span style="color: #7f8c8d; margin: 0 10px;">|</span>
                <a href="index_login.jsp">메인으로</a>
            </div>
        </div>
    </div>
    
    <script>
        // Login check
        (function() {
            // In production, check session/loginUser
            // For demo: assume logged in if coming from index_login.jsp
            const referrer = document.referrer;
            if (!referrer.includes('index_login') && !referrer.includes('login')) {
                if (confirm('로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?')) {
                    window.location.href = 'login.jsp';
                } else {
                    window.location.href = 'index.jsp';
                }
            }
        })();
        
        document.getElementById('rideStartForm').addEventListener('submit', function(e) {
            e.preventDefault();
            // Form submission handled by backend servlet
            // This is UI-only implementation
            if (confirm('주행을 시작하시겠습니까?')) {
                alert('주행이 시작되었습니다.\n\n주행 종료 후 기록에서 확인할 수 있습니다.');
                // In production: redirect to active ride page or return to main
                setTimeout(function() {
                    window.location.href = 'index_login.jsp';
                }, 1500);
            }
        });
    </script>
</body>
</html>
