<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.us.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String modalMsg = (String)session.getAttribute("modalMsg");
	String modalId = (String)session.getAttribute("modalId");
%>
<!DOCTYPE html>
<html>
<head>

<!-- 파일 경로 contextPath 앞에 넣기 -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Earth.Us</title>
    <link rel="icon" href="<%= contextPath %>/resources/img/sub_logo.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/bootstrap_sumin.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/flaticon.css">
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/style_sumin.css">
    <!-- pretendard font -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/font-pretendard.css">
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/u_css_sumin/font-awesome.min.css">
    <%-- <link rel="stylesheet" href="<%= contextPath %>/resources/css/u_css_sumin/nice-select.css"> --%>
    <!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
</head>

<body>

	<!--::header part start::-->
    <header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">

                        <div class="collapse navbar-collapse main-menu-item menubar-style" id="navbarSupportedContent" >
                        
                            <!-- *************메뉴바 들어가는 데에 class menubar-style 부여하기*************** -->
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="<%= contextPath%>/info.hm">aboutUs</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="<%= contextPath %>/list.pro?categoryNo=5&cpage=1" id="navbarDropdown_1"
                                       aria-haspopup="true" aria-expanded="false">
                                        Shop
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="<%= contextPath %>/list.pro?categoryNo=1&cpage=1"> Hair</a>
                                        <a class="dropdown-item" href="<%= contextPath %>/list.pro?categoryNo=2&cpage=1">Body</a>
                                        <a class="dropdown-item" href="<%= contextPath %>/list.pro?categoryNo=3&cpage=1">Kitchen</a>
                                        <a class="dropdown-item" href="<%= contextPath %>/list.pro?categoryNo=4&cpage=1">Bathroom</a>
                                        
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_3"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Community
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                        <a class="dropdown-item" href="<%= contextPath %>/list.ch?cpage=1">챌린지</a>
                                        <a class="dropdown-item" href="<%= contextPath %>/list.co?cpage=1">콘텐츠</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="javascript:void(0)" id="navbarDropdown_2"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Contact
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
                                        <a class="dropdown-item" href="<%= contextPath %>/list.no"> 공지사항</a>
                                        <a class="dropdown-item" href="<%= contextPath %>/list.fq">자주묻는질문</a>
                                        <a class="dropdown-item" href="<%= contextPath %>/list.qa?qpage=1">Q&A</a>
                                    </div>
                                </li>

                                
                            </ul>
                        </div>

                         <!-- 메뉴바 로고-->
                         <!-- 메뉴바 로고 들어가는 데 class menubar-logo 부여하기 -->
                            <a class="navbar-brand container menubar-logo" href="<%= contextPath %>"> 
                            <img src="<%= contextPath %>/resources/img/logo.png" alt="logo" style="width:250px;"> </a>
                         <button class="navbar-toggler" type="button" data-toggle="collapse"
                             data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                             aria-expanded="false" aria-label="Toggle navigation">
                             <span class="menu_icon"><i class="fas fa-bars"></i></span>
                         </button>
                        

                        <!-- 메뉴바 아이콘 -->
                        
                            <div>
                            <div class="collapse navbar-collapse main-menu-item">
                                <ul class="navbar-nav main-menu main-menu-item">
        
        							<!-- 로그인 됐을 때와 안됐을 때의 메뉴바 차이 -->
                                       <% if(loginUser == null){	// 로그인되지 않은 상태 %>
                                    		<li class="nav-item">
	                                        	<a class="nav-link" href='<%= contextPath %>/goLogin.me'>
	                                            	Login
	                                        	</a>
	                                        </li>
                                       <% } else { // 로그인 된 상태 %>
	                                        <!-- 로그인 후 로그아웃으로 변함 -->
	                                        <li class="nav-item">
	                                        	<a class="nav-link" href="<%= contextPath %>/logout.me">
	                                            	Logout
	                                        	</a>
	                                        </li>
                                       <% } %>
                                        	
                                        	
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%= contextPath %>/enrollForm_1.me">
                                            Join
                                        </a>
                                    </li>
                                </ul> 
                            </div>
                            </div>

                            <div class="hearer_icon d-flex">
                            <!-- 검색 -->
                            <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <!-- 위시리스트-->
                            <% if(loginUser == null) { // 로그인 전 %>
                            	<a href="<%=contextPath%>/goLogin.me"><i class="ti-heart"></i></a>
                            <% } else { // 로그인 후 %>
                            	<a href="<%=contextPath%>/wish.pr" id="lsuccess"><i class="ti-heart"></i></a>
                            <% } %>
                            <!-- 장바구니 -->
                                <a href="<%=contextPath%>/list.ct">
                                    <i class="ti-shopping-cart"></i>
                                </a>
                                

                            <!-- 마이페이지 -->
                            <% if(loginUser == null) { 	// 로그인 하지 않은 상태일 때 %>
                            	<a id="myPageIcon" href="<%= contextPath %>/goLogin.me">
	                            	<i class="ti-user"></i>
	                            </a>
	                        <% } else if(loginUser.getUserStatus().equals("M")){	// 관리자일 때 %>
	                            <a id="myPageIcon" href="<%= contextPath %>/main.ad">
	                            	<i class="ti-user"></i>
	                            </a> 
	                        <% } else {%>
	                        	<a id="myPageIcon" href="<%= contextPath %>/myPage.mp">
	                            	<i class="ti-user"></i>
	                            </a> 
	                        <% } %>
	                            
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- 검색창 내려옴 -->
        <div class="search_input" id="search_input_box">
            <div class="container">
                <form class="d-flex justify-content-between search-inner">
                    <input type="text" class="form-control" id="search_input" placeholder="Search Here" onkeyup="enterkey();">
                    <button type="submit" class="btn"></button>
                    <span class="ti-close" id="close_search" title="Close Search"></span>
                </form>
            </div>
        </div>
    </header>
    
    

    <!-- 상품 검색 -->
    <script>
    	// 엔터키 이벤트 제거
        function enterkey(){
        	$('input[type="text"]').keydown(function() {
        		  if (event.keyCode === 13) {
        		    event.preventDefault();
        		  };
        		});
        	
        	if(window.event.keyCode == 13){
        		var keyword = $("#search_input").val();
        		location.href="<%= contextPath %>/list.pro?&cpage=1&categoryNo=5&keyword=" + keyword;
        	}
        }
    </script>
                    

    <!-- Header part end-->
    <!-- 메뉴바 끝 -->

    <!-- jquery plugins here-->
    <script src="<%= contextPath %>/resources/js/jquery-1.12.1.min.js"></script>
     <!--  jquery -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- popper js -->
    <script src="<%= contextPath %>/resources/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="<%= contextPath %>/resources/js/bootstrap.min.js"></script>
    <!-- easing js -->
    <script src="<%= contextPath %>/resources/js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="<%= contextPath %>/resources/js/swiper.min.js"></script>
    <!-- swiper js -->
    <script src="<%= contextPath %>/resources/js/masonry.pkgd.js"></script>
    <!-- particles js -->
    <script src="<%= contextPath %>/resources/js/owl.carousel.min.js"></script>
    <%-- <script src="<%= contextPath %>/resources/js/jquery.nice-select.min.js"></script> --%>
    <!-- slick js -->
    <script src="<%= contextPath %>/resources/js/slick.min.js"></script>
    <script src="<%= contextPath %>/resources/js/jquery.counterup.min.js"></script>
    <script src="<%= contextPath %>/resources/js/waypoints.min.js"></script>
    <!--  <script src="/resources/js/contact.js"></script> -->
    <script src="<%= contextPath %>/resources/js/jquery.ajaxchimp.min.js"></script>
    <script src="<%= contextPath %>/resources/js/jquery.form.js"></script>
    <script src="<%= contextPath %>/resources/js/jquery.validate.min.js"></script>
    <script src="<%= contextPath %>/resources/js/mail-script.js"></script>
    <!-- custom js -->
    <script src="<%= contextPath %>/resources/js/custom.js"></script>
</body>
</html>