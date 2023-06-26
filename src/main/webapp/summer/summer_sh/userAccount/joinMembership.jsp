<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>SUMMER 그룹웨어 회원가입</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 사용자 회원가입 폼 -->
	<div class="container body-top">
		
		<form action="#" method="post" id="form">
			<fieldset>
				<legend class="text-center">SUMMER 그룹웨어 회원가입</legend>
				<p>(*)은 필수 요소입니다.</p>
				<div class="form-group">
					<label for="userId">아이디 입력(*) </label>
					<!-- 아이디 중복체크 start -->
					<span id="idDuplCheck"></span>
					<!-- 아이디 중복체크 end -->
					<input type="text" class="form-control" id="userId" name="id" placeholder="사용할 아이디를 입력해주세요"/>
				</div>
				
				<div class="form-group">
					<label for="userPass">비밀번호 입력(*)</label>
					<input type="password" class="passForm form-control" id="userPass" name="pass" placeholder="비밀번호를 입력해주세요"/>
				</div>
				
				<div class="form-group">
					<label for="passCheck">비밀번호 확인(*) </label><span id="passConfirm"></span>
					<input type="password" class="passForm form-control" id="passCheck" name="passCheck" placeholder="비밀번호를 확인해주세요."/>
				</div>
				<div class="form-group">
					<label for="userName">이름 입력(*)</label>
					<input type="text" class="form-control" id="userName" name="name" placeholder="이름을 입력해주세요"/>
				</div>
				<div class="form-group">
					<label for="userBirth">생년월일 입력(*)</label>
					<!-- max=""을 통해 생일을 금일 날짜 이후는 선택 할 수 없도록 설정 -->
					<input type="date" class="form-control" id="userBirth" name="birth" max="" />
				</div>
				<div class="form-group">
					<label for="position">직책 입력(*)</label> <br/>
					<input type="radio" name="position" value="1" id="ceo"> 
					<label for="ceo">사장</label>
					<input type="radio" name="position" value="2" id="gm"> 
					<label for="gm">부장</label>
					<input type="radio" name="position" value="3" id="gmm"> 
					<label for="gmm">과장</label>
					<input type="radio" name="position" value="4" id="am"> 
					<label for="am">대리</label>
					<input type="radio" name="position" value="5" id="sm" checked> 
					<label for="sm">사원</label>
				</div>
				<div class="form-group">
					<label for="userSex">성별 입력(*)</label> <br/>
					<label for="male">남자</label>
					<input type="radio" name="userSex" value="1" id="male" checked> 
					<label for="femail">여자</label>
					<input type="radio" name="userSex" value="2" id="femail"> 
				</div>
				<div class="form-group">
					<label for="userEmail">이메일 입력(*)</label>
					<input type="email" class="form-control" id="userEmail" name="email" placeholder="이메일을 입력해주세요"/>
				</div>
				<div class="form-group">
					<label for="userPhone">휴대전화번호 입력(*)</label>
					<input type="text" class="form-control" id="userPhone" name="phonenum" placeholder="휴대전화번호를 입력해주세요"/>
				</div>
				<div class="form-group">
					<div style="width:200px;">
						<label for="userPostnum">우편번호 입력(5자리)(*)</label>
						<input type="text" class="form-control" id="userPostnum" name="postnum" placeholder="우편번호를 입력해주세요" maxlength="5"/>
					</div>
				</div>
				<div class="form-group">
					<label for="userPostnum">도로명 주소 입력(*)</label>
					<input type="text" class="form-control" id="basic_userAddr" name="basic_addr" placeholder="주소를 입력해주세요." readonly/>
				</div>
				<div class="form-group">
					<label for="userAddr">상세주소 입력(*)</label>
					<input type="text" class="form-control" id="userAddr" name="addr" placeholder="상세주소를 입력해주세요"/>
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-success form-control" value="계정 생성"/>
				</div>
				<div class="text-center">
					<p><a href="javascript:history.go(-1)" class="btn btn-danger form-control" id="cancle" title="처음으로 돌아갑니다..">취소</a></p>
				</div>
			</fieldset>
		</form>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		$(document).ready(function(){
			//우편번호 입력
			$("#userPostnum").on("click",function(){
				new daum.Postcode({
			        oncomplete: function(data) {
			        	$("#userPostnum").val(data.zonecode);
			            $("#basic_userAddr").val(data.roadAddress);
			            $("#userAddr").focus();
			        }
			    }).open();
			});
			$("#basic_userAddr").on("click",function(){
				$("#userPostnum").click();
			});
			// 아이디 중복 확인 START
			$("#userId").on("keyup",function(){
				if ($("#userId").val().trim()!=""){
					$.ajax({
						url:"${pageContext.request.contextPath}/#",
						type:"get",
						dataType:"text",
						data:{"id":$('#userId').val()},
						success:function(data){
							$("#idDuplCheck").html(data);
						},
						error:function(xhr,textStatus,errorThrown){
							$("#idDuplCheck").html(xhr.status + "-"+textStatus+":"+errorThrown);
						}
					});
				}
			});
			// 아이디 중복 확인 END
			
			// 비밀번호 입력 확인
			$(".passForm").on("keyup",function(){
				if ($("#userPass").val()!="" && $("#passCheck").val()!="" ){
					//비밀번호와 비밀번호 재입력이 같지 않다면
					if($("#userPass").val()!=$("#passCheck").val()){
					   $("#passConfirm").css("color","red");
					   $("#passConfirm").html(" 비밀번호를 다시 확인해주세요");
					   $("#passConfirm").attr("data-check","false");
					} else { //비밀번호 재입력과 비밀번호가 같다면
					   $("#passConfirm").css("color","green");
					   $("#passConfirm").html(" 비밀번호가 일치합니다.");
					   $("#passConfirm").attr("data-check","true");
					}
				}
			});
			
			// 날짜를 오늘 날짜 이후로 설정 할 수 없도록 막음
			$("#userBirth").attr("max", new Date().toISOString().split("T")[0]);
			
			// 빈칸 검사 START
			$("#form").on("submit",function(){
				
				// 아이디 빈칸 검사 START
				if ($("#userId").val().trim()==""){ 
					$("#userId").focus();
					alert('아이디를 입력해주세요.');
					return false;
				}
				// 아이디 빈칸 검사 END
				
				// 아이디 중복 검사 START
				else if ($("#id_check").data("check") != 'checked'){
						 $("#userId").focus();
						 alert ('아이디가 중복되어있습니다.');
						 return false;
				}
				// 아이디 중복 검사 END
				
				// 비밀번호 빈칸 검사 START
				else if ($("#userPass").val().trim()==""){ 
						 $("#userPass").focus();
						 alert('비밀번호를 입력해주세요.');
						 return false;
				}
				// 비밀번호 빈칸 검사 END
				
				// 비밀번호 확인 START
				else if ($("#passConfirm").attr("data-check") != 'true'){
						 $("#userPass").focus();
						 alert ('비밀번호가 일치하지 않습니다.');
						 return false;
				}
				// 비밀번호 확인 END
				
				// 이름 빈칸 검사 START
				else if ($("#userName").val().trim()==""){
						 $("#userName").focus();
						 alert('이름을 입력해주세요.');
						 return false;
				}
				// 이름 빈칸 검사 END
				
				// 생일 빈칸 검사 START
				else if ($("#userBirth").val()==""){ 
						 $("#userBirth").focus();
						 alert('생일을 입력해주세요.');
						 return false;
				}
				
				// 생일 빈칸 검사 END
				
				// 이메일 빈칸 검사 START
				else if ($("#userEmail").val()==""){ 
					 	 $("#userEmail").focus();
						 alert('이메일을 입력해주세요.');
						 return false;
				}
				//이메일 빈칸 검사 END
				
				// 휴대전화 빈칸 검사 START
				else if ($("#userPhone").val()==""){
						 $("#userPhone").focus();
						 alert('휴대전화번호를 입력해주세요.');
						 return false;
				}
				// 휴대전화 빈칸 검사 END
				
				// 우편번호 빈칸 검사 START
				else if ($("#userPostnum").val()==""){ 
					 	 $("#userPostnum").focus();
						 alert('우편번호를 입력해주세요.');
						 return false;
				}
				// 우편번호 빈칸 검사 END
				
				//상세주소 빈칸 검사 START
				else if ($("#userAddr").val()==""){ 
						 $("#userAddr").focus();
						 alert('상세주소를 입력해주세요.');
						 return false;
				}
				//상세주소 빈칸 검사 END
			});						
		});
		// 빈칸 검사 END
		</script>
	</div>
	<!-- 사용자 회원가입 폼 -->

</body>
</html>