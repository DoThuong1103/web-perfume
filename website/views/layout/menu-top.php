<?php
	$query = "select * from brands where brandStatus=1";
	$result = $con->query($query);
?>

<div class='menu-top-left'>
    <img src="image/Logo1.png" alt="">
</div>
<section class='menu-top-center'>
	<form class='menu-top-center-tl menu-top-center-mb'>
	<input type="hidden" name="option" value="search">
    <div class='searchMenu ' id='main1' > 
        <input class="search-menu" type="search" name="keyword" placeholder='Search...'> 
        <button class="fa fa-search btn-search-menu" type="submit" value="Search"></button> 
    </div>
	</form>
</section>
<i id='menu-open' class="fas fa-bars menu-open"></i>
<div id='menu-top-right' class="menu-top-right">
    <a class='menu-top-list' href="?option=news">Trang chủ</a>
    <a class='menu-top-list' href="?option=cart">Giỏ hàng</a>
    <?php if(empty($_SESSION['user1'])):?>
    <a class='menu-top-list' href="?option=login">Đăng nhập</a>
    <a class='menu-top-list' href="?option=signup">Đăng kí</a>
    <?php else:?>
    <section class='username-menu'><?=$_SESSION['user1']?>&emsp;&emsp;
    <a id='btn-menu' class="btn btn-sm btn-danger" href="?option=logout">Logout</a>
    </section>
    <?php endif;?>
    <i id='menu-close'class="fas fa-times menu-close"></i>
</div>