<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function zipcodeFind(){
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
				console.log(data);
				//<form>태그의 DOM 객체를 얻어온다.
				var f = document.registFrm;
				f.zipcode.value = data.zonecode;
				f.address1.value = data.address;
				f.address2.focus();
				
				f.sido.value = data.sido;
				f.sigungu.value = data.sigungu;
			}
		}).open();
	}	
	</script>
	<h2>회원가입폼</h2>
	<form name="registFrm">
		우편번호 : <input type="text" name="zipcode" onclick="zipcodeFind()"/> 
		<input type="button" value="우편번호 검색" onclick="zipcodeFind()" /> 
		<br /> 
		주소 1 : <input type="text"	name="address1" /> 
		<br /> 
		주소 2 : <input type="text" name="address2" />
		<br />
		<!-- 회원 로그 분석에 필요한 데이터들 -->
		<input type="hid-den" name="sido" />
		<input type="hid-den" name="sigungu" />
		<hr />
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  		<!-- 
  		링크 작동 안됨. 속도가 느려짐
  		<link rel="stylesheet" href="/resources/demos/style.css">
  		-->
 		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
		<script>
  		$( function() {
    		$( "#birth" ).datepicker({
    			"dateFormat":"yy-mm-dd"
    		});
    		
    		$( "input[type=radio]" ).checkboxradio({
    			icon:false
    		});
  		} );
  </script>
		생년월일 : <input type="text" name="birth" id="birth" />
		
		<hr />
		
		성별 : 
			<label for="gen1"></label>
			<input type="radio" name="gender" id="gen1" value="남" />남
			<label for="gen2"></label>
			<input type="radio" name="gender" id="gen2" value="여" />여
			<label for="gen3"></label>
			<input type="radio" name="gender" id="gen3" value="기타" />기타
		
	</form>
</body>
</html>
















