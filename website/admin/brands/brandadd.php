<?php
	if(isset($_POST['brandName'])){
		$brandName=$_POST['brandName'];
		$query="select * from brands where brandName='$brandName'";
		$status=$_POST['status'];
		$brandStatus=$_POST['brandStatus'];
		if(mysqli_num_rows($con->query($query))!=0){
			$alert="Đã tồn tại tên hãng này!";
		}else{
			$status=$_POST['brandStatus'];
			$con->query("insert brands(brandName, brandStatus) values ('$brandName','$brandStatus')");
			header("location: ?option=brand");
		}
	}
?>
<h1>Thêm hãng</h1><br>
<section class="alerts"><?=isset($alert)?$alert:''?></section>
<section class="container col-md-3">
	<form method="post">
		<section class="form-group" >
			<label>Tên hãng:</label>
		</section><br>
		<section>
			<input name="brandName" class="form-control">
		</section><br>
		<section class="form-group">
			<label>Trạng thái: </label><br><br>
			<input type="radio" name="brandStatus" value="1" checked>Active&emsp;&emsp;
			 <input type="radio" name="brandStatus" value="0">Unactive
		</section><br>
		<section><input type="submit" value="Thêm" class="btn btn-primary">&emsp;&emsp;<input type="button" value="Quay lại" class="btn btn-primary" onclick="location= '?option=brand';"></section>
	</form>
</section>