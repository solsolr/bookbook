<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			$(".slideshow").each(function() {
				// 변수 선언, this = .slideshow
				var $slides = $(this).find("img");
				var slideCount = $slides.length;  // 개수
				var currentIndex = 0;

				$slides.eq(currentIndex).fadeIn(1000,"easeOutBack");  // 나타나기

				setInterval(showNextSlide, 2500); // 함수 호출 setInterval(함수명, 초);  // 1초 간격으로 함수 반복 호출

				function showNextSlide() {
					var nextIndex = (currentIndex+1) % slideCount; // 0-3까지

					$slides.eq(currentIndex).fadeOut(1000);
					$slides.eq(nextIndex).fadeIn(1000);

					currentIndex = nextIndex;
				}
			});
		});
	</script>
	<style>
		/* 초기화 => 공통 css */
		* {
			margin: 0;
			padding: 0;
		}
	
		.slideshow {
			margin: auto;
			width: 1440px;
			overflow: hidden;
			position: relative;
			min-width: 960px;
			height: 380px;	
		}

		.slideshow img {
			position: absolute;
		}
		.slideshow img:first-child{
		z-index:4;
		}.slideshow img:nth-child(2){
		z-index:3;
		}
		.slideshow img:nth-child(3){
		z-index:2;
		}

	</style>
</head>
	
<body>
	
	<div class="slideshow">
		<img src="image/001.png" width="1500" height="350">
		<img src="image/002.png" width="1500" height="350">
		<img src="image/003.png" width="1500" height="350">
		<img src="image/004.png" width="1500" height="350">
		<img src="image/005.png" width="1500" height="350">
	</div>
</body>
</html>