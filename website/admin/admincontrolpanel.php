<?php 	
	$chuaXuLy=mysqli_num_rows($con->query("select*from orders where status=1"));
	$dangXuLy=mysqli_num_rows($con->query("select*from orders where status=2"));
	$daXuLy=mysqli_num_rows($con->query("select*from orders where status=3"));
	$Huy=mysqli_num_rows($con->query("select*from orders where status=4"));
?>

<table class="table table-bordered tbl-admin">
	<tbody>
		<tr>
			<td style="background:gray; color: white;font-size: 20px;" width="16%" height="100px" >Hello: <a style=" font-weight: bold;font-size: 30px; bod"><?=$_SESSION['admin']?></a><br><a href="?option=logout" class="btn btn-sm btn-danger">Logout</a></td>
			<td style="background:gray;color: white;"><h1 style="font-size:60px">ADMIN CONTROLPANEL<h1></td>
		</tr>
		<tr>
			<td style="background:gray;">
				<section><a class="btn btn-sm btn-info" href="?option=brand" >>>> Hãng sản xuất</a></section><hr>
				<section><a class="btn btn-sm btn-info" href="?option=product" >>>> Sản phẩm</a></section><hr>
				<section><a style="color:white;">>>> Đơn hàng</a>
					
					<section><br><a class="btn btn-sm btn-info" href="?option=order&status=1">>> Đơn hàng chưa xử lý[<span style="color:red"><?=$chuaXuLy?></span>]</a></section><br>
					<section><a class="btn btn-sm btn-info" href="?option=order&status=2" >>> Đơn hàng đang xử lý[<span style="color:red"><?=$dangXuLy?></span>]</a></section><br>
					<section><a class="btn btn-sm btn-info" href="?option=order&status=3">>> Đơn hàng đã xử lý[<span style="color:red"><?=$daXuLy?></span>]</a></section><br>
					<section><a class="btn btn-sm btn-info" href="?option=order&status=4">>> Đơn hàng bị hủy[<span style="color:red"><?=$Huy?></span>]</a></section>
				</section>
			</td>
			<td>
				<?php
					if(isset($_GET['option'])){
						switch($_GET['option']){
							case'logout':
							unset($_SESSION['admin']);
							header("location: .");
							break;
							case'brand':
							include"brands/showbrands.php";
							break;
							case'brandadd':
							include"brands/brandadd.php";
							break;
							case'brandupdate':
							include"brands/brandupdate.php";
							break;
							case'product':
							include"products/showproduct.php";
							break;
							case'productadd':
							include"products/productadd.php";
							break;
							case'productupdate':
							include"products/productupdate.php";
							break;
							case'order':
							include"orders/showorders.php";
							break;
							case'orderdetail':
							include"orders/orderdetail.php";
							break;

						}
					}
				?>
			</td>
		</tr>
	</tbody>	
</table>