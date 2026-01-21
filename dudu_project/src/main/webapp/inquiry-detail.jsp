<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dudu.model.AdminDAO"%>
<%@ page import="com.dudu.model.Inquiry"%>
<%@ page import="java.util.*"%>

<%
    // 1. URL 파라미터 받기 (글 번호)
    String idParam = request.getParameter("id");
    int idx = 0;
    if(idParam != null) idx = Integer.parseInt(idParam);

    // 2. DB 조회
    AdminDAO dao = new AdminDAO();
  	Inquiry inq = dao.selectInquiryDetail(idx);

    if (inq == null) {
        out.println("<script>alert('삭제되거나 없는 게시글입니다.'); history.back();</script>");
        return;
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>문의 상세 - 두두 Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-light">
    
    <div class="d-flex">
        <jsp:include page="adminSidebar.jsp" />

        <div class="flex-grow-1 p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="fw-bold">문의 상세 내역</h2>
                <a href="service-center.jsp" class="btn btn-outline-secondary">목록으로</a>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <div class="card shadow-sm border-0 mb-4">
                        <div class="card-header bg-white py-3">
                            <span class="badge bg-secondary me-2"><%= inq.getCS_TYPE() %></span>
                            <strong class="fs-5"><%= inq.getCS_TITLE() %></strong>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between text-muted mb-3 border-bottom pb-2">
                                <span><i class="bi bi-person me-1"></i>작성자: <%= inq.getUSER_ID() %></span>
                                <span><i class="bi bi-clock me-1"></i>작성일: <%= inq.getREG_DT() %></span>
                            </div>
                            <div class="p-3" style="min-height: 200px;">
                                <%= inq.getCS_CONT().replace("\n", "<br>") %>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card shadow-sm border-0 h-100">
                        <div class="card-header bg-primary text-white">
                            <i class="bi bi-check-circle-fill me-2"></i>처리 상태
                        </div>
                        <div class="card-body">
                            
                            <% if ("R".equals(inq.getPROC_ST())) { %>
                                <div class="alert alert-success text-center fw-bold mb-3">
                                    <i class="bi bi-check-lg me-1"></i>답변 완료된 문의입니다.
                                </div>
                                <h6 class="text-muted border-bottom pb-2">담당자 답변 내용</h6>
                                <div class="bg-light p-3 rounded" style="min-height: 100px;">
                                    <%= (inq.getANSWER_CONT() != null) ? inq.getANSWER_CONT().replace("\n", "<br>") : "" %>
                                </div>

                            <% } else { %>
                                <div class="alert alert-warning text-center fw-bold mb-3">
                                    현재 답변 대기 중입니다.
                                </div>
                                
                                <form action="InquiryAnswer.do" method="post">
                                    <input type="hidden" name="id" value="<%= inq.getCS_NO() %>">
                                    
                                    <div class="mb-3">
                                        <label for="answer" class="form-label fw-bold">답변 내용 작성</label>
                                        <textarea class="form-control" name="answer" id="answer" rows="6" 
                                            placeholder="고객님께 전달할 답변을 입력하세요." required></textarea>
                                    </div>
                                    
                                    <div class="d-grid">
                                        <button type="submit" class="btn btn-primary btn-lg">
                                            <i class="bi bi-send-fill me-2"></i>답변 등록 및 처리 완료
                                        </button>
                                    </div>
                                </form>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>