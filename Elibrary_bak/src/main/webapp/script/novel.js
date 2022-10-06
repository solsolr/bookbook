function novelCheck() {
//	if($('#usubtitle').val() == '') {
//		alert('부제목을 입력하세요.');
//		return false;
//	}
	if($('#ucontent').val() == '') {
		alert('내용을 입력하세요.');
		return false;
	}
	if($('#uimage').val() == '') {
		alert('이미지를 입력하세요.');
		return false;
	}
}

function novelinsertCheck() {
	if($('input[name=uscale]:checked').length < 1) {
		alert('장/단편을 선택하세요.');
		return false;
	}
	if($('#utitle').val() == '') {
		alert('제목을 입력하세요.');
		return false;
	}
	if($('#ucontent').val() == '') {
		alert('내용을 입력하세요.');
		return false;
	}
	if($('#uimage').val() == '') {
		alert('이미지를 입력하세요.');
		return false;
	}
}
