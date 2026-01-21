<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 로그인 - 두두 Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.login-card {
	width: 100%;
	max-width: 400px;
	border: none;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.logo-img {
	width: 80px;
	height: 80px;
	border-radius: 50%;
	object-fit: cover;
}
</style>
</head>
<body>

	<div class="card login-card p-4">
		<div class="card-body text-center">

			<div class="mb-4">
				<img src="assets/images/DuDu_LOGO.jpg" alt="Logo"
					class="logo-img mb-2">
				<h4 class="fw-bold text-dark">DUDU Admin</h4>
				<p class="text-muted small">관리자 계정으로 접속하세요</p>
			</div>

			<form action="adminLoginAction.jsp" method="post"
				class="row g-3 needs-validation" novalidate>

				<div class="col-12">
				    <label for="yourUsername" class="form-label fw-bold">아이디</label>
				    <div class="input-group has-validation">
				        <input type="text" name="id" class="form-control" id="yourUsername" placeholder="아이디를 입력하세요" required>
				        <div class="invalid-feedback">아이디를 입력해주세요.</div>
				    </div>
				</div>
				
				<div class="col-12">
				    <label for="yourPassword" class="form-label fw-bold">비밀번호</label>
				    <input type="password" name="pw" class="form-control" id="yourPassword" placeholder="비밀번호 입력" required>
				    <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
				</div>

				<div class="col-12">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" name="remember"
							value="true" id="rememberMe"> <label
							class="form-check-label" for="rememberMe">로그인 상태 유지</label>
					</div>
				</div>

				<div class="col-12">
					<button class="btn btn-primary w-100" type="submit">로그인</button>
				</div>

			</form>
		</div>
	</div>

</body>
</html>