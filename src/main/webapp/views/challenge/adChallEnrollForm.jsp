<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
    .enrollForm {
        margin-left: 20%;
    }
    .enrollForm p {
        font-size: 17px;
        font-weight: bold;
    }
</style>
</head>
<body>

	<%@ include file="/views/common/adminMenubar.jsp" %>

	<div id="layoutSidenav">
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <br>
                    <h3 class="mt-4" style="font-weight:bold;">챌린지 관리 > 등록</h3>
                    <hr><br>
                    <div class="enrollForm">
                        <form action="<%=contextPath%>/insert.ch" method="post" id="enrollForm" enctype="multipart/form-data">
                            <p>제목</p>
                            <input type="text" name="title" style="width:700px" required>
                            <br><br>

                            <p>내용</p>
                            <textarea name="content" rows="10" style="width:700px; resize: none;"></textarea>
                            <br><br>

                            <p>지급할 포인트</p>
                            <input type="number" name="point" min="500" step="500" placeholder="최소 500P부터 500P 단위로 입력" style="width:200px" required> P
                            <br><br><br>

                            <p>썸네일 이미지</p>
                            <input type="file" name="file1" onchange="loadImg(this);" required>
                            <br><br><br>
                            
                            <p>게시글 내 이미지</p>
                            <input type="file" name="file2" required>
                            <br><br><br>
                        
                            <div style="width:400px; text-align:center;">
                                <img src="" id="thumbnailImg" width="400px" height="265px" onclick="chooseFile();"><br>
                                <span>썸네일 미리보기</span>
                            </div>
                            <br>
                        
                            <button type="button" class="btn_admin_cancel" style="margin-left:2%" id="btn_cancle">취소</button>
                            <button type="button" class="btn_admin_enroll" data-bs-toggle="modal" data-bs-target="#jyModal_confirm">등록</button>

                            <!-- 모달: 등록 컨펌 -->
		                    <div class="modal" id="jyModal_confirm">
		                        <div class="modal-dialog modal-dialog-centered">
		                            <div class="modal-content">
		                                <!-- Modal Header -->
		                                <div class="modal-header">
		                                <button type="button" class="modal_close" data-bs-dismiss="modal" style="margin-left: 95%;">&times;</button>
		                                </div>
		                                <!-- Modal body -->
		                                <div class="modal-body" style="text-align: center;">
		                                등록하시겠습니까?
		                                </div>
		                                <!-- Modal footer -->
		                                <div class="modal-footer">
		                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
		                                <button type="button" class="btn btn-dark" id="realEnroll">확인</button>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <!-- 모달 끝 -->

                            <script>
                                function chooseFile(){
                                    $("input[name=file1]").click();
                                }

                                function loadImg(inputFile){
                                    // inputFile : 현재 변화가 생긴 input type="file" 요소객체
                                    if(inputFile.files.length == 1){ // 파일 선택된 경우 => 읽어들여서 미리보기
                                        const reader = new FileReader();
                                        reader.readAsDataURL(inputFile.files[0]);
                                        reader.onload = function(e){
                                            $("#thumbnailImg").attr("src", e.target.result);
                                        }
                                    }else { // 파일 취소된 경우 => 미리보기 사라지게
                                        $("#thumbnailImg").attr("src", null);
                                    }
                                }
                                        
                                $(function(){
                                    // 취소
                                    $("#btn_cancle").click(function(){
                                        window.history.back();
                                    })

                                    // 등록 컨펌 모달 > 확인 버튼 클릭시 제출
                                    $("#realEnroll").click(function(){
                                        $("#enrollForm").submit();
                                    })

                                })
                            </script>
                        </form>
                  </div>
               </div>
            </main>
            <br><br>
        </div>
	</div>
</body>
</html>