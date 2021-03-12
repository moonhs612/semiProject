<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" />
<meta charset="UTF-8">
<title>MemberBoard | index</title>
<style>
.left-it{

  flex-wrap:wrap;
  flex-direction: column;
  text-align : right;
  font-size: 15px;
  padding: 15px;
  cursor: pointer;
 
}
</style>
</head>
<body>
	

	<c:choose>
		<c:when test="${sessionScope.loginId != null}">
			
			<div class="grid">
				<div class="left-column">
				<h1> 메인페이지</h1>
				<h3>${sessionScope.loginId}님이 접속중</h3>
				<button onclick="scoreIn('${sessionScope.loginId}')" class="left-it"> 현재 점수등록</button><br>
				<button onclick="location.href='Bview'" class="left-it"> 점수 리스트</button><br>
				<button onclick="location.href='memberLogout'" class="left-it">로그아웃</button><br>
				</div>
				<canvas id="board" class="game-board"></canvas>
				<div class="right-column">
					<div>
						<h1>테트리스</h1>
						<p>
							Score: <span id="score">0</span>
						</p>
						<p>
							Lines: <span id="lines">0</span>
						</p>
						<p>
							Level: <span id="level">0</span>
						</p>
						<canvas id="next" class="next"></canvas>
					</div>
					<div id="sound-div">
						<span class="sound-item" id="sound-speaker"></span> <span
							class="sound-item" id="sound-description"></span>
					</div>
					<button id="play-btn" onclick="play()" class="play-button">시작</button>
					<button id="pause-btn" onclick="pause()" class="play-button">일시정지</button>
					<button onclick="resetGame()" class="play-button">재시작 버튼</button>
				</div>
			</div>
			<script type="text/javascript" src="constants.js"></script>
			<script type="text/javascript" src="board.js"></script>
			<script type="text/javascript" src="piece.js"></script>
			<script type="text/javascript" src="sound.js"></script>
			<script type="text/javascript" src="main.js"></script>
		</c:when>
		
		<c:otherwise>
			<button onclick="Join()">회원가입(JoinForm.jsp)</button>
			<button onclick="Login()">로그인(LoginForm.jsp)</button>
		</c:otherwise>


	</c:choose>


</body>

<script>
	function scoreIn(bId){
		var sCore = account.score; 
		var bId = bId;
		
		location.href="scoreIn?sCore="+sCore+"&bId="+bId;
	}
	
	
	/* 회원가입 페이지 이동 : Join()함수 */
	function Join() {
		location.href = "JoinForm.jsp";
	}

	/* 로그인 페이지 이동 : Login()함수 */
	function Login() {
		location.href = "LoginForm.jsp";
	}

	// 로그인 성공페이지로 이동 : LoginSuccess() 함수
	function LoginSuccess() {
	
		location.href = "LoginSuccess.jsp";
	}
	
	function resetGame() {
		  account.score = 0;
		  account.lines = 0;
		  account.level = 0;
		  board.reset();
		  time = { start: performance.now(), elapsed: 0, level: LEVEL[account.level] };
		}
	
	const moves = {
			  [KEY.LEFT]: (p) => ({ ...p, x: p.x - 1 }),
			  [KEY.RIGHT]: (p) => ({ ...p, x: p.x + 1 }),
			  [KEY.DOWN]: (p) => ({ ...p, y: p.y + 1 }),
			  [KEY.SPACE]: (p) => ({ ...p, y: p.y + 1 }),
			  [KEY.UP]: (p) => board.rotate(p, ROTATION.RIGHT),
			  [KEY.Q]: (p) => board.rotate(p, ROTATION.LEFT)
			};
	
	
	function gameOver() {
		  cancelAnimationFrame(requestId);

		  ctx.fillStyle = 'black';
		  ctx.fillRect(1, 3, 8, 1.2);
		  ctx.font = '1px Arial';
		  ctx.fillStyle = 'red';
		  ctx.fillText('GAME OVER', 1.8, 4);
		  
		  sound.pause();
		  finishSound.play();
		  checkHighScore(account.score);

		  document.querySelector('#pause-btn').style.display = 'none';
		  document.querySelector('#play-btn').style.display = '';
		}
	 
	
</script>

</html>