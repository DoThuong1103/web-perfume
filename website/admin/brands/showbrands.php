<?php
	if(isset($_GET['id'])){
		$id=$_GET['id'];
		$products=$con->query("select * from products where brandid=$id");
		if(mysqli_num_rows($products)!=0){
			$con->query("update brands set brandStatus=0 where id=$id");
		}else{
			$con->query("delete from brands where id=$id");
		}

	}
?>

<?php 
	$query="select*from brands";
	$result=$con->query($query);
?>
<section><h1>HÃNG SẢN XUẤT</h1></section>
<section><a href="?option=brandadd" class="btn btn-success ">Thêm hãng</a></section>
<table class="table table-bordered brandadmin">
	<thead>
		<tr style="background: gray; color: white;">
			<th>STT</th>
			<th>Mã hàng</th>
			<th>Tên hãng</th>
			<th>Trạng thái</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody >
		<?php $count=1;?>
		<?php foreach ($result as $item ):?>
			<tr>
				<td><?=$count++?></td>
				<td><?=$item['id']?></td>
				<td><?=$item['brandName']?></td>
				<td><?=$item['brandStatus']==1?'Active':'Unactive'?></td>
				<td><a class="btn btn-sm btn-info" href="?option=brandupdate&id=<?=$item['id']?>">Update</a>  <a class="btn btn-sm btn-danger" href="?option=brand&id=<?=$item['id']?>" onclick="return confirm('Bạn có chắc chắn?')">Delete</a></td>

			</tr>
		<?php
			endforeach;
		?>
	</tbody>
</table>