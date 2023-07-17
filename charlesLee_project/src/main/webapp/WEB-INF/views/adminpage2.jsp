<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/mypage.css" type="text/css">


</head>
<body>
	<!-- Page Preloder -->
	<!-- <div id="preloder">
        <div class="loader"></div>
    </div> -->

	<!-- Header Section Begin -->
	<%@ include file="header.jsp"%>
	<!-- Header Section End -->

	<div class="container" style="padding: 0;">
		<div class="row">
			<div class="col-lg-12">
				<div
					style="display: flex; justify-content: flex-start; align-items: center; height: 100vh; margin-left: 20px;">

						
						<div class="mypage-box" style="height: 700px;">
							<div class="mypage-item">
								<h3>문의 사항</h3>
								<!-- 내 정보 내용 추가 -->
								<a href="/adminpage1">문의사항 관리페이지</a>
							</div>
							<div class="mypage-item">
								<h3>회원가입 신청</h3>
								<a href="/adminpage2">비치니스 회원가입 신청 페이지</a>
							</div>
							<div class="mypage-item">
								<h3>팝업스토어</h3>
								<a href="/adminpage4">팝업스토어 신청 페이지</a>
							</div>
						</div>
						 <h2 align="center" style="margin-top: -600px; text-align: right;">비지니스 회원 관리페이지</h2>
							<table align="center" border="0" cellpadding="5" cellspacing="2" width="100%" bordercolordark="white" bordercolorlight="black">
							<tr>
						        <td bgcolor="#7fad39">
						            <p align="center">
						            <font color="white"><b><span style="font-size:12pt;">회원번호</span></b></font></p>
						        </td>
						        <td bgcolor="#7fad39">
						            <p align="center"><font color="white"><b><span style="font-size:12pt;">닉네임</span></b></font></p>
						        </td>
						        <td bgcolor="#7fad39">
						            <p align="center"><font color="white"><b><span style="font-size:12pt;">이메일</span></b></font></p>
						        </td>
						        <td bgcolor="#7fad39">
						            <p align="center"><font color="white"><b><span style="font-size:12pt;">아이디</span></b></font></p>
						        </td>
						        <td bgcolor="#7fad39">
						            <p align="center"><font color="white"><b><span style="font-size:12pt;">상태번호</span></b></font></p>
						        </td>
						    </tr>
							
							<!-- 부서 객체 유무 검증 -->
							<c:if test="${empty requestScope.member}">    
								<tr>
							        <td colspan="5">
							            <p align="center"><b><span style="font-size:12pt;">객체가 존재하지 않습니다.</span></b></p>
							        </td>
							    </tr>
							</c:if>
							<!-- 반복 출력 -->
							<c:forEach items="${requestScope.member}" var="member">
								    <tr>
								    	<td bgcolor="">
								            <p align="center">
									            <span style="font-size:12pt;">
									            	<!-- 부서번호 -->
									            	<b>${member.memberNum}</b>
									            </span>
								            </p>
								        </td>
								        <td bgcolor="">
								            <p align="center">
									            <span style="font-size:12pt;">
									            	<!-- 부서번호 -->
									            	<b>${member.memberNickname}</b>
									            </span>
								            </p>
								        </td>
								        <td bgcolor="">
											<p align="center">
												<span style="font-size:12pt;">
													<!--
														부서명 클릭 시, 부서번호로 해당부서 상세정보 출력
													 -->
													<b>
														${member.memberEmail}
													</b>
												</span>
											</p>
								        </td>
								        <td bgcolor="">
								            <p align="center">
								            	<span style="font-size:12pt;">
								            		<!-- 부서위치 -->
								             		<b>${member.memberId}</b>
								             	</span>
								             </p>
								        </td>
								        <td bgcolor="">
								            <p align="center">
								            	<span style="font-size:12pt;">
								            		<!-- 부서위치 -->
								             		<b>${member.memberType}</b>
								             	</span>
								             </p>
								        </td>
								         <td bgcolor="">
								            <p align="center">
								            	<span style="font-size:12pt;">
								            		<!-- 부서위치 -->
								             		<button data-user-id ="${member.memberNum}" type="button" value="승인" class="appro" >승인 </button>
							                		<button data-user-id ="${member.memberNum}" type="button" value="거부" class="deni" >거부</button>
								             	</span>
								             </p>
								        </td>
								    </tr>
						    </c:forEach>
						</table>
				</div>

				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
				<script>
				$(document).ready(function(){
					  
					  $('.appro').click(function() {
							
				    	  const dropId = $(this).data("userId");
				        	console.log(dropId);
				           	$.ajax({
				        		type : 'post',
				        		url : '<c:url value="businessupate" />',
				        		data : {
				            		id : dropId,
				            	},
				            	success : function(data){
				            		console.log('test');
				            	},error : function(status, error) {
				      				
				      				console.log(status, error);
				      			}
				  		}); //end ajax
				  		
					  });
					  
					});
				$(document).ready(function(){
					  
					  $('.deni').click(function() {
							
				    	  const dropId = $(this).data("userId");
				        	console.log(dropId);
				           	$.ajax({
				        		type : 'post',
				        		url : '<c:url value="businessdelete" />',
				        		data : {
				            		id : dropId,
				            	},
				            	success : function(data){
				            		console.log('test');
				            	},error : function(status, error) {
				      				
				      				console.log(status, error);
				      			}
				  		}); //end ajax
				  		
					  });
					  
					});
				</script>
</body>
</html>