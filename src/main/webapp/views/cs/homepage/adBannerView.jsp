<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.us.cs.homepage.model.vo.Banner, java.util.ArrayList" %>
<%
	ArrayList<Banner> list = (ArrayList<Banner>)request.getAttribute("list");
	String successMsg = (String)session.getAttribute("successMsg");
	String errorMsg = (String)session.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>배너 관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/resources/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Modal -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- Modal -->

<!-- My Style -->
<style>
.banner-manage-body {
	padding-top: 50px;
	margin: auto;
}

#datatablesSimple {
	color: #404040;
}

#add-btn {
	width: 100px;
	height: 40px;
	border: 0px;
	border-radius: 5px;
	background-color: #778C79;
	color: #F2F2F2;
	font-weight: bold;
}

.dataTable-info {
	visibility: hidden;
}

.modal-body {
	padding-top: 50px;
	width: 80%;
	margin: auto;
}

.thumbnail-img {
	width: 100%;
	margin: auto;
	height: 100px;
	border: 1px solid black;
}

#banner-status * {
	display: inline-block;
	margin-top: 30px;
}

.modal-body p {
	font-weight: bold;
}
</style>
<!-- My Style -->
</head>
<body>
	<%@ include file="../../common/adminMenubar.jsp"%>
	<div id="layoutSidenav">
		<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<div class="banner-manage-body" style="width: 800px;">
					<h1 class="mt-4" style="padding-top: 50px;">배너 관리</h1>
					<hr>
					<table id="datatablesSimple" class="banner-manage ">
						<thead>
							<tr>
								<th width="10px">NO</th>
								<th width="100px;">상태</th>
								<th width="600px;">이미지</th>
							</tr>
						</thead>
						<tbody>
							<% for(Banner b : list){ %>
							<tr>
								<td class="baNo"><%=b.getBnNo()%></td>
								<td id="baSt"><%=b.getBnStatus()%></td>
								<td height="150px;">
									<div class="activate-edit-modal" data-toggle="modal" data-target="#edit-banner">
										<img src="<%=b.getBnImgURL()%>" style="height:100%; width:400px;">
									</div>
								</td>
							</tr>
							<% } %>
						</tbody>
					</table>
	
					<div align="right">
						<button type="button" id="add-btn" data-toggle="modal" data-target="#add-banner">배너 등록</button>
					</div>
	
					<br> <br> <br> <br> <br>
				</div>
	
				<!-- 페이징 처리 필요 없음 -->
	
			</div>
		</main>
	</div>
	
	<!-- START SCRIPT AREA FOR EDIT MODAL -->
	<script>
		$(function(){
			
			$(".activate-edit-modal").click(function(){
				$("#banner-no").val( $(this).parent().siblings(".baNo").text() );
				$("#thumbnail-img").attr("src", $(this).children("img").attr("src") );
				
				if( $(this).parent().siblings("#baSt") == 'Y' ){
					$("option[value='Y']").attr("selected", true);
				}else{
					$("option[value='Y']").attr("selected", false);
					$("option[value='N']").attr("selected", true);
				}
			})
			
			
		})
	</script>
	<!-- END SCRIPT AREA -->
	
	<!-- ========== START MODAL AREA ========== -->
	<!-- Modal - Edit Banner -->
	<div class="modal" id="edit-banner">
		<div class="modal-dialog">

			<!-- Modal Content - Edit Banner -->
			<div class="modal-content">
				<form action="<%=contextPath%>/edit.bn" method="post" enctype="multipart/form-data">
					<div class="modal-header"><h3 class="modal-title">배너 수정</h3></div>
					<input type="hidden" name="banner-no" value="" id="banner-no">
					
					<div class="modal-body">
						<p>배너 이미지 수정</p>
						<div>
							<img class="thumbnail-img" src="" onclick="$('#eidt-img').click();" id="thumbnail-img">
							<input type="file" name="banner-img" id="eidt-img" onchange="loadImg(this);" style="display:none">
							<!-- 파일 업로드하면 업로드된 사진이 썸네일에 변경되어 보여야 함 -->
						</div>
						
						<div class="banner-status">
							<p style="padding-right: 10px;">배너 상태 수정</p>
							<select name="banner-status" id="bn-status">
								<option value="Y">공개</option>
								<option value="N">삭제</option>
							</select>
						</div>
					</div>
					
					<div class="modal-footer">
						<button type="submit" class="btn btn-default">수정하기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">돌아가기</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- Modal - Insert Banner -->
	<div class="modal" id="add-banner">
		<div class="modal-dialog">

			<!-- Modal Content - Insert Banner -->
			<div class="modal-content">
				<form action="<%=contextPath%>/insert.bn" method="post" enctype="multipart/form-data">
					<div class="modal-header"><h3 class="modal-title">배너 등록</h3></div>
					
					<div class="modal-body">
						<p>배너 이미지 등록</p>
						<div>
							<img class="thumbnail-img" onclick="$('#insert-img').click();">
							<input type="file" name="banner-img" id="insert-img" onchange="loadImg(this);" style="visibility: hidden;" required>
							<!-- 파일 업로드하면 업로드된 사진이 썸네일에 변경되어 보여야 함 -->
						</div>
						
						<div class="modal-footer">
							<button type="submit" class="btn btn-default">등록하기</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">돌아가기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
	</div>
	<!-- ========== END MODAL CONTENT AREA ========== -->


	<!-- ========== START MODAL SCRIPT AREA ========== -->
	<script>
		// 썸네일에 선택한 이미지 미리보기하는 함수
		function loadImg(inputFile){
            if(inputFile.files.length == 1){
                const reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
				
                reader.onload = function(e){
                	$(".thumbnail-img").attr("src", e.target.result);
                }

            }else{
           		$(".thumbnail-img").attr("src", null);     
            }
        };
        
        
		// 요청처리 완료 후 성공/실패 메시지를 출력하는 함수
		$(function(){
			<% if(successMsg != null) { %>
				alert("<%= successMsg %>");
				 <% successMsg = null; %> 
			<% } %>
			
			<% if(errorMsg != null){ %>
				alert("<%= errorMsg %>");
				<% errorMsg = null; %>
			<% }%>			
		})
		
		
	</script>

</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
