function memberCheck() {
	if (document.frm.userid.value.length == 0) {
		alert("아이디를 입력하세요.");
		return false;
	}
	if (document.frm.pw.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	return true;
}

function MemberCheck() {
	
	document.frm.userid.value = document.frm.userid.value.trim();
	
	if (document.frm.userid.value.length == 0) {
		alert("아이디를 입력하세요.");
		document.frm.userid.focus();
		
		return false;
	}
	
	if(document.frm.idDuplication.value != "idCheck"){                
		alert("아이디 중복체크를 해주세요.");                
		return false;            
	}
	
	document.frm.nname.value = document.frm.nname.value.trim();
	
	if (document.frm.nname.value.length == 0) {
		alert("닉네임을 입력하세요.");
		return false;
	}
	
	if(document.frm.NnameDuplication.value != "Nnamecheck"){                
		alert("닉네임 중복체크를 해주세요.");                
		return false;            
	}
	if (document.frm.pw.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if (document.frm.pwd.value.length == 0) {
		alert("비밀번호 확인을 입력하세요.");
		return false;
	}
	if(document.frm.pw.value != document.frm.pwd.value ){                
	alert("비밀번호를 동일하게 입력하세요.");                
	return false;            
	}   
	if (document.frm.question.value == 0) {
		alert("질문을 선택하세요.");
		return false;
	}
	if (document.frm.answer.value.length == 0) {
		alert("질문에 대한 답을 입력하세요.");
		return false;
	}
	alert("회원가입이 완료되었습니다.");
	return true;
}

//function OpenidChk(){
//	window.name="parentForm";
//	window.open("jsp/IdCheckPass.jsp", "chkForm", "width=500, height=300, resizable= no, scrollbars =no");
//}

// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.        
// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때        
// 다시 중복체크를 하도록 한다.
        
function inputIdChk(){            
document.frm.idDuplication.value ="idUncheck";        
}

function inputNnameChk(){            
document.frm.NnameDuplication.value ="NnameUncheck";        
}

//책 9장 방식 아이디 중복 체크
function OpenidChk() {
	var str = document.frm.userid.value;

	//공백만 입력된 경우
	var blank_pattern = /^\s+|\s+$/g;
	if(str.replace(blank_pattern, '' ) == "" ){
	    alert('공백만 입력되었습니다.');
	    return false;
	}
	//문자열에 공백이 있는 경우
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test(str) == true){
	    alert('공백이 입력되었습니다.');
	    document.frm.userid.value = document.frm.userid.value.trim();
	    return false;
	}
	
	if (document.frm.userid.value == "") {
		alert('아이디를 입력하여 주십시오.');
		document.form.userid.focus();
		return;
	}
	var url = "idCheck.do?userid=" + document.frm.userid.value;
	var _width = "450";
    var _height = "200";
	var _left = Math.ceil(( window.screen.width - _width )/2);
	var _top = "100";
	window.open(url, "_blank_1",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width="+_width+",height="+_height+",left="+_left+", top="+_top);
}
//id중복체크 공백제거
function blank1(userid){
	opener.frm.userid.value = document.frm.userid.value.trim();
	var str = document.frm.userid.value;
	//문자열에 공백이 있는 경우
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test(str) == true){
	    alert('공백이 입력되었습니다.');
	    opener.frm.userid.value = "";
	    self.close();
	}
}

function idok(userid) {
	opener.frm.userid.value = document.frm.userid.value.trim();
	opener.frm.reid.value = document.frm.userid.value;
	opener.frm.idDuplication.value = "idCheck";
	self.close();
} 
//
// 닉네임 중복 체크
function opeNnameChk() {
	var str = document.frm.nname.value;

	//공백만 입력된 경우
	var blank_pattern = /^\s+|\s+$/g;
	if(str.replace(blank_pattern, '' ) == "" ){
	    alert('공백만 입력되었습니다.');
	    return false;
	}
	//문자열에 공백이 있는 경우
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test(str) == true){
	    alert('공백이 입력되었습니다.');
	    document.frm.nname.value = document.frm.nname.value.trim();
	    return false;
	}
	
	if (document.frm.nname.value == "") {
		alert('닉네임을 입력하여 주십시오.');
		document.form.nname.focus();
		return;
	}
	var url = "nnameCheck.do?nname=" + document.frm.nname.value;
	var _width = "450";
    var _height = "200";
	var _left = Math.ceil(( window.screen.width - _width )/2);
	var _top = "100";
	window.open(url, "_blank_2",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width="+_width+",height="+_height+",left="+_left+", top="+_top);
}

//nickname 중복체크 공백제거
function blank2(nname){
	opener.frm.nname.value = document.frm.nname.value.trim();
	var str = document.frm.nname.value;
	//문자열에 공백이 있는 경우
	var blank_pattern = /[\s]/g;
	if( blank_pattern.test(str) == true){
	    alert('공백이 입력되었습니다.');
	    opener.frm.nname.value = document.frm.nname.value.trim();
	    opener.frm.nname.value = "";
	    self.close();
	}
}

function nnameok(nname) {
	opener.frm.nname.value = document.frm.nname.value;
	opener.frm.reid2.value = document.frm.nname.value;
	opener.frm.NnameDuplication.value = "Nnamecheck";
	self.close();
}
//

function open_win(url, name) {
	var _width = "500";
    var _height = "250";
	var _left = Math.ceil(( window.screen.width - _width )/2);
	var _top = "100";
	window.open(url, name, "width="+_width+ ", height="+_height+",left="+_left+", top="+_top);
}

function idCheck() {
	if (document.frm.pass.value.length == 0) {
		alert("아이디를 입력하세요.");
		return false;
	}
	return true;
}

//회원정보 페이지 비밀번호 체크
function passCheck() {
	if (document.frm.pass.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	return true;
}