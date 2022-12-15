 <?php
	if(isset($_POST['content'])):
		$content=$_POST['content'];
		$productid=$_GET['id'];
		if(isset($_SESSION['user1'])):
			$query="select * from users where username='".$_SESSION['user1']."'";
			$result=$con->query($query);
			$userid=mysqli_fetch_array($result);
			$userid=$userid['id'];
			$con->query("insert comments (userid, productid,date,content) values('$userid','$productid', now(), '$content' )");
			header("Refresh:0");
			else:
			$_SESSION['content']=$content;
			echo"<script>alert('Your must login to comment!'); location='?option=login&productid=$productid';</script>";

		endif;
		
	endif;
?>

<?php
 if(isset($_GET['id'])):
 	$query = "select *from products where id=".$_GET['id'];
 	$result = $con->query($query);
 	$item = mysqli_fetch_array($result);
 endif;
?>
<section>
	<br>
	<h1 >Chi tiết sản phẩm</h1>
	<hr>
	<h2><?=$item['productName']?></h2>
	<hr>
	<section>
				<section class='productdetail-img'><img width="50%" src="image/<?=$item['productImage']?>"></section>
				<section class="price"><?=number_format($item['productPrice'],0,',','.')?> đ</section><br>
				<section><input class="btn btn-info" type="button" value="Thêm vào giỏ hàng" onclick="location='?option=cart&action=add&id=<?=$item['id']?>';"></section>
			</section>
	<hr>
	<section style="text-align:left"><?=$item['productDescription']?></section>
	<hr>
	<section style="text-align:left;">
		<h2 >Comments:</h2>
		<?php
			$query="select* from users a join comments b on a.id=b.userid join products c on b.productid=c.id where b.status=1 and productid=".$_GET['id'];
			$comments=$con->query($query);
			if(mysqli_num_rows($comments)==0):
				echo"<section>No comments!</section>";
			else:
				foreach ($comments as $comment ):
		?>
		<div class="comments">

			<div class='comment-main'>
				<section style="font-weight: bold;"><?=$comment['fullname']?>:</section>
				<section class='comment__content'><?=$comment['content']?></section>
			</div>
		</div>

		<?php 
				endforeach;
			endif;
		?>
		<form method="post">
			<section>
			<textarea class='comment_productdetail'  name="content" rows="3" placeholder="Write comment here..."></textarea>
		</section>
		<section><input class='btn btn-info' type="submit" value="Submit"></section>
		</form>
	</section>
</section>