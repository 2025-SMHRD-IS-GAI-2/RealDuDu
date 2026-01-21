<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>내 정보 - 두두 Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="d-flex">
        <jsp:include page="adminSidebar.jsp" />
        <div class="flex-grow-1 p-4">
            <h2 class="mb-4">관리자 프로필</h2>
            <div class="card shadow-sm border-0 p-4" style="max-width: 600px;">
                <div class="d-flex align-items-center mb-4">
                    <img src="assets/images/DuDu_LOGO.jpg" class="rounded-circle me-3" width="80" height="80">
                    <div>
                        <h4 class="fw-bold mb-1">관리자 (Admin)</h4>
                        <p class="text-muted m-0">운영팀 / 팀장</p>
                    </div>
                </div>
                <form>
                    <div class="mb-3">
                        <label class="form-label fw-bold">아이디</label>
                        <input type="text" class="form-control" value="admin" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">이메일</label>
                        <input type="email" class="form-control" value="admin@dudu.com">
                    </div>
                    <div class="text-end">
                        <a href="change-password.jsp" class="btn btn-warning text-white">비밀번호 변경</a>
                        <button type="submit" class="btn btn-primary">정보 수정</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>