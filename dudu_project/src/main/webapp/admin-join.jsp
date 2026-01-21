<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 등록 - 두두 Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="d-flex">
        <jsp:include page="adminSidebar.jsp" />
        <div class="flex-grow-1 p-4" style="min-height: 100vh;">
            
            <h2 class="mb-4">신규 관리자 등록</h2>

            <div class="card shadow-sm border-0" style="max-width: 600px;">
                <div class="card-header bg-white fw-bold">계정 정보 입력</div>
                <div class="card-body p-4">
                    
                    <form action="adminJoinAction.jsp" method="post">
                        
                        <div class="mb-3">
						    <label class="form-label fw-bold">아이디</label>
						    <input type="text" class="form-control" name="id" placeholder="사용할 아이디를 입력하세요" required>
						</div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">비밀번호</label>
                            <input type="password" class="form-control" name="pw" placeholder="비밀번호 입력" required>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold">관리자 이름</label>
                            <input type="text" class="form-control" name="name" placeholder="예: 김관리" required>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-lg">관리자 등록하기</button>
                            <a href="main.jsp" class="btn btn-light btn-lg">취소</a>
                        </div>
                    </form>

                </div>
            </div>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>