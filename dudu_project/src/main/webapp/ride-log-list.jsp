<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>

<%
// =================================================================
// [Backend] 주행 이력 리스트 조회 (페이징 처리 적용)
// =================================================================
request.setCharacterEncoding("UTF-8");

// 1. 페이징 설정 변수
int pageSize = 15; // 한 페이지에 보여줄 게시물 수 (15개씩)

// 현재 페이지 번호 가져오기 (없으면 1페이지)
String pageNumStr = request.getParameter("pageNum");
int pageNum = (pageNumStr == null) ? 1 : Integer.parseInt(pageNumStr);

// DB에서 가져올 시작/끝 행 번호 계산
int startRow = (pageNum - 1) * pageSize + 1;
int endRow = pageNum * pageSize;

// 전체 글 개수와 전체 페이지 수
int count = 0;
int pageCount = 0;

List<Map<String, String>> rideList = new ArrayList<>();

Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
String dbId = "campus_25IS_GA2_p2_4";
String dbPw = "smhrd4";

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, dbId, dbPw);

	// [Query 1] 전체 데이터 개수 구하기 (몇 건인지 확인용)
	String sqlCount = "SELECT COUNT(*) FROM TB_RIDE";
	ps = conn.prepareStatement(sqlCount);
	rs = ps.executeQuery();
	if (rs.next()) {
		count = rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	
	// ---------------------------------------------------------
    // [1단계] 정렬 기준(sort) 받아서 SQL 조각(orderSql) 만들기
    // ---------------------------------------------------------
    String sortReq = request.getParameter("sort"); // 주소창의 ?sort=값 가져오기
    
    // 기본값 설정 (아무것도 안 눌렀을 때는 최신순)
    String orderSql = "ORDER BY START_DT DESC"; 

    // 사용자가 버튼을 눌렀을 때만 변경 (보안 철저!)
    if("score".equals(sortReq)) {
        orderSql = "ORDER BY SCORE_CG ASC"; // 점수 낮은 순 (오름차순)
    } 
    else if("helmet".equals(sortReq)) {
        orderSql = "ORDER BY NOHELMET_CNT DESC"; // 위반 많은 순
    }
    // else if("date".equals(sortReq)) { ... } // 필요하면 추가
    
    // ---------------------------------------------------------
    // 이제 orderSql 변수가 만들어졌으니, 아래에서 에러가 사라집니다!
    // ---------------------------------------------------------
	
	// [Query 2] 페이징 쿼리 (ROWNUM 사용)
	// 최신순으로 정렬한 뒤, 1~20등, 21~40등... 이렇게 잘라옵니다.
	String sqlList = "SELECT * FROM ( " 
               + "  SELECT A.*, ROWNUM AS RNUM FROM ( "
               + "      SELECT RIDE_ID, USER_ID, KICKBOARD_ID, "
               + "             TO_CHAR(START_DT, 'YYYY-MM-DD HH24:MI') AS S_DT, "
               + "             TO_CHAR(END_DT, 'YYYY-MM-DD HH24:MI') AS E_DT, " 
               + "             NOHELMET_CNT, SCORE_CG "
               + "      FROM TB_RIDE " 
               +        orderSql    // 👈 여기가 핵심! (따옴표 없이 변수만)
               + "  ) A WHERE ROWNUM <= ? "
               + ") WHERE RNUM >= ?";

	ps = conn.prepareStatement(sqlList);
	ps.setInt(1, endRow); // 예: 20
	ps.setInt(2, startRow); // 예: 1

	rs = ps.executeQuery();

	while (rs.next()) {
		Map<String, String> map = new HashMap<>();
		map.put("rideId", rs.getString("RIDE_ID"));
		map.put("userId", rs.getString("USER_ID"));
		map.put("kickId", rs.getString("KICKBOARD_ID"));
		map.put("sDate", rs.getString("S_DT"));
		map.put("eDate", rs.getString("E_DT"));
		map.put("score", rs.getString("SCORE_CG"));

		int noHelmet = rs.getInt("NOHELMET_CNT");
		if (noHelmet > 0) {
	map.put("status", "위반(미착용)");
	map.put("badge", "bg-danger");
		} else {
	map.put("status", "정상 주행");
	map.put("badge", "bg-success");
		}
		rideList.add(map);
	}

	// 전체 페이지 수 계산
	if (count > 0) {
		pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	}

} catch (Exception e) {
	e.printStackTrace();
} finally {
	if (rs != null)
		try {
	rs.close();
		} catch (Exception e) {
		}
	if (ps != null)
		try {
	ps.close();
		} catch (Exception e) {
		}
	if (conn != null)
		try {
	conn.close();
		} catch (Exception e) {
		}
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>주행 이력 관리 - 두두 Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
.table th {
	background-color: #f8f9fa;
}

.ride-row:hover {
	background-color: #f1f3f5;
}

/* 페이지네이션 스타일 */
.page-link {
	color: #333;
}

.page-item.active .page-link {
	background-color: #0d6efd;
	border-color: #0d6efd;
	color: white;
}
</style>
</head>
<body class="bg-light">

	<div class="d-flex">
		<jsp:include page="adminSidebar.jsp" />

		<div class="flex-grow-1 p-4" style="min-height: 100vh;">
			<h2 class="mb-4 fw-bold">🛴 주행 기록 조회</h2>

			<div class="card shadow-sm border-0">
				<div
					class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
					<h5 class="m-0 fw-bold">전체 주행 리스트</h5>
					<span class="badge bg-primary rounded-pill">총 <%=count%>건
					</span>
				</div>
				
				
				<div class="card-body p-0">
					<div class="table-responsive">
						<table class="table align-middle mb-0 text-center">
							<thead class="table-light">
								<tr>
									<th>주행 ID</th>
									<th>사용자 ID</th>
									<th>킥보드 ID</th>
									<th>이용 시간</th>
									<th>헬멧 상태</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
								<%
								if (rideList.isEmpty()) {
								%>
								<tr>
									<td colspan="6" class="py-5 text-muted">주행 데이터가 없습니다.</td>
								</tr>
								<%
								} else {
								for (Map<String, String> ride : rideList) {
								%>
								<tr>
									<td class="small text-muted"><%=ride.get("rideId")%></td>
									<td class="fw-bold text-primary"><%=ride.get("userId")%></td>
									<td><%=ride.get("kickId")%></td>
									<td>
										<div class="small"><%=ride.get("sDate")%></div>
										<div class="small text-muted">
											~
											<%=ride.get("eDate") != null ? ride.get("eDate") : "주행중"%></div>
									</td>
									<td><span
										class="badge rounded-pill <%=ride.get("badge")%>"> <%=ride.get("status")%>
									</span></td>
									<td><a
										href="ride-log-detail.jsp?id=<%=ride.get("rideId")%>"
										class="btn btn-sm btn-outline-secondary"> <i
											class="bi bi-search"></i> 상세보기
									</a></td>
								</tr>
								<%
								}
								}
								%>
							</tbody>
						</table>
					</div>
				</div>

				<div class="card-footer bg-white d-flex justify-content-center py-3">
					<nav aria-label="Page navigation">
						<ul class="pagination mb-0">
							<%
							if (count > 0) {
								// 1. 페이지 블록 크기 (7개씩 보여주기)
								int pageBlock = 7;

								// 2. 현재 블록의 시작/끝 페이지 계산
								// 예: 현재 9페이지면 -> startPage=8, endPage=14 (7개씩 끊을 때)
								int startPage = ((pageNum - 1) / pageBlock) * pageBlock + 1;
								int endPage = startPage + pageBlock - 1;

								// 끝 페이지가 전체 페이지(pageCount)보다 크면 안 되니까 자르기
								if (endPage > pageCount)
									endPage = pageCount;

								// -----------------------------------------------------
								// ① [<<] 맨 처음으로 (무조건 1페이지)
								// -----------------------------------------------------
								// 현재가 1페이지가 아닐 때만 보여줌
								if (pageNum > 1) {
							%>
							<li class="page-item"><a class="page-link"
								href="ride-log-list.jsp?pageNum=1" aria-label="First"> <span
									aria-hidden="true">&laquo;&laquo;</span>
							</a></li>
							<%
							} else {
							%>
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1">&laquo;&laquo;</a></li>
							<%
							}

							// -----------------------------------------------------
							// ② [<] 이전 페이지 (현재 페이지 - 1)
							// -----------------------------------------------------
							if (pageNum > 1) {
							%>
							<li class="page-item"><a class="page-link"
								href="ride-log-list.jsp?pageNum=<%=pageNum - 1%>"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<%
							} else {
							%>
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
							<%
							}

							// -----------------------------------------------------
							// ③ [1] [2] ... [7] 페이지 번호들
							// -----------------------------------------------------
							for (int i = startPage; i <= endPage; i++) {
							%>
							<li class="page-item <%=(i == pageNum) ? "active" : ""%>">
								<a class="page-link" href="ride-log-list.jsp?pageNum=<%=i%>"><%=i%></a>
							</li>
							<%
							}

							// -----------------------------------------------------
							// ④ [>] 다음 페이지 (현재 페이지 + 1)
							// -----------------------------------------------------
							if (pageNum < pageCount) {
							%>
							<li class="page-item"><a class="page-link"
								href="ride-log-list.jsp?pageNum=<%=pageNum + 1%>"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
							<%
							} else {
							%>
							<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
							<%
							}

							// -----------------------------------------------------
							// ⑤ [>>] 맨 끝으로 (pageCount로 이동)
							// -----------------------------------------------------
							if (pageNum < pageCount) {
							%>
							<li class="page-item"><a class="page-link"
								href="ride-log-list.jsp?pageNum=<%=pageCount%>"
								aria-label="Last"> <span aria-hidden="true">&raquo;&raquo;</span>
							</a></li>
							<%
							} else {
							%>
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1">&raquo;&raquo;</a></li>
							<%
							}
							}
							%>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>