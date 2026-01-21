<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>문의 처리 이력 - 두두 Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body class="bg-light">

    <div class="d-flex">

        <jsp:include page="adminSidebar.jsp" />

        <div class="flex-grow-1 p-4" style="min-height: 100vh;">
            
            <h2 class="mb-4">문의 처리 이력</h2>

            <div class="card shadow-sm mb-4 border-0">
                <div class="card-body bg-white py-3">
                    <form class="row g-3 align-items-center">
                        <div class="col-auto">
                            <label class="col-form-label fw-bold">처리 기간</label>
                        </div>
                        <div class="col-auto">
                            <input type="date" class="form-control">
                        </div>
                        <div class="col-auto">
                            <span>~</span>
                        </div>
                        <div class="col-auto">
                            <input type="date" class="form-control">
                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-secondary">조회</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="card shadow-sm border-0">
                <div class="card-header bg-white py-3">
                    <h5 class="m-0 fw-bold">완료된 문의 목록</h5>
                </div>
                
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0 text-center">
                            <thead class="table-light">
                                <tr>
                                    <th>No.</th>
                                    <th>카테고리</th>
                                    <th class="text-start w-50">제목</th>
                                    <th>작성자</th>
                                    <th>처리 완료일</th> <th>상세</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>10</td>
                                    <td><span class="badge bg-light text-dark border">기타</span></td>
                                    <td class="text-start text-truncate" style="max-width: 350px;">
                                        <span class="text-muted">[완료]</span> 회원 탈퇴 절차 문의합니다.
                                    </td>
                                    <td>user099</td>
                                    <td>2026.01.18</td>
                                    <td>
                                        <a href="inquiry-detail.jsp?id=10&readonly=true" class="btn btn-sm btn-outline-secondary">
                                            결과 보기
                                        </a>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>9</td>
                                    <td><span class="badge bg-light text-dark border">이용 문의</span></td>
                                    <td class="text-start text-truncate" style="max-width: 350px;">
                                        <span class="text-muted">[완료]</span> 서비스 지역 확장 계획이 있나요?
                                    </td>
                                    <td>user001</td>
                                    <td>2026.01.15</td>
                                    <td>
                                        <a href="inquiry-detail.jsp?id=9&readonly=true" class="btn btn-sm btn-outline-secondary">
                                            결과 보기
                                        </a>
                                    </td>
                                </tr>

                                <tr>
                                    <td>8</td>
                                    <td><span class="badge bg-light text-dark border">결제</span></td>
                                    <td class="text-start text-truncate" style="max-width: 350px;">
                                        <span class="text-muted">[완료]</span> 환불 계좌 변경 요청
                                    </td>
                                    <td>user022</td>
                                    <td>2026.01.10</td>
                                    <td>
                                        <a href="inquiry-detail.jsp?id=8&readonly=true" class="btn btn-sm btn-outline-secondary">
                                            결과 보기
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="card-footer bg-white d-flex justify-content-center py-3">
                    <nav>
                        <ul class="pagination mb-0">
                            <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">다음</a></li>
                        </ul>
                    </nav>
                </div>
            </div>

        </div> </div> <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>