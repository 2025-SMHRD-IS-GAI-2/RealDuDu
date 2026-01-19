<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객센터 문의 - 두두</title>
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
        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 14px;
            background: #2c3e50;
            border: 1px solid #3d5a80;
            border-radius: 8px;
            color: #e8e8e8;
            font-size: 16px;
            font-family: inherit;
        }
        input[type="text"]:focus,
        select:focus,
        textarea:focus {
            outline: none;
            border-color: #4a9eff;
        }
        input::placeholder,
        textarea::placeholder {
            color: #7f8c8d;
        }
        select {
            cursor: pointer;
        }
        select option {
            background: #2c3e50;
            color: #e8e8e8;
        }
        textarea {
            resize: vertical;
            min-height: 120px;
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
                <h2>고객센터 문의</h2>
                <p class="description">문의사항을 작성해주세요. 빠르게 답변드리겠습니다.</p>
                
                <form action="#" method="post" id="inquiryForm">
                    <div class="form-group">
                        <label for="userId">사용자 ID</label>
                        <input type="text" id="userId" name="userId" placeholder="사용자 ID를 입력하세요." required>
                    </div>
                    
                    <div class="form-group">
                        <label for="csTitle">문의 제목</label>
                        <input type="text" id="csTitle" name="csTitle" placeholder="문의 제목을 입력하세요." required>
                    </div>
                    
                    <div class="form-group">
                        <label for="csType">문의 유형</label>
                        <select id="csType" name="csType" required>
                            <option value="">선택하세요</option>
                            <option value="REPORT">제보</option>
                            <option value="DEFECT">기기결함</option>
                            <option value="ETC">기타</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="csContent">문의 내용</label>
                        <textarea id="csContent" name="csContent" placeholder="문의 내용을 상세히 입력해주세요." required></textarea>
                    </div>
                    
                    <button type="submit" class="submit-btn">문의 등록</button>
                </form>
            </div>
            
            <div class="back-link">
                <a href="index_login.jsp">← 메인으로</a>
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
        
        document.getElementById('inquiryForm').addEventListener('submit', function(e) {
            e.preventDefault();
            // Form submission handled by backend servlet
            // Field names: userId, csTitle, csType, csContent
            if (confirm('문의를 등록하시겠습니까?')) {
                alert('문의가 등록되었습니다.\n\n관리자가 확인 후 답변드리겠습니다.');
                // In production: redirect to confirmation or clear form
                setTimeout(function() {
                    window.location.href = 'index_login.jsp';
                }, 1500);
            }
        });
    </script>
</body>
</html>
