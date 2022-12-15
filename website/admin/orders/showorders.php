<?php 
	$status=$_GET['status'];
	$query="select*from orders where status=$status";
	$result=$con->query($query);
?>
<h1>ĐƠN HÀNG <?=$status==1?'CHƯA XỬ LÝ':($status==2?'ĐANG XỬ LÝ':($status==3?'ĐÃ XỬ LÝ':'ĐÃ XÓA'))?></h1>
<table class="table table-bordered brandadmin">
	<thead>
		<tr style="background:gray;color: white;">
			<th>STT</th>
			<th>ID</th>
			<th>Ngày tạo</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody >
		<?php $count=1;?>
		<?php foreach ($result as $item ):?>
			<tr style="vertical-align: middle;">
				<td><?=$count++?></td>
				<td><?=$item['id']?></td>
				<td><?=$item['orderdate']?></td>
				<td>
					<a  class="btn btn-sm btn-info" href="?option=orderdetail&id=<?=$item['id']?>">Detail</a>&emsp;&emsp;
					<a  href="?option=order&id=<?=$item['id']?>" style=" display:<?=$status==4?'':'none'?>" class="btn btn-sm btn-danger "
						onclick="return confirm('Bạn có chắc chắn?')">Delete</a>
			</td>
			</tr>
		<?php
			endforeach;
		?>
	</tbody>
</table>