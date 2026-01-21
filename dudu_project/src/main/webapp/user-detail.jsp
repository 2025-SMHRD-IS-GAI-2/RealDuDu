<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dudu.model.User"%>
<%@ page import="com.dudu.model.AdminDAO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
    // 1. 파라미터 및 데이터 로드
    String userId = request.getParameter("id");
    AdminDAO dao = new AdminDAO();
    User user = dao.selectOneMember(userId);

    // 데이터가 없을 경우 방어 코드
    if (user == null) {
        out.println("<script>alert('사용자 정보를 찾을 수 없습니다.'); history.back();</script>");
        return;
    }

    // 2. 날짜 포맷 및 등급 로직 (목록 페이지와 동일하게 적용)
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
    
    int score = user.getSAFETY_SCORE(); 
    String rawGrade = (user.getSAFETY_GR() != null) ? user.getSAFETY_GR().toUpperCase() : "";
    
    String badgeClass = "bg-secondary"; 
    String gradeName = "SILVER";
    
    // 회의 결정사항 반영 (50점 이상 GOLD 등)
    if (rawGrade.contains("BLACK") || "Y".equals(user.getBLACK_YN())) {
        badgeClass = "bg-dark";
        gradeName = "BLACKLIST";
    } else if (score >= 90 || rawGrade.contains("DIAMOND")) {
        badgeClass = "bg-info text-dark";
        gradeName = "DIAMOND";
    } else if (score >= 70 || rawGrade.contains("PLATINUM")) {
        badgeClass = "bg-primary";
        gradeName = "PLATINUM";
    } else if (score >= 50 || rawGrade.contains("GOLD")) {
        badgeClass = "bg-warning"; 
        gradeName = "GOLD";
    } else if (score >= 30 || rawGrade.contains("SILVER")) {
        badgeClass = "bg-secondary";
        gradeName = "SILVER";
    } else {
        badgeClass = "bg-warning text-dark"; 
        gradeName = "BRONZE";
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사용자 상세 - 두두 Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-light">

    <div class="d-flex">
        <jsp:include page="adminSidebar.jsp" />

        <div class="flex-grow-1 p-4" style="min-height: 100vh;">
            
           <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-2">
                <h2 class="m-0">회원 상세 정보</h2>
                <a href="user-status.jsp" class="btn btn-outline-secondary">목록으로</a>
            </div>

           <div class="row g-4">
                <div class="col-md-4">
                    <div class="card shadow-sm border-0 text-center p-4 h-100">
                        <div class="mb-3">
                            <div class="bg-secondary rounded-circle d-inline-flex align-items-center justify-content-center text-white" style="width: 100px; height: 100px; font-size: 2rem;">
                                <i class="bi bi-person-fill"></i>
                            </div>
                        </div>
                        
                        <h4 class="fw-bold"><%= user.getUSER_NM() %></h4>
                        <p class="text-muted"><%= user.getUSER_ID() %></p>
                        <hr>
                        
                        <div class="d-flex justify-content-around text-start mb-4">
                            <div>
                                <small class="text-muted d-block">가입일</small>
                                <strong style="font-size: 0.9rem;"><%= (user.getJOIN_DT() != null) ? sdf.format(user.getJOIN_DT()) : "-" %></strong>
                            </div>
                            <div>
                                <small class="text-muted d-block">안전 등급</small>
                                <span class="badge <%= badgeClass %>"><%= gradeName %></span>
                            </div>
                        </div>

                        <div class="mt-auto d-grid gap-2">
                            <% if ("N".equals(user.getBLACK_YN())) { %>
                                <button class="btn btn-danger" onclick="changeStatus('<%= user.getUSER_ID() %>', 'Y')">
                                    <i class="bi bi-slash-circle me-1"></i>블랙리스트 등록
                                </button>
                            <% } else { %>
                                <button class="btn btn-success" onclick="changeStatus('<%= user.getUSER_ID() %>', 'N')">
                                    <i class="bi bi-check-circle me-1"></i>블랙리스트 해제
                                </button>
                            <% } %>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="card shadow-sm border-0 h-100">
                        <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                            <h5 class="m-0 fw-bold text-dark">
                                <i class="bi bi-info-circle me-2"></i><%= user.getUSER_NM() %>님의 상세 정보 
                                <span class="text-muted fw-normal ms-2" style="font-size: 0.9rem;">(ID: <%= user.getUSER_ID() %>)</span>
                            </h5>
                        </div>
                        
                        <div class="card-body p-4">
                            <div class="mb-4">
                                <h6 class="fw-bold mb-3 text-primary"><i class="bi bi-person-lines-fill me-2"></i>기본 연락처</h6>
                                <div class="row bg-light rounded p-3 mx-0">
                                    <div class="col-sm-4 text-muted">휴대전화</div>
                                    <div class="col-sm-8 fw-bold"><%= (user.getUSER_TEL() != null) ? user.getUSER_TEL() : "등록된 번호 없음" %></div>
                                </div>
                            </div>

                            <div class="mb-4">
                                <h6 class="fw-bold mb-3 text-primary"><i class="bi bi-shield-check me-2"></i>안전 관리 현황</h6>
                                <div class="row border-bottom py-3 mx-0">
                                    <div class="col-sm-4 text-muted">현재 안전 점수</div>
                                    <div class="col-sm-8">
                                        <span class="fw-bold fs-5 text-dark"><%= user.getSAFETY_SCORE() %>점</span>
                                        <span class="text-muted ms-2">(가입 기본: 50점)</span>
                                    </div>
                                </div>
                                <div class="row border-bottom py-3 mx-0">
                                    <div class="col-sm-4 text-muted">계정 상태</div>
                                    <div class="col-sm-8">
                                        <% if("Y".equals(user.getBLACK_YN())) { %>
                                            <span class="badge bg-danger"><i class="bi bi-slash-circle me-1"></i>블랙리스트(이용 제한)</span>
                                        <% } else { %>
                                            <span class="badge bg-success"><i class="bi bi-check-circle me-1"></i>정상 계정</span>
                                        <% } %>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <h6 class="fw-bold mb-3 text-primary"><i class="bi bi-calendar-event me-2"></i>시스템 기록</h6>
                                <div class="row mx-0">
                                    <div class="col-sm-6">
                                        <small class="text-muted d-block">최초 가입 일시</small>
                                        <span class="fw-bold"><%= (user.getJOIN_DT() != null) ? sdf.format(user.getJOIN_DT()) : "-" %></span>
                                    </div>
                                    <div class="col-sm-6 border-start">
                                        <small class="text-muted d-block">마지막 로그인</small>
                                        <span class="fw-bold"><%= (user.getLAST_DT() != null) ? sdf.format(user.getLAST_DT()) : "기록 없음" %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
    function changeStatus(id, status) {
        const msg = (status === 'Y') 
                    ? "해당 사용자를 블랙리스트에 등록하시겠습니까?" 
                    : "해당 사용자의 블랙리스트를 해제하시겠습니까?";
        
        if (confirm(msg)) {
            // 서블릿으로 아이디와 상태값을 파라미터로 보냄
            location.href = "UpdateStatus.do?id=" + id + "&status=" + status;
        }
    }
    </script>
</body>
</html>
</body>
</html>