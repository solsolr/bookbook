<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<body>
<div id="test_page">
    <style>
        #test_page p {
            width: 900px;
        }
    </style>

    <p>
    	쀽쀽 사이트에서 글을 연재할 경우 조회수에 따라 수익이 발생할 수 있습니다.
        글을 연재하기 위해서는 약관 동의가 필요합니다.
        동의 하시겠습니까?
    </p>

    <div class="text-center">
    	<button id="write_btn" type="button" class="btn btn-primary btn-lg">동의</button>
        <button id="close_btn" type="button" class="btn btn-danger btn-lg">닫기</button>
    </div>

    <script>
        var base = $('#test_page').parents('.modal_popup');

        $('#write_btn', base).on('click', function() {
            // 창 닫을때 부모창으로 값 넘기기
            $.modal.getCurrent().close('Y');
        });
        
        $('#close_btn', base).on('click', function() {
            // 창 닫을때 부모창으로 값 넘기기
            $.modal.getCurrent().close('X');
        });
    </script>
</div>
</body>
</html>