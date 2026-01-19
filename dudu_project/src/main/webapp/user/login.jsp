<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 로그인 - 두두</title>
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
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .container {
            max-width: 400px;
            width: 100%;
            background: #243447;
            border-radius: 12px;
            padding: 40px 30px;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .logo {
            max-width: 100px;
            height: auto;
            margin-bottom: 20px;
        }
        h1 {
            font-size: 24px;
            font-weight: 600;
            color: #ffffff;
            margin-bottom: 10px;
        }
        .subtitle {
            font-size: 14px;
            color: #95a5a6;
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
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 14px;
            background: #2c3e50;
            border: 1px solid #3d5a80;
            border-radius: 8px;
            color: #e8e8e8;
            font-size: 16px;
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #4a9eff;
        }
        input::placeholder {
            color: #7f8c8d;
        }
        .submit-btn {
            width: 100%;
            padding: 14px;
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
        .links {
            margin-top: 25px;
            text-align: center;
            font-size: 14px;
        }
        .links a {
            color: #4a9eff;
            text-decoration: none;
            margin: 0 10px;
        }
        .links a:active {
            opacity: 0.8;
        }
        .join-link {
            margin-top: 20px;
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid #34495e;
        }
        .join-link a {
            color: #95a5a6;
            text-decoration: none;
            font-size: 14px;
        }
        .join-link a:active {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <img src="img/fr-removebg-preview.png" alt="두두 로고" class="logo">
            <h1>사용자 로그인</h1>
            <p class="subtitle">공공 킥보드 서비스</p>
        </div>
        
        <form action="#" method="post" id="loginForm">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요" required>
            </div>
            
            <div class="form-group">
                <label for="userPw">비밀번호</label>
                <input type="password" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요" required>
            </div>
            
            <button type="submit" class="submit-btn">로그인</button>
        </form>
        
        <div class="links">
            <a href="#">아이디 찾기</a>
            <span style="color: #7f8c8d;">|</span>
            <a href="#">비밀번호 찾기</a>
        </div>
        
        <div class="join-link">
            <a href="join.jsp">회원가입</a>
        </div>
    </div>
    
    <script>
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            // Form submission handled by backend
            // This is UI-only implementation
        });
    </script>
</body>
</html>
