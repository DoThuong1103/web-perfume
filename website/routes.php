<?php
if(isset($_GET['option'])):
	switch($_GET['option']):
		case'ordersuccess': include"views/ordersuccess.php";
		break;
		case'order':include"views/order.php";
		break;
		case'home': include"views/home.php"; break;
		case'news': include"views/news.php"; break;
		case'cart': include"views/cart.php"; break;
		case'login': include"views/login.php"; break;
		case'signup': include"views/signup.php"; break;
		case'logout' : unset($_SESSION['user1']); header('location: ?option=news'); break;
		case'search': include"views/search.php"; break;
		case'productdetail': include"views/productdetail.php"; break;
		
	endswitch;
else:
	header('location: ?option=news');
endif;
?>