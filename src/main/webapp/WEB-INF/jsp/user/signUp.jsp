<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNScopy - 회원가입</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!--  datepicker -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- styleshet -->
<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<!-- Font Awesome -->
	 <script src="https://kit.fontawesome.com/904eedb8ad.js" crossorigin="anonymous"></script>
</head>
<body>

	<div id="wrap">
		<div class="main-section-container d-flex justify-content-center mt-5">
			<section class="main-section">
				<div class="signup-form-box border p-4 d-flex align-items-center justify-content-center">
					<div class="signup-form-box-elements">
						<h1 class="text-center mb-5">Instagram</h1>
						<div class="signup-form-box-description text-center text-secondary mb-5">
						친구들의 사진과 동영상을 보려면 <br>가입하세요.
						</div>
						<form id="signUpForm">
							<input type="text" class="form-control mb-4" placeholder="이메일 주소" name="email" id="emailInput"/>
							<input type="text" class="form-control mb-4" placeholder="성명" name="name" id="nameInput"/>
							<div class="id-check-container mb-4">
							<div class="d-flex">
								<input type="text" class="id-input-box form-control col-12" placeholder="아이디" name="loginId" id="loginIdInput"/>
								<button id ="isDuplicateBtn" class="btn btn-info">중복확인</button>
							</div>
							<div class="hidden-msg-container">
								<small class="text-danger d-none" id="duplicate-msg">중복된 id입니다</small>
								<small class="text-success d-none" id="non-duplicate-msg">사용 할 수 있는 id입니다</small>
							</div>
							</div>
							<input type="password" class="form-control mb-4" placeholder="비밀번호" name="password" id="passwordInput"/>
							<input type="password" class="form-control mb-4" placeholder="비밀번호 확인" name="passwordCheck" id="passwordCheckInput"/>
							<button type="submit" class="btn btn-primary btn-block">가입</button>
							<br>
						</form>
					</div>
				</div>
				<div class="signIn-link-box mt-5 border p-4 d-flex align-items-center justify-content-center">
						<div class="signIn-link-text">
							계정이 없으신가요? <a href="/user/signin_view" class="ml-2">로그인</a>
						</div>
				</div>
				<div class="app-download-container mt-5">
						<div class="text-center">앱을 다운로드하세요.</div>
						<div class="app-download-btns d-flex justify-content-center">
							<div class="app-store-btn mt-3">
								<a href="https://apps.apple.com/app/instagram/id389801252?vt=lo" class="btn btn-dark d-flex">
								<i class="fab fa-apple fa-3x ml-1 mr-3"></i><div class="app-store-text">App Store에서<br>download 하기</div>
								</a>
							</div>
							<div class="google-play-btn mt-3 ml-3">
								<a href="https://play.google.com/store/apps/details?id=com.instagram.android&referrer=utm_source%3Dinstagramweb&utm_campaign=loginPage&ig_mid=00DF1633-B083-41F3-89ED-FDBB0F570F5B&utm_content=lo&utm_medium=badge" 
								class="btn btn-dark d-flex">
								<i class="fab fa-google-play fa-3x ml-1 mr-3"></i><div class="google-play-text">download 하기<br>Google Play</div>
								</a>
							</div>
						</div>
				</div>
			</section>
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script>
		$(document).ready(function(){
			
			var isDuplicateBtnChecked = false;
			var isDuplicateId = true;
			
			//중복확인
			$("#isDuplicateBtn").on("click",function(){
				
				
				var loginId = $("#loginIdInput").val().trim();
				
				if(loginId==null||loginId==""){
					alert("아이디를 입력하세요.");
					return;
				}
				
				$.ajax({
					
					type:"get",
					url:"/user/isDuplicate",
					data:{"loginId":loginId},
					success:function(data){
						isDuplicateBtnChecked = true;
						if(data.isDuplicate){
							$("#duplicate-msg").removeClass("d-none");
							$("#non-duplicate-msg").addClass("d-none");
							isDuplicateId = true;
						}else{
							$("#non-duplicate-msg").removeClass("d-none");
							$("#duplicate-msg").addClass("d-none");
							isDuplicateId = false;
						}
						
					},
					error:function(e){
						alert("error");
					}
					
				});
				
			});
			//가입
			$("#signUpForm").on("submit",function(e){
				
				e.preventDefault();
				
				
				var email = $("#emailInput").val().trim();
				var name = $("#nameInput").val().trim();
				var loginId = $("#loginIdInput").val().trim();
				var password = $("#passwordInput").val().trim();
				var passwordCheck = $("#passwordCheckInput").val().trim();
				
				
				if(email==null||email==""){
					alert("이메일을 입력하세요.");
					return;
				}
				if(name==null||name==""){
					alert("이름을 입력하세요.");
					return;
				}
				if(loginId==null||loginId==""){
					alert("아이디를 입력하세요.");
					return;
				}
				if(password==null||password==""){
					alert("비밀번호를 입력하세요.");
					return;
				}
				if(passwordCheck==null||passwordCheck==""){
					alert("비밀번호 확인을 입력하세요.");
					return;
				}
				if(password!=passwordCheck){
					alert("비밀번호가 일치하지 않습니다");
					return;
				}
				if(!isDuplicateBtnChecked){
					alert("아이디 중복확인을 해주세요.");
					return;
				}
				if(isDuplicateId){
					alert("중복되지 않은 아이디를 입력하세요.");
					return;
				}
				
				$.ajax({
					
					type:"post",
					url:"/user/sign_up",
					data:{"email":email,"name":name,"loginId":loginId,"password":password},
					success:function(data){
						if(data.result == "success"){
							location.href = "/user/signin_view";
						}else{
							alert("가입실패");
						}
					},
					error:function(e){
						alert("error");
					}
					
				});
			});
			
			
		});
	</script>

</body>
</html>