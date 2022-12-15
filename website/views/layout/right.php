<?php
	$query = "select*from prices where pricesStatus=1";
	$result = $con->query($query);
?>
<section style="display:<?=$_GET['option']=='news' ||$_GET['option']=='search'?'':'none'?>;">
<h3>Tìm kiếm theo giá</h3>
<nav class="menu-right ">
	<?php foreach($result as $item):?>	
	<a class="btn btn-outline-secondary price-menu" href="?option=search&from=<?=$item['pricesFrom']?>&to=<?=$item['pricesTo']?>"><?=number_format($item['pricesFrom'],0,',','.').' - '.number_format($item['pricesTo'],0,',','.')?></a>
	<?php endforeach;?>
</nav>

<br>
</section>
	

