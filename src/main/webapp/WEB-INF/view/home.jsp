<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Kona Coffee</title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
</head>
<body>
	<div class="container">
		<h1>Kona Coffee</h1>
		<p>美味しいコーヒー☕️を「粉」で手軽に楽しもう！</p>
		<ul>
			<li><a href="#howto">美味しいコーヒーの入れ方</a></li>
			<li><a href="#recommended">オススメの粉コーヒー</a></li>
		</ul>
		<hr>
		<h2 id="howto">美味しいコーヒーの入れ方</h2>
		<!-- ここに美味しいコーヒーの入れ方を掲載する -->
		<h2 id="recommended">オススメの粉コーヒー</h2>
		<!-- データベースからコーヒーリストを取得・表示する -->
	</div>
</body>
</html>