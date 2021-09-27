<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
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
	 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/headerMain.jsp"/>
		<div class="main-section-container d-flex justify-content-center mt-5 mb-5">
			<div class="horizontal-align-div">
			<!-- 비로그인 일경우 해당 섹션은 보이질 않음 -->
			<c:if test="${not empty userName }">
			<div class="post-section-container border p-3 text-center d-flex justify-content-center">
				<div class="post-elements">
					<h5 class="mb-3">게시글 올리기</h5>
					<div class="textarea-container mb-3">
						<input type="file" accept="image/*" class="ml-3 mb-3" id="fileInput">
						<button type="button" id="postBtn" class="btn btn-primary mr-3 mb-3">게시</button>
						<textarea class="feed-textarea form-control" id="feedContentInput" rows="10" placeholder="내용을 입력해주세요"></textarea>
					</div>
				</div>
			</div>
				</c:if>
				<c:forEach var="printFeed" items="${printFeedList }" varStatus="status">
				<div class="feed-container border rounded p-3 text-center d-flex justify-content-center mt-5">
					<div class="feed-elements">
						<div class="feed-top d-flex justify-content-between align-items-center">
							<div class="user-logo col-3">
								<a href="#"><i class="far fa-user"></i></a>
								<small class="ml-2"><c:out value="${printFeed.userName }"/></small>
							</div>
							<div class="more-menu col-3">
								...
							 </div>
						</div>
						<div class="feed-img mt-3 mb-3">
							<c:if test="${not empty printFeed.imagePath }">
								<img src="${printFeed.imagePath }" width="699px" height="600px"/>
							</c:if>
						</div>
						<div class="feed-bottom ml-2 mr-2">
							<div class="btn-container d-flex justify-content-between">
								<div class="like-button-container"><button type="button" id="likeBtn"><a href="#" class= "likeBtnLink"><i class="far fa-heart fa-2x"></i></a></button></div>
								<div class="save-button-container"><button type="button" id="saveBtn"><a href="#" class= "saveBtnLink"><i class="far fa-save fa-2x"></i></a></button></div>
							</div>
							<div class="comment-container d-flex justify-content-start mt-2 ml-2">
								<div class="horizontal-align">
									<div class="like-count font-weight-bold text-left mb-2">좋아요 10개</div>
									<div class="comment-section d-flex justify-content-start">
										<div class="horizontal-align">
											<!-- 포스팅 content 표기 부분 -->
											<div class="comments d-flex"><div class="content-userId font-weight-bold mr-2"><c:out value="${printFeed.userName }"/></div><c:out value="${printFeed.content }"/></div>
											<!-- comment 리스트 뽑기 -->
												<c:forEach var="printComment" items="${printCommentList }" varStatus="status">
													<c:if test="${printFeed.id eq printComment.feedId }">
														<div class="comment d-flex"><div class="comment-userId font-weight-bold mr-2 mb-1"><c:out value="${printComment.userName }"/> </div><c:out value="${printComment.content }"/></div>
													</c:if>
												</c:forEach>
												<!-- 피드 생성 날짜 표기 -->
												<div class="text-secondary"><fmt:formatDate value="${printFeed.createdAt }" pattern="yyyy/MM/dd HH시 mm분"/></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<c:if test="${not empty userName }">
						<hr>
						<div class="comment-writing-container d-flex align-items-center justify-content-between">
							<div class="emoji-container col-2">
								<a href="#" class="emojiLink"><i class="far fa-laugh fa-2x"></i></a>
							</div>
							<div class="comment-write-container col-8">
								<input type="text" class="comment-write-section" id="commentInput-${printFeed.id }" placeholder="댓글 달기...">
							</div>
							<div class="comment-postBtn-container col-2">
								<button type="button" data-feed-id="${printFeed.id }" class="commentPostBtn btn btn-primary">게시</button>
							</div>
						</div>
						</c:if>
					</div>
				</div>
				</c:forEach>	
				</div>
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
			
	</div>
	
	<script>
		$(document).ready(function(){
			$("#postBtn").on("click",function(){

				var feedContent = $("#feedContentInput").val().trim();
				var feedFile = $("#fileInput")[0].files[0];
				
				
				if(feedContent==null||feedContent==""){
					alert("내용을 입력하세요");
					return;
				}
				
				if(feedFile==null){
					alert("게시물을 등록하세요");
					return;
				}
				
				var formData = new FormData();
				formData.append("feedContent", feedContent);
				formData.append("feedFile", feedFile);
				
				$.ajax({
					enctype:"multipart/form-data", 
					processData:false, 
					contentType:false, 
					type:"post",
					url:"/feed/post",
					data:formData,
					success:function(data){
						if(data.result == "success"){
							alert("포스팅 성공");
							location.reload();
						}else{
							alert("포스팅 실패");
						}
					},
					error:function(e){
						alert("error");
					}
				});
				
			});
			
			$(".commentPostBtn").on("click",function(){
				
				var feedId = $(this).data("feed-id");
				
				var content = $("#commentInput-" + feedId).val().trim();
				
				if(content == null || content == ""){
					alert("댓글을 입력하세요");	
				}
				
				//댓글 등록 
				
				$.ajax({
					
					type:"post",
					url:"/feed/comment",
					data:{"feedId":feedId,"content":content},
					success:function(data){
						if(data.result=="success"){
							alert("댓글 등록 성공");
							location.reload();
						}else{
							alert("댓글 등록 실패");
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