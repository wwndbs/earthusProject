<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String proCode = (String)request.getAttribute("code");
	String proName = (String)request.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의 작성 - Earth.Us</title>

<style>
  input[type=checkbox] {cursor:pointer;}
  label {cursor:pointer;}

  .btn-white {
    background:#f2f2f2;
    color:#404040;
  }

  .btn-green {
    background:#778C79;
    color:#f2f2f2;
  }

  .modal-content {
    background:lightgray !important;
    text-align:center !important;
  }
  .modal-footer {
  	width:100% !important;
  	color:#404040 !important;
  }
  .modal-footer>a {
  	width:50% !important;
  	background:#778C79 !important;
  	color:white !important;
  }
  
</style>

</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="product_qna_area section_padding">
	  <div class="container" style="padding-top:100px; padding-bottom:50px;">
	    <h3><b>상품 문의 작성</b></h4>
	    <br>
	    <hr>
	    <br>
	
	    <form action="/insert.pq" method="post" id="pro-qna-form">
	    <div class="container form-group" style="padding:50px;">
	        <p style="font-weight:bold; font-size:large; color:#778C79">[<%=proName%>]</p>
	        <hr style="padding:5px 0px;">
	        <input type="text" class="form-control" name="proQnaTitle" placeholder="제목을 입력해 주세요." required>
	        <br>
	        <textarea class="form-control" name="proQnaContent" rows="7" placeholder="문의 사항을 입력해 주세요. (20자 이상 150자 이하)" style="resize:none;" required></textarea>
	        
	        <br><hr><br>
	
	        <input type="checkbox" name="private" id="private" onclick="checkPrivate();"> <label for="private" style="font-size:small;" onclick="checkPrivate();">비밀글</label>
	        &nbsp;&nbsp; <input type="password" name="proQnaPwd" id="proQnaPwd" placeholder="비밀번호 숫자 네자리 입력" style="width:170px;" readonly>
	      
	        <br><br>
	        <p>성함을 입력해 주세요. (필수)</p>
	        <input type="text" class="form-control" name="proQnaWriterName" required>
	        <br>
	
	        <p><b>답변 소식을 받을 연락처를 기재해 주세요. (하나 이상 선택)</b></p>
	        <input type="email" class="form-control" name="proQnaEmail" placeholder="이메일 입력"><br>
	        <input type="phone" class="form-control" name="proQnaPhone" placeholder="핸드폰 번호 입력">
	        <br><br>
	
	
	        <div style="font-size:small; color:gray;">
	          Earth.Us는 24시간 이내(주말제외)로 대응하기 위해 노력하고 있습니다. <br>
	          대표전화 (02-1234-5678)로 편하게 문의하실 수 있습니다. <br>
	          상품에 대한 악의적인 비방이나 욕설은 별도의 통보없이 삭제될 수 있습니다.
	        </div>
	      </div>
	
	      <div id="pro-qna-btn">
	        <button type="button" data-toggle="modal" data-target="#proQnaModal" class="pro-qna-btn" style="background:#f2f2f2;">취소</ㅍ>
	        <button class="pro-qna-btn" onclick="return validate();" style="background:#778C79; color:#f2f2f2;">등록</button>
	      </div>
	
	      <!-- 취소 버튼 모달 시작 -->
	        <div class="modal fade" id="proQnaModal">
	          <div class="modal-dialog modal-sm">
	            <div class="modal-content">
	            
	              <!-- Modal Header -->
	              <div class="modal-header">
	                <h4 class="modal-title">작성을 취소하시겠습니까?</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	              </div>
	              
	              <!-- Modal body -->
	              <div class="modal-body" >
	                변경 사항이 저장되지 않을 수 있습니다.
	              </div>
	              <!-- Modal footer -->
	              <div class="modal-footer">
	                <button type="button" class="btn btn-sm" data-dismiss="modal" style="width:50%; background:lightgray;">취소</button>
	                <a href="<%=contextPath%>/detail.pro?proCode=<%=proCode%>" type="button" class="btn btn-sm">확인</a>
	              </div>
	              
	            </div>
	          </div>
	        </div>
	      <!-- 취소 버튼 모달 끝 -->
	
	    </form>
	  </div>
	</div>

<script>

    function checkPrivate(){ // 비밀글 체크 여부 검사 (잘됨)
        

        if($("input[name=private]").is(':checked')){ // 비밀글 체크 O
  
          $('#proQnaPwd').attr("readonly", false);
          $('#proQnaPwd').css("background", "white");
          
        }else { // 비밀글 체크 X
  
          $("#proQnaPwd").attr("readonly", true);
          $("#proQnaPwd").css("background", "");
  
        }
    } 

    function validate(){ // 등록 버튼 클릭 시 유효성 검사 (안됨)

		let proQnaTitle = $('input[name=proQnaTitle]').val();  // 제목
        let proQnaContent = $('textarea[name=proQnaContent]').val(); // 문의 사항
        let proQnaPwd = $('input[name=proQnaPwd]').val();      // 비밀번호
        let proQnaWriterName = $('input[name=proQnaWriterName]').val(); // 작성자명
        let proQnaEmail = $('input[name=proQnaEmail]').val();  // 이메일
        let proQnaPhone = $('input[name=proQnaPhone]').val();  // 휴대폰 번호
  
        const regExp1 = "/^{20,150}$/"; // 20자 이상, 150자 이하
       	const regExp2 = "";
		
        if(proQnaTitle == ""){ // 제목 미입력
        	
        	alert("제목을 입력해 주세요."); return false;
        	
        }else if(proQnaContent == ""){ // 문의사항 미입력
        	
        	alert("문의 내용을 입력해 주세요."); return false;
        	
        }else if( proQnaContent.length < 20 || proQnaContent.length > 150 ) { // 문의 사항 글자수 비일치

            alert("문의 사항을 20자 이상 150자 이하로 작성해 주세요."); return false;
            
        } else if( $('input[name=private]').is(":checked") ){ // 비밀글 체크됐을때
        	
        	if(proQnaPwd == ""){ // 비밀번호 미입력
        		
        		alert("비밀번호를 입력해 주세요."); return false;
        		
        	}else if( proQnaWriterName = "" ){ // 작성자명 미입력
            	
            	alert("성함을 입력해 주세요."); return false;
            	
            }else if( proQnaEmail.val() = "" && proQnaPhone().val() = ""  ){ // 연락처 미입력
            	
            	alert("연락처를 입력해 주세요."); return false;
            }
        
        
        }
        
        
		return true;
    }
    
</script>

<!----------------- 모달 모음 ------------------->
<!------- 제목 null Modal ------->
<div class="modal" id="proQnaTitleModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal body -->
     <div class="modal-body" style="text-align:center; padding:50px 0px; line-height:30px;">
       로그인된 회원만 이용 가능합니다.
     </div>
     
     <!-- Modal footer -->
     <div class="modal-footer" style="display:inline-block; text-align:center;">
       <button type="button" class="btn btn_2" id="goToCart" data-dismiss="modal">확인</button>
       <button type="button" class="btn btn_2" data-dismiss="modal">취소</button>
     </div>
     
    </div>
  </div>
</div>
<!------- 장바구니 끝 ------->

<!----------------- 모달 모음 끝 ----------------->

	
	<%@ include file="../common/footerbar.jsp" %>

</body>
</html>