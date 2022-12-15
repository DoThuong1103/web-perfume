<?php
	$option="news";
	$query = "select*from products where productStatus=1";
	if(isset($_GET['brandid'])):
		$query .= " and brandId=".$_GET['brandid'];
		$option="search&brandid=".$_GET['brandid']
		 ;
		
		elseif(isset($_GET['keyword'])):
		$query .= " and productName like '%".$_GET['keyword']."%'";
		$option="search&keyword=".$_GET['keyword']
		 ;
		
	elseif(isset($_GET['from'])):
		$from = $_GET['from'];
		$to = $_GET['to'];
		$query .= " and productPrice>=$from and productPrice<$to order by productPrice ";
		$option="search&from=".$_GET['from'];
		$option.="&to=".$_GET['to'];
		 ;
		
	endif;
	//$page: xem các sản phẩn ở trang số bao nhiêu 
$page=1;
if(isset($_GET['page'])):
    $page=$_GET['page'];
endif;
//số lượng sản phẩm mỗi trang
$productsperpage =12;
//lấy các sản phẩm chỉ số bao nhiêu trong bảng
$from =($page-1)*$productsperpage;
//tính tổng số trang
$totalProducts = $con->query($query);
$totalPages= ceil(mysqli_num_rows($totalProducts)/$productsperpage);  
//lấy các sản phẩm ở trang hiện thời
$query .=" limit $from ,$productsperpage";
$result = $con->query($query);


?>


<br>
<h1>DANH SÁCH SẢN PHẨM</h1>
<br>

<?php if(mysqli_num_rows($result) == 0):?>
	<section style='min-height: 800px'>Sản phẩm này không có hoặc đã hết hàng!</section>
<?php else:?>
	<br>
	<section class='main-product'>
		<?php foreach ($result as $item ):?>
			<section class="product">
				<section style="height:100px"><a href="?option=productdetail&id=<?=$item['id']?>"><img class="image"  src="image/<?=$item['productImage']?>"></a></section><br>
				<section ><?=$item['productName']?></section>
				<section class="price"><?=number_format($item['productPrice'],0,',','.')?> đ</section><br>
				<section ><input class="btn btn-info btn-buy" type="button" value="Thêm vào giỏ hàng" onclick="location='?option=cart&action=add&id=<?=$item['id']?>';"?></section>
			</section>
		<?php endforeach ?>
	</section>
<?php endif;?>
	<section class="pages "> 
    <?php for($i=1; $i<=$totalPages; $i++):?>
        <a class="<?=(empty($_GET['page'])&&$i==1)||(isset($_GET['page'])&&$_GET['page']==$i)?'highlight':''?>" href="?option=<?=$option?>&page=<?=$i?>" ><?=$i?></a>
    <?php endfor;?>
    </section>

