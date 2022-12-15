<?php
	if(isset($_GET['id'])){
		$id=$_GET['id'];
		$products=$con->query("select * from orderdetail where productid=$id");
		if(mysqli_num_rows($products)!=0){
			$con->query("update products set productStatus=0 where id=$id");

		}
		else{
			$con->query("delete from products where id=$id");
			unlink("../image/".$_GET['productImage']);
		}
	}
?>

<?php 
	$query="select*from products";
	$result=$con->query($query);
?>
<h1>DANH SÁCH SẢN PHẨM</h1>
<section><a href="?option=productadd" class="btn btn-success ">Thêm sản phẩm</a></section>
<table class="table table-bordered brandadmin">
	<thead>
		<tr style="background:gray;color: white;">
			<th>STT</th>
			<th>ID</th>
			<th>Tên</th>
			<th>Giá</th>
			<th>Ảnh</th>
			<th>Trạng thái</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody style="vertical-align: middle;" >
		<?php $count=1;?>
		<?php foreach ($result as $item ):?>
			<tr>
				<td><?=$count++?></td>
				<td><?=$item['id']?></td>
				<td><?=$item['productName']?></td>
				<td><?=number_format($item['productPrice'],0,',','.')?></td>
				<td width="20%"><img height="80%" width="100%" src="../image/<?=$item['productImage']?>"></td>
				<td><?=$item['productStatus']==1?'Active':'Unactive'?></td>
				<td><a class="btn btn-sm btn-info" href="?option=productupdate&id=<?=$item['id']?>">Update</a>&emsp;&emsp;<a class="btn btn-sm btn-danger" href="?option=product&id=<?=$item['id']?>&productImage=<?=$item['productImage']?>" onclick="return confirm('Bạn có chắc chắn?')">Delete</a></td>

			</tr>
		<?php
			endforeach;
		?>
	</tbody>
</table>