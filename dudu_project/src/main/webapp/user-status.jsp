<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dudu.model.User"%>
<%@ page import="com.dudu.model.AdminDAO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
    // 1. DAO 생성 및 전체 데이터 가져오기
    AdminDAO dao = new AdminDAO();
    List<User> allUsers = dao.selectAllMember(); // 전체 회원 조회

    if (allUsers == null) {
        allUsers = new ArrayList<>(); // null 방지
    }

    // 2. 파라미터 수집 (정렬 및 페이지)
    String sortParam = request.getParameter("sort");
    String pageParam = request.getParameter("page");
    
    // 3. 정렬 로직 (Collections.sort 사용)
    if ("join_desc".equals(sortParam) || sortParam == null) {
        // 가입일 최신순 (기본값)
        Collections.sort(allUsers, new Comparator<User>() {
            public int compare(User u1, User u2) {
                Date d1 = u1.getJOIN_DT();
                Date d2 = u2.getJOIN_DT();
                if (d1 == null) d1 = new Date(0);
                if (d2 == null) d2 = new Date(0);
                return d2.compareTo(d1); // 내림차순
            }
        });
    } else if ("grade_asc".equals(sortParam)) {
        // 등급 높은 순 (점수 높은 순)
        Collections.sort(allUsers, new Comparator<User>() {
            public int compare(User u1, User u2) {
                int s1 = u1.getSAFETY_SCORE();
                int s2 = u2.getSAFETY_SCORE();
                return s2 - s1; // 내림차순
            }
        });
    } else if ("grade_desc".equals(sortParam)) {
        // 등급 낮은 순 (점수 낮은 순)
        Collections.sort(allUsers, new Comparator<User>() {
            public int compare(User u1, User u2) {
                int s1 = u1.getSAFETY_SCORE();
                int s2 = u2.getSAFETY_SCORE();
                return s1 - s2; // 오름차순
            }
        });
    }

    // 4. 페이징 계산
    int currentPage = 1;
    if (pageParam != null && !pageParam.isEmpty()) {
        try {
            currentPage = Integer.parseInt(pageParam);
        } catch(NumberFormatException e) {
            currentPage = 1;
        }
    }

    int pageSize = 10; // 한 페이지당 보여줄 개수
    int totalCount = allUsers.size();
    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
    
    // 페이지 범위 보정
    if (currentPage < 1) currentPage = 1;
    if (currentPage > totalPages && totalPages > 0) currentPage = totalPages;

    int startIdx = (currentPage - 1) * pageSize;
    int endIdx = Math.min(startIdx + pageSize, totalCount);

    // 현재 페이지에 보여줄 리스트 자르기
    List<User> currentList = new ArrayList<>();
    if (totalCount > 0 && startIdx < totalCount) {
        currentList = allUsers.subList(startIdx, endIdx);
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사용자 관리 - 두두 Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="d-flex">
        <jsp:include page="adminSidebar.jsp" />

        <div class="flex-grow-1 p-4">
            
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="fw-bold">사용자 관리</h2>
                
                <div class="btn-group">
                    <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown">
                        정렬 기준
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="user-status.jsp?sort=join_desc">가입일 최신순</a></li>
                        <li><a class="dropdown-item" href="user-status.jsp?sort=grade_asc">안전 등급 높은순</a></li>
                        <li><a class="dropdown-item" href="user-status.jsp?sort=grade_desc">안전 등급 낮은순</a></li>
                    </ul>
                </div>
            </div>

            <div class="card shadow-sm border-0">
                <div class="card-header bg-white py-3">
                    <h5 class="m-0 fw-bold">전체 사용자 목록 <span class="badge bg-secondary ms-2"><%=totalCount%>명</span></h5>
                </div>
                
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0 text-center">
                        <thead class="table-light">
                            <tr>
                                <th>이름</th>
                                <th>아이디</th>
                                <th>연락처</th>
                                <th>안전 등급</th>
                                <th>가입일</th>
                                <th>관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (currentList.isEmpty()) { %>
                                <tr><td colspan="6" class="text-center py-5 text-muted">등록된 사용자가 없습니다.</td></tr>
                            <% } else { 
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                for (User u : currentList) {
                                    // 행별 스타일 및 배지 결정 로직
                                    String rowClass = ""; 
                                    String badgeClass = "bg-secondary";
                                    String gradeName = "SILVER";
                                    
                                    int score = u.getSAFETY_SCORE();
                                    String blackYn = u.getBLACK_YN();
                                    
                                    if ("Y".equals(blackYn)) {
                                        badgeClass = "bg-dark";
                                        gradeName = "BLACKLIST";
                                        rowClass = "table-secondary text-muted"; // 회색 배경 + 흐린 글씨
                                    } else if (score >= 90) {
                                        badgeClass = "bg-info text-dark";
                                        gradeName = "DIAMOND";
                                    } else if (score >= 70) {
                                        badgeClass = "bg-primary";
                                        gradeName = "PLATINUM";
                                    } else if (score >= 50) {
                                        badgeClass = "bg-warning text-dark";
                                        gradeName = "GOLD";
                                    } else if (score >= 30) {
                                        badgeClass = "bg-secondary";
                                        gradeName = "SILVER";
                                    } else {
                                        badgeClass = "bg-danger";
                                        gradeName = "BRONZE";
                                    }
                            %>
                            <tr class="<%= rowClass %>">
                                <td class="fw-bold"><%= u.getUSER_NM() %></td>
                                <td><%= u.getUSER_ID() %></td>
                                <td><%= (u.getUSER_TEL() != null) ? u.getUSER_TEL() : "-" %></td>
                                <td><span class="badge <%= badgeClass %>"><%= gradeName %></span></td>
                                <td><%= sdf.format(u.getJOIN_DT()) %></td>
                                <td>
                                    <a href="user-detail.jsp?id=<%= u.getUSER_ID() %>" class="btn btn-sm btn-outline-secondary">상세보기</a>
                                </td>
                            </tr>
                            <%   } // for end 
                               } // else end %>
                        </tbody>
                    </table>
                </div>

                <div class="card-footer bg-white d-flex justify-content-center py-3">
                    <nav aria-label="Page navigation">
                        <ul class="pagination mb-0">
                            <li class="page-item <%=(currentPage == 1) ? "disabled" : ""%>">
                                <a class="page-link" href="user-status.jsp?page=<%=currentPage - 1%>&sort=<%= (sortParam != null) ? sortParam : "" %>">이전</a>
                            </li>
                            <% for (int i = 1; i <= totalPages; i++) { %>
                                <li class="page-item <%=(currentPage == i) ? "active" : ""%>">
                                    <a class="page-link" href="user-status.jsp?page=<%=i%>&sort=<%= (sortParam != null) ? sortParam : "" %>"><%=i%></a>
                                </li>
                            <% } %>
                            <li class="page-item <%=(currentPage == totalPages || totalPages == 0) ? "disabled" : ""%>">
                                <a class="page-link" href="user-status.jsp?page=<%=currentPage + 1%>&sort=<%= (sortParam != null) ? sortParam : "" %>">다음</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>

        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>