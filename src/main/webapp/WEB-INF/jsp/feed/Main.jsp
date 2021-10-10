<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Monstagram</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<%-- AJAX js --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!--  datepicker -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- stylesheet -->
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
						<button type="button" id="imagePostBtn" class="btn mr-3 mb-2"><i class="far fa-image fa-3x"></i></button>
						<input type="file" accept="image/*" class="ml-3 mb-3 d-none" id="fileInput">
						<button type="button" id="postBtn" class="btn btn-primary mr-3 mb-3">게시</button>
						<textarea class="feed-textarea form-control" id="feedContentInput" rows="10" placeholder="내용을 입력해주세요"></textarea>
					</div>
				</div>
			</div>
				</c:if>
				<c:forEach var="detailFeed" items="${detailFeedList }" varStatus="status">
				<div class="feed-container border rounded p-3 text-center d-flex justify-content-center mt-5">
					<div class="feed-elements">
						<div class="feed-top d-flex justify-content-between align-items-center">
							<div class="user-logo col-2">
								<a href="#"><i class="far fa-user"></i></a>
								<small class="ml-2"><c:out value="${detailFeed.feed.userName }"/></small>
							</div>
							<!-- 더보기 -->
							<c:if test="${detailFeed.feed.userId eq userId }">
								<div class="more-menu col-2">
									<button type="button" data-feed-id="${detailFeed.feed.id }" class="btn moreMenuBtn" data-toggle="modal" data-target="#moreMenuModal"><i class="fas fa-ellipsis-h"></i></button>
								</div>
							</c:if>
						</div>
						<div class="feed-img mt-3 mb-3">
							<c:if test="${not empty detailFeed.feed.imagePath }">
								<img src="${detailFeed.feed.imagePath }" width="699px" height="600px"/>
							</c:if>
						</div>
						<div class="feed-bottom ml-2 mr-2">
							<c:if test="${not empty userName }">
								<div class="btn-container d-flex justify-content-between">
										<!--로그인된 사용자가 해당 포스트에 좋아요를 눌렀을 경우 해당 포스트에해당하는 좋아요 버튼 색 변경  -->
										<c:if test="${detailFeed.liked }">
											<div class="like-button-container"><button type="button" data-feed-id="${detailFeed.feed.id }" class="likedLikeBtn btn"><i class="far fa-heart fa-2x"></i></button></div>
										</c:if>
										<c:if test="${!detailFeed.liked }">
											<div class="like-button-container"><button type="button" data-feed-id="${detailFeed.feed.id }" class="likeBtn btn"><i class="far fa-heart fa-2x"></i></button></div>
										</c:if>
									<div class="save-button-container"><button type="button" id="" class="saveBtn btn"><i class="far fa-save fa-2x"></i></button></div>
								</div>
							</c:if>
							<div class="comment-container d-flex justify-content-start mt-2 ml-2">
								<div class="horizontal-align">
									<div class="like-count font-weight-bold text-left mb-2">좋아요 ${detailFeed.likeCount }개</div>
									<div class="comment-section d-flex justify-content-start">
										<div class="horizontal-align">
											<!-- 포스팅 content 표기 부분 -->
											<div class="comments d-flex"><div class="content-userId font-weight-bold mr-2 mb-1"><c:out value="${detailFeed.feed.userName }"/></div><c:out value="${detailFeed.feed.content }"/></div>
												<!-- 댓글 표기 부분 -->
												<c:forEach var="comment" items="${detailFeed.commentList }">
													<div class="comment d-flex"><div class="comment-userId font-weight-bold mr-2 mb-1"><c:out value="${comment.userName }"/> </div><c:out value="${comment.content }"/></div>
												</c:forEach>
												<!-- 피드 생성 날짜 표기 -->
												<div class="text-secondary"><fmt:formatDate value="${detailFeed.feed.createdAt }" pattern="yyyy/MM/dd HH시 mm분"/></div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<c:if test="${not empty userName }">
						<hr>
						<div class="comment-writing-container d-flex align-items-center justify-content-between">
							<div class="comment-write-container col-8 ml-5">
								<input type="text" class="comment-write-section" id="commentInput-${detailFeed.feed.id }" placeholder="댓글 달기 ...">
							</div>
							<div class="comment-postBtn-container col-2">
								<button type="button" data-feed-id="${detailFeed.feed.id }" class="commentPostBtn btn btn-primary">게시</button>
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
	
	<!-- Modal -->
	<div class="modal fade" id="moreMenuModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
      		<div class="modal-body text-center">
        		<button type="button" class="deletePostBtn text-danger" id="feedDeleteBtn">삭제하기</button>
      		</div>
    		</div>
  		</div>
	</div>
		
	<script>
		$(document).ready(function(){
			
			
			$(".moreMenuBtn").on("click",function(e){
				e.preventDefault();
				var feedId = $(this).data("feed-id");
				$("#feedDeleteBtn").data("feed-id", feedId);
				
			});
			
			$("#feedDeleteBtn").on("click",function(e){
				e.preventDefault();
				var feedId = $("#feedDeleteBtn").data("feed-id");

				$.ajax({
					type:"get",
					url:"/feed/delete",
					data:{"feedId":feedId},
					success:function(data){
						if(data.result=="success"){
							alert("피드 삭제 성공");
							location.reload();
						}else{
							alert("피드 삭제 실패");
						}
					},
					error:function(e){
						alert("error");
					}
				});
			});
			
			$("#imagePostBtn").on("click",function(){
				
				$("#fileInput").click();
				
			});
			
			
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
			
			$(".likeBtn").on("click",function(e){
				
				e.preventDefault();
				
				var feedId = $(this).data("feed-id");
				
				$.ajax({
					
					type:"get",
					url:"/feed/like",
					data:{"feedId":feedId},
					success:function(data){
						if(data.result=="success"){
							location.reload();
						}else{
							alert("좋아요 등록 에러");
						}
					},
					error:function(e){
						alert("error");
					}
				});
				
			});
			
			$(".likedLikeBtn").on("click",function(e){
				
				e.preventDefault();
				
				var feedId = $(this).data("feed-id");
				
				$.ajax({
					type:"get",
					url:"/like/delete",
					data:{"feedId":feedId},
					success:function(data){
						if(data.result=="success"){
							location.reload();
						}else{
							"좋아요 취소 실패";
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