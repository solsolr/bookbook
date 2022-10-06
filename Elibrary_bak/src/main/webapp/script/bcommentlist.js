function ReviewCheck() {
	var cstar = $("input[name='cstar']:checked").val();	
	if(cstar == null){
		alert('별점을 입력해주세요.');
		return false;
	}
	if (document.myform.ccontent.value.length == 0) {
		alert("리뷰 내용을 남겨주세요.");
		return false;
	}
	
	var uid = '<%=(String)session.getAttribute("userid")%>';
	if(uid=="null"){ 
	      swal("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요", "error"); 
	      return false;
    }else{
    alert("리뷰가 등록되었습니다.");
	return true;
	}	
	
	//console.log(uid);
}

function ReviewNoCheck(){
	alert("회원 가입 또는 로그인을 해주세요.");
	return false;
}