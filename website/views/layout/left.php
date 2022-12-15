<?php
	$query = "select * from brands where brandStatus=1";
	$result = $con->query($query);
?>
<section style="display:<?=$_GET['option']=='news' ||$_GET['option']=='search'?'':'none'?>;">

<h3>Tìm kiếm theo hãng</h3>
<nav class="menu-left btn ">
	<?php foreach($result as $item):?>
		<a class="btn btn-outline-secondary search-name" href="?option=search&brandid=<?=$item['id']?>"><?=$item['brandName']?></a>
	<?php endforeach;?>
</nav>
</section>
	