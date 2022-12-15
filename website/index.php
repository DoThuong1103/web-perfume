<!DOCTYPE html>
<?php
	session_start();
	$con = new MySQLi("localhost","root","","cntt110-php");
?>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Website - PHP</title>
	<link rel="stylesheet" href="css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="icon/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="css/grid.css">
</head>
<body>
<section id="wrapper">
	<nav class="menu-top"><?php include"views/layout/menu-top.php";?></nav>
	<nav class="content">
		<aside class="left"style="box-shadow:<?=$_GET['option']=='news' ||$_GET['option']=='search'?'':'none'?>;"><?php include"views/layout/left.php";?></aside>
		<article>
			<?php include"routes.php";?>
		</article>
		<aside class="right"style="box-shadow:<?=$_GET['option']=='news' ||$_GET['option']=='search'?'':'none'?>;"><?php include"views/layout/right.php";?></aside>
	</nav>
	<footer class='footer'><?php include"views/layout/footer.php";?></footer>
</section>
<script src="./css/script.js"></script>
</body>
</html>
