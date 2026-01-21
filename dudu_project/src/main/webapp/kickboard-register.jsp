<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>기기 등록 - 두두 Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="d-flex">
        <jsp:include page="adminSidebar.jsp" />
        <div class="flex-grow-1 p-4" style="min-height: 100vh;">
            
            <h2 class="mb-4">신규 기기 등록</h2>

            <div class="card shadow-sm border-0" style="max-width: 600px;">
                <div class="card-header bg-white fw-bold">기기 정보 입력</div>
                <div class="card-body p-4">
                    
                    <form action="kickboardRegisterAction.jsp" method="post">
                        
                        <div class="mb-3">
                            <label class="form-label fw-bold">기기 ID</label>
                            <input type="text" class="form-control" name="id" placeholder="예: DD099" required>
                            <div class="form-text">기기에 부착된 고유 QR코드 번호를 입력하세요.</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">모델명</label>
                            <input type="text" class="form-control" name="model" placeholder="예: DUDU-MAX-2026" required>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold">초기 상태</label>
                            <select class="form-select" name="status">
                                <option value="A">운영가능 (A)</option>
                                <option value="M">점검중 (M)</option>
                                <option value="O">사용중 (O)</option>
                            </select>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-lg">기기 등록하기</button>
                            <a href="kickboard-list.jsp" class="btn btn-light btn-lg">취소</a>
                        </div>
                    </form>

                </div>
            </div>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>